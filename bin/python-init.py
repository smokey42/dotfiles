#!/usr/bin/env python
# encoding: utf-8
#
# Usage: Set PYTHON_STARTUP to the location of this file

import os
historyPath = os.path.expanduser('~/.pythistory')

try:
    import readline

    if os.path.exists(historyPath):
        readline.read_history_file(historyPath)

    import atexit

    @atexit.register
    def save_history(historyPath=historyPath):
        readline.write_history_file(historyPath)

    import rlcompleter

    readline.parse_and_bind("tab: complete")
    rlcompleter # pyflakes

    del rlcompleter
    del save_history
    del historyPath
    del atexit
except ImportError:
    print("Tab completion not available. Install readline?")

import sys
import pprint
sys.displayhook = lambda stuff: pprint.pprint(stuff, width=160)

# Some convenience modules from here...

from datetime import datetime, date, timedelta
datetime, date, timedelta
