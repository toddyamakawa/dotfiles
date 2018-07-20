#!/usr/bin/env bash
dummy='''
'
exec /arm/tools/setup/bin/mrun +python/python/3.6.1 python $0 ${1+"$@"}
'
'''
#!/usr/bin/env python

import platform

from argparse import ArgumentParser
from os.path import dirname, abspath
from time import time

script = abspath(__file__)
script_dir = dirname(script)

# --- Argument Parser ---
parser = ArgumentParser()
parser.add_argument('-v', '--verbose', action='count', help='set verbosity level')
args = parser.parse_args()

# Get verbosity
if args.verbose != None:
	print("running with verbosity " + str(args.verbose))
	print('python ' + platform.python_version())

# --- Decorator ---
def decorator(function):
	def wrapper():
		print(str(time()) + ' calling ' + str(function))
		function()
		print(str(time()) + ' dont ' + str(function))
	print('Created decorator for ' + str(function))
	return wrapper

@decorator
def hi():
	print('hello world')

hi()


