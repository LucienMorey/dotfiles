import subprocess, dotbot

class Snap(dotbot.Plugin):
    _directive = 'snap'


    def can_handle(self, directive):
        return self._directive == directive

    def handle(self, directive, data):
        if directive != self._directive:
            raise ValueError('snap cannot handle directive %s' %
                directive)
        
        success = True

        for app in data:
            if 'app' in app:
                print('thinks there is an app field')
                if 'classic' in app and app['classic'] is True:
                    print('thinks there is a classic field')
                    try:
                        print('snap install ' + app['app'] + ' --classic')
                        subprocess.run(
                        ['snap install ' + app['app'] + ' --classic'], 
                        shell=True, 
                        check=True)
                    except subprocess.CalledProcessError:
                         success = False
                else:
                    try:
                        subprocess.run(
                        ['snap install ' + app], 
                        shell=True, 
                        check=True)
                    except subprocess.CalledProcessError:
                        success = False 
            else:
                try:
                    subprocess.run(
                        ['snap install ' + app], 
                        shell=True, 
                        check=True)
                except subprocess.CalledProcessError:
                    success = False

        if success:
            self._log.info('All packages have been installed')
        else:
            self._log.error('Some packages were not successfully installed')
        return success
