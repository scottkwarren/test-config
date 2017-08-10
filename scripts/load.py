import json
import os



class ConfigDB :
    
    def __init__(self, machineName, appName):
        self.loadMachine(machineName)
        self.loadApp(appName)
        self.loadPackages()

    def loadMachine(self, machineName) :
        self.machine = self.load_json("machines", machineName)

    def loadApp(self, appName) :
        self.app = self.load_json("apps", appName)

    def loadPackages(self) :
        self.pkgs = dict()
        self.pkgs.update( self.load_json("packages", "slurm") )

    def load_json(self, kind, basename) :
        return json.load( os.popen("cpp -P -E {0}/{1}.json".format(kind, basename)) )





db = ConfigDB("les", "namd2")

print json.dumps(db.machine, sort_keys=True, indent=4)

print "C compiler kinds: ", db.machine["c compiler"].keys()
print "Gnu C compiler versions: ", db.machine["c compiler"]["gnu"].keys()


