# ssh-agent-locker

ssh-agent-locker is a simple application that kills ssh-agent whenever the keychain is locked

## Installation

To install ssh-agent-locker download the source, compile, copy it to /usr/local/bin and install the launchd script
    
## Basic Usage

ssh-agent is used to manage and securely store ssh key pass phrases. In OS X Lion if the login keychain is set to lock on sleep, the ssh-agent becomes confused. Instead of asking to unlock the login keychain and using the stored password from that, it instead asks for the ssh key pass phrase. If the ssh-agent is killed off after the keychain is locked, the process spawned as a result of further requests acts properly (asking to unlock the keychain).

## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Commit, do not mess with version, or history.
* Send me a pull request. Bonus points for topic branches.
