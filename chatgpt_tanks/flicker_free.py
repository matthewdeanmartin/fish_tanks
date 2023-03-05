"""
Had to get stackoverflow answer
https://stackoverflow.com/questions/54409924/curses-error-addwstr-returned-err-on-changing-nlines-to-1-on-newwin-method

Bug 1- ocean surface on bottom, other was top.
Bug 2- Ocean emoji is 2 bytes.

Done!
"""
import random
import curses

# Initialize curses
stdscr = curses.initscr()
curses.start_color()
curses.use_default_colors()
curses.noecho()
curses.curs_set(0)
stdscr.keypad(1)
stdscr.nodelay(1)


# Fish characters
fish = ["🐟", "🐠", "🦈", "🐙", "🐋"]

# Initial positions for the fish
fish_pos = [[random.randint(0, curses.COLS-1), random.randint(0, curses.LINES-1)] for _ in range(5)]

while True:
    # Clear the screen
    stdscr.clear()
    # Print the ocean
    for i in range(curses.COLS):
        try:
            # stdscr.addstr(curses.LINES - 1, i, "X")  # 🌊
            stdscr.addstr(0, i*2, "🌊")  # 🌊
        except curses.error:
            pass

    # Print the fish in their current positions
    for i, pos in enumerate(fish_pos):
        try:
            stdscr.addstr(pos[1], pos[0], fish[i])
        except curses.error:
            pass

    # Move the fish
    for i, pos in enumerate(fish_pos):
        pos[0] += random.randint(-1, 1)
        pos[1] += random.randint(-1, 1)
        # Wrap around if the fish goes off the screen
        pos[0] = pos[0] % curses.COLS
        pos[1] = pos[1] % curses.LINES
    # Refresh the screen
    stdscr.refresh()
    # Sleep for a short time
    curses.napms(100*5)
