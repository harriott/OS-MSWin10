
# Joseph Harriott - https://harriott.github.io/

# once  $Env:Computername,  APS> . $MSwin10\mb\symlinks-mostly.ps1

function endi { if ( ! ( test-path $args[0] ) ) { md $args[0] } } # ensure directory
function syli { ni $args[1] -type symboliclink -value $args[0] -force } # symbolic link

# #=> Emacs
# # $Ed = "$Env:AppData\.emacs.d"; if ( ! ( test-path "$Ed" ) ) { ni -path "$Ed" -type directory }
# $Ed = "$Env:AppData\.emacs.d"; endi $Ed
# ni $Ed\custom.el -type symboliclink -value $misc\CP\emacs\custom.el -force
# ni $Ed\diary -type symboliclink -value $core\TextNotes\Emacs\diary -force
# ni $Ed\early-init.el -type symboliclink -value $misc\CP\emacs\early-init.el -force
# ni $Ed\harriott-zenburn-emacs -type symboliclink -value $onGH\harriott-zenburn-emacs -force
# ni $Ed\init.el -type symboliclink -value $misc\CP\emacs\init.el -force
# ni $Ed\lisp -type symboliclink -value $misc\CP\emacs\lisp -force

# #=> ~\.gitconfig
# ni ~\.gitconfig -type symboliclink -value $machBld\gitconfig -force

# #=> gokcehan lf configuration
# ni ~\AppData\Local\lf\colors -type symboliclink -value $MSWin10\lf\colors -force
# ni ~\AppData\Local\lf\lfrc -type symboliclink -value $MSWin10\lf\lfrc -force
# ni ~\AppData\Local\lf\icons -type symboliclink -value $MSWin10\lf\icons -force

# #=> LaTeX
# ni $Env:AppData\MiKTeX\tex\latex\jo -type symboliclink -value $CrPl\documenting\LaTeX\jo -force
# #  after changes:  initexmf --update-fndb
# #  ii "$Env:AppData\MiKTeX\tex\latex\jo"
# #  sl $Env:AppData\MiKTeX\tex\latex

# #=> Node.js
# md ~\AppData\Roaming\npm

# #=> Pandoc\defaults
# # $Pd = "$Pandoc\defaults"; if ( ! ( test-path "$Pd" ) ) { ni -path "$Pd" -type directory }
# $Pd = "$Pandoc\defaults"; endi $Pd
# ni "$Pd\md4pdfToC.yaml" -type symboliclink -value $MD4PDF\defaults-toc.yaml -force
# ni "$Pd\md4pdf.yaml" -type symboliclink -value $MD4PDF\defaults.yaml -force

# #=> Pandoc\templates
# # $Pt = "$Pandoc\templates"; if (test-path $Pt) {$(get-item $Pt).Delete()}
# $Pt = "$Pandoc\templates"; endi $Pt
# ni "$Pt" -type symboliclink -value $onGH\pandoc-templates -force

# #=> PSProfile
# cpi $MSWin10\MPSProfile.ps1 ~\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
# $DWP = "~\Documents\WindowsPowerShell"
# # if ( ! ( test-path "$DWP" ) ) { ni -path "$DWP" -type directory }
# endi $DWP
# cpi $MSWin10\MPSProfile.ps1 ~\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
# ni ~\Env.ps1 -type symboliclink -value $MSWin10\Env.ps1 -force
# ni ~\PSProfile.ps1 -type symboliclink -value $MSWin10\PSProfile.ps1 -force

# #=> Ruby
# cpi $onGH\misc\irbrc ~\.irbrc

# #=> vim flavours - minimap
# cp $ITscc\forMSWin\code-minimap-v0.6.7-x86_64-pc-windows-msvc\code-minimap.exe ~\AppData\Local\Microsoft\WindowsApps\code-minimap.exe

# #=> vim flavours - nvim
# $nvim = "~\AppData\Local\nvim"
# ri -path $nvim -recurse; md $nvim\pack; md $nvim\plugin

