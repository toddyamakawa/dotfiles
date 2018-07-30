#!/usr/bin/env bash
dummy='''
'
exec /arm/tools/setup/bin/mrun +python/python/3.6.1 python $0 ${1+"$@"}
'
'''
#!/usr/bin/env python

import platform

from argparse import ArgumentParser
from functools import wraps
from inspect import getfullargspec as getargs
from os.path import dirname, abspath
from time import time

script = abspath(__file__)
script_dir = dirname(script)

# --- CLI Wrapper ---
class CLI(object):
	functions = {}
	def __init__(self, function):
		self.function = function
		self.functions[function.__name__] = function
	def __call__(self, *args, **kwargs):
		f = self.function
		print('<%(func)s> args="%(args)s" kwargs="%(kwargs)s"' % {'func':str(f.__name__), 'args':str(*args), 'kwargs':str(**kwargs)})
		print('<%s> called at ' % f.__name__ + str(time()))
		f(*args, **kwargs)
		print('<%s> finished at ' % f.__name__ + str(time()))

@CLI
def hello(name = 'World', *args, **kwargs):
	""" Say hello to 'name'

	:param name: Name
	:type  name: String
	"""
	print('Hello ' + name)

@CLI
def goodbye(name = 'World', *args, **kwargs):
	""" Say goodbye to 'name'

	:param name: Name
	:type  name: String
	"""
	print('Goodbye ' + name)

# --- Argument Parser ---
parser = ArgumentParser()
parser.add_argument('-v', '--verbose', action='count', help='set verbosity level')
subparsers = parser.add_subparsers(help="Command Help")
docstr = CLI.functions['hello'].__doc__

# Add function information to parser
for name in CLI.functions:
	function = CLI.functions[name]
	doc = function.__doc__
	subparser = subparsers.add_parser(name, description=doc, help=doc.splitlines()[0])
	subparser.set_defaults(func=function)
	argspec = getargs(function)
	for arg in argspec.args:
		subparser.add_argument("--%s" % (arg))

# Parse arguments
args = parser.parse_args()

# Get verbosity
if args.verbose != None:
	print("running with verbosity " + str(args.verbose))
	print('python ' + platform.python_version())

# Run subcommand
try:
	args.func(**vars(args))
except AttributeError:
	parser.print_help()

