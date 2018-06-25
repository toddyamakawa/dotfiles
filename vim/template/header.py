#!/usr/bin/env bash
dummy='''
'
exec /arm/tools/setup/bin/mrun +python/python/3.6.1 python $0 ${1+"$@"}
'
'''
#!/usr/bin/env python

import platform

print('python ' + platform.python_version())