# syli $vimfiles/vim/after             $nvim/after
# syli $vimfiles/vim/filetype.vim      $nvim/filetype.vim
# syli $vimfiles/vim/ftplugin          $nvim/ftplugin
# syli $vimfiles/nvim/init.vim         $nvim/init.vim
# syli $vimfiles/nvim/lua              $nvim/lua
# syli $vimfiles/vim/packs-cp          $nvim/pack/packs-cp
# syli $vimfiles/vim/packs-unix        $nvim/pack/packs-unix
# syli $vimfiles/vim/plugin/packs.vim  $nvim/plugin/packs.vim
# syli $vimfiles/vim/plugin/plugin.vim $nvim/plugin/plugin.vim
# syli $vimfiles/vim/spell             $nvim/spell
# syli $vimfiles/vim/syntax            $nvim/syntax
# syli $vimfiles/vim/thesaurus         $nvim/thesaurus

#=> vim flavours - vim
ri -path ~\vimfiles -recurse; md ~\vimfiles\pack

syli $vimfiles/vim/after                ~/vimfiles/after
syli $vimfiles/vim/enter/Win10Paths.vim ~/vimfiles/Win10Paths.vim
syli $vimfiles/vim/ftplugin             ~/vimfiles/ftplugin
syli $vimfiles/vim/packs-cp             ~/vimfiles/pack/cp
syli $vimfiles/vim/packs-unix           ~/vimfiles/pack/unix
syli $vimfiles/vim/packs-win64          ~/vimfiles/pack/win64
syli $vimfiles/vim/plugin/packs.vim     ~/vimfiles/plugin/packs.vim
syli $vimfiles/vim/plugin/packsVim.vim  ~/vimfiles/plugin/packsVim.vim
syli $vimfiles/vim/plugin/plugin.vim    ~/vimfiles/plugin/plugin.vim
syli $vimfiles/vim/spell                ~/vimfiles/spell
syli $vimfiles/vim/syntax               ~/vimfiles/syntax
syli $vimfiles/vim/thesaurus            ~/vimfiles/thesaurus
syli $vimfiles/vim/filetype.vim         ~/vimfiles/filetype.vim

# g $home\vimfiles

# #=> vim flavours - test
# ri -path ~\vimtest -recurse
# md ~\vimtest\pack\packs-cp\opt
# md ~\vimtest\pack\packs-win64\opt
# md ~\vimtest\plugin

# syli $vimfiles/test/filetype.vim              ~/vimtest/filetype.vim
# syli $vimfiles/test/plugin.vim                ~/vimtest/plugin/plugin.vim
# syli $vimfiles/test/plugins.vim               ~/vimtest/plugin/plugins.vim
# syli $vimfiles/test/vimrc.vim                 ~/vimtest/vimrc.vim
# syli $vimfiles/vim/enter/Win10Paths.vim       ~/vimtest/Win10Paths.vim
# syli $vimfiles/vim/packs-cp/opt/bufferize.vim ~/vimtest/pack/packs-cp/opt/bufferize.vim
# syli $vimfiles/vim/packs-cp/opt/fzf.vim       ~/vimtest/pack/packs-cp/opt/fzf.vim
# syli $vimfiles/vim/packs-cp/opt/vim-markdown  ~/vimtest/pack/packs-cp/opt/vim-markdown
# syli $vimfiles/vim/packs-cp/opt/vim-dokuwiki  ~/vimtest/pack/packs-cp/opt/vim-dokuwiki
# syli $vimfiles/vim/packs-cp/opt/vim-bbcode    ~/vimtest/pack/packs-cp/opt/vim-bbcode
# syli $vimfiles/vim/packs-win64/opt/fzf        ~/vimtest/pack/packs-win64/opt/fzf

# # g $home\vimtest

# #=> ~\.bashrc
# ni ~\.bashrc -type symboliclink -value $MSWin10\bashrc -force

