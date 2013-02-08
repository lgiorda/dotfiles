if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

##
# Your previous /Users/ken.kouot/.bash_profile file was backed up as /Users/ken.kouot/.bash_profile.macports-saved_2013-01-17_at_11:30:39
##

# MacPorts Installer addition on 2013-01-17_at_11:30:39: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

