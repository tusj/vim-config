import vim
from os.path import commonprefix

# cursor position compatible with getpos
def pos(row, col):
	return "[0, %d, %d, 0]" % (row, col)

def getcol(i):
	ret = []
	for row in vim.current.buffer:
		if i < len(row):
			ret.append(row[i])
		else:
			ret.append("\0")

	return "".join(ret)

def get_cursor():
	(cursor_row, cursor_col) = vim.current.window.cursor
	cursor_row               = cursor_row - 1
	return (cursor_row, cursor_col)

# Finds the biggest sub row matching either above
# or below witht the same content, starting at (row, col)
def find_region_horizontal():
	(row, col) = get_cursor()

	buf        = vim.current.buffer
	match_with = buf[row]

	# Check if it is valid to match above or below
	match_above = row > 0
	match_below = row < len(buf)
	above_end   = below_end = col

	# Set the maximum index, and if valid
	# find the last common index above and below
	if match_above:
		above      = buf[row-1]
		max_above  = min(len(above), len(match_with))

		if col < max_above:
			above_end = col + len(commonprefix([above[col:], match_with[col:]]))

	if match_below:
		below      = buf[row+1]
		max_below  = min(len(below), len(match_with))

		if col < max_below:
			below_end = col + len(commonprefix([below[col:], match_with[col:]]))

	# find the first common index above and below
	above_start = col - len(commonprefix([(above[:col])[::-1], (match_with[:col])[::-1]]))
	below_start = col - len(commonprefix([(below[:col])[::-1], (match_with[:col])[::-1]]))

	# return the longest common range of above and below
	above_range = above_end - above_start
	below_range = below_end - below_start

	range       = above
	region      = (above_start, above_end)

	if below_range > above_range:
		range   = below
		region  = (below_start, below_end)

	return region

# Find the index of the biggest uniform sub column from (row, col):
def find_region_vertical():
	(row, col)  = get_cursor()

	column      = getcol(col)
	char        = column[row]

	# Separate the parts of the column
	above       = (column[:row])[::-1]
	below       = column[row:]

	# Find the longest common part
	above_start = row - len(commonprefix([above, len(above) * char]))
	below_end   = row + len(commonprefix([below, len(below) * char]))

	print("above_start, below_end: %d, %d" % (above_start, below_end))

	return (above_start, below_end)

# Checks if a sub row is equal to match_with
def match_horizontal(row, start_col, match_with):

	line    = vim.current.buffer[row]
	end_col = start_col + len(match_with)

	if end_col < len(line):
		return line[start_col:end_col] == match_with

	return False

# Checks if a vertical sub column is only containing the same character
def match_vertical(col, start_row, end_row):

	col = getcol(col)

	if end_row < len(col):
		sub = col[start_row:end_row]
		return sub == len(sub) * sub[0]

	return False

	# Searches from row /column 'begin' to row / column 'end'
	# not stopping before the 'matcher' fails.
	# Returns the row / column end point before the matcher failed
	# or the start if the start failed
	# The check parameters are static parameters delegated to
	# the 'matcher'
def search(begin, end, checks, matcher):
	stop = begin
	for i in range(begin, end, 1 if end > begin else -1 ):

		if not matcher(i, *checks):
			return stop
		else:
			stop = i
	return stop

def make_region(finder, search_start, last, make_checks, matcher, make_points, outer):
	points    = finder()
	checks    = make_checks(*points)
	begin     = search(search_start,   -1, checks, matcher)
	end       = search(search_start, last, checks, matcher)
	points    = make_points(begin, end, *points)
	mode      = "\\<C-v>"
	if outer:
		mode  = "V"

	vim.command("return [\"%s\",%s, %s]" % ((mode,) + (points)))

def posser(head, tail):
	return (pos(*head), pos(*tail))

def make_points_vertical(begin, end, point_start, point_end):
	head = (point_start + 1, begin + 1)
	tail = (point_end, end + 1)
	return posser(head, tail)

def make_points_horizontal(begin, end, point_start, point_end):
	head = (begin + 1, point_start + 1)
	tail = (end + 1, point_end)
	return posser(head, tail)

def make_checks_vertical(point_start, point_end):
	return (point_start, point_end)

def make_checks_horizontal(point_start, point_end):
	(cursor_row, _) = get_cursor()
	buf             = vim.current.buffer
	return (point_start, buf[cursor_row][point_start:point_end])


def find_block(vertical = True, outer = False):
	(cursor_row, cursor_col) = get_cursor()
	buf                      = vim.current.buffer

	if vertical:
		last                 = len(max(buf, key       = len))
		finder               = find_region_vertical
		search_start         = cursor_col
		matcher              = match_vertical
		make_points          = make_points_vertical
		make_checks          = make_checks_vertical
	else:
		last                 = len(buf)
		finder               = find_region_horizontal
		search_start         = cursor_row
		matcher              = match_horizontal
		make_points          = make_points_horizontal
		make_checks          = make_checks_horizontal

	make_region(finder, search_start, last, make_checks, matcher, make_points, outer)
