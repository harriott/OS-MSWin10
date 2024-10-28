# vim: set fdl=1:

# $MSWin10\pyenv-win.ps1

# Joseph Harriott, jeu 25 juil 2024

# process advised in  https://github.com/pyenv-win/pyenv-win.git

#=> 1 get pyenv-win
git clone https://github.com/pyenv-win/pyenv-win.git "$HOME/.pyenv"

#=> 2 environment variables
# PYENV  PYENV_HOME  PYENV_ROOT
[System.Environment]::SetEnvironmentVariable('PYENV',$env:USERPROFILE + "\.pyenv\pyenv-win\","User")
[System.Environment]::SetEnvironmentVariable('PYENV_ROOT',$env:USERPROFILE + "\.pyenv\pyenv-win\","User")
[System.Environment]::SetEnvironmentVariable('PYENV_HOME',$env:USERPROFILE + "\.pyenv\pyenv-win\","User")
# will need to launch a new WT to see them with  gci env:

#=> 3 PATH
[System.Environment]::SetEnvironmentVariable('path', $env:USERPROFILE + "\.pyenv\pyenv-win\bin;" + $env:USERPROFILE + "\.pyenv\pyenv-win\shims;" + [System.Environment]::GetEnvironmentVariable('path', "User"),"User")
# will need to launch a new WT to see them with  $env:Path -split ';'

