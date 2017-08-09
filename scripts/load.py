import json
import os


def load_json(kind, basename):
    return json.load( os.popen("cpp -P -E {0}/{1}.json".format(kind, basename)) )


class ConfigDB :
    
    def __init__(self, machineName, appName):
        self.machine = load_json("machine", "bluebiou")
        self.app     = load_json("app", "namd2")






machine = load_json("machine", "bluebiou")

print json.dumps(machine, sort_keys=True, indent=4)

print "C compiler kinds: ", machine["c compiler"].keys()
print "Gnu C compiler versions: ", machine["c compiler"]["gnu"].keys()


