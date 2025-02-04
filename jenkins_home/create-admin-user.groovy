import jenkins.model.*
import hudson.security.*
import java.nio.file.*

def env = new File('.env').text.split('\n').collectEntries { line ->
    def (key, value) = line.split('=')
    [(key): value]
}

def instance = Jenkins.getInstance()

def hudsonRealm = new HudsonPrivateSecurityRealm(false)
hudsonRealm.createAccount(env['ADMIN_USERNAME'], env['ADMIN_PASSWORD'])
instance.setSecurityRealm(hudsonRealm)

def strategy = new FullControlOnceLoggedInAuthorizationStrategy()
instance.setAuthorizationStrategy(strategy)
instance.save()