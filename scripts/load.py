import json
import os


machine = json.load( os.popen("grep -v '^#' machines/bluebiou.json") )

print json.dumps(machine, sort_keys=True, indent=4)

print "C compiler kinds: ", machine["c compiler"].keys()
print "Gnu C compiler versions: ", machine["c compiler"]["gnu"].keys()
