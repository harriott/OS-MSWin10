
# Joseph Harriott - https://harriottgithubio/ - sam 25 oct 2025

# once  $Cn, APS> . $MSn/set/3.ps1

# csl, endi & syli  defined in  $MSn/PS/Profile.ps1

csl ~\PSProfile.ps1

# #=> $notDr
# endi $notDr/GR-NF
# endi $notDr/GRs
# syli $misc/notDr/notDr.md $notDr/readme.md
# syli $misc/notDr/NF.md $notDr/GR-NF/readme.md

# #=> Disk Usage v1.62
# cpi $cITcc\forMSWin\DiskUsage\du64.exe $HADL\Microsoft\WindowsApps

# #=> Emacs
# $Ed = "$HADR\.emacs.d"; endi $Ed
#   syli $misc\CP\emacs\custom.el $Ed\custom.el
#   syli $core\TextNotes\Emacs\diary $Ed\diary
#   syli $misc\CP\emacs\early-init.el $Ed\early-init.el
#   syli $onGH\zenburn-emacs $Ed\zenburn-emacs
#   syli $misc\CP\emacs\init.el $Ed\init.el
#   syli $misc\CP\emacs\lisp $Ed\lisp
#     bat $HADR\.emacs.d\early-init.el
#     csl $HADR\.emacs.d

# #=> ExifTool v13.39
# $ET =  "$cITcc\forMSWin\imagey\exiftool-13_39_64"
# cpi "$ET\exiftool(-k).exe" $HADL\Microsoft\WindowsApps\exiftool.exe
# cpi -recurse "$ET\exiftool_files" $HADL\Microsoft\WindowsApps -force
# robocopy /mir $ET\exiftool_files $HADL\Microsoft\WindowsApp\exiftool_filess

#=> gokcehan lf configuration
syli $MSn\lf\colors $HADR\lf\colors
syli $MSn\lf\icons $HADR\lf\icons
syli $MSn\lf\lfrc $HADR\lf\lfrc
  csl $HADL\lf

# #=> C:\Lua (in path)
# robocopy /mir $cITcc\forMSWin\LuaBinaries\lua-5_4_2_Win64_bin C:\Lua
#   cpi $cITcc\forMSWin\luarocks-3_12_2-windows-64\* C:\Lua

# #=> MiKTeX
# syli $cITCP\documenting\LaTeX\jo $tex\latex\jo
# #  after changes:  miktex fndb refresh
# #  ii "$tex\latex\jo"
# #  sl $tex\latex
#   csl $tex\latex

# #=> Mozilla Thunderbird safely
# syli $MSn\Thb\clearWin10ProLock.ps1 C:\MT-clearWin10ProLock.ps1
#   csl C:\MT-clearWin10ProLock.ps1
# syli $MSn\Thb\runSafely.ps1 C:\MT-runSafely.ps1
#   csl C:\MT-runSafely.ps1

# #=> mpv.conf
# syli $misc/CP/mpv.conf $HADR/mpv/mpv.conf

# #=> mpv.exe (daily)
# # https://github.com/zhongfly/mpv-winbuild/releases
# cpi $cITcc/forMSWin/AV/mpv-x86_64-v3-20251022-git-99d6d4c/mpv.exe $HADL\Microsoft\WindowsApps

# #=> Node.js
# endi $HADR\npm

# #=> Pandoc m4p
# endi $tex\latex\m4p

# #=> Pandoc\defaults
# $Pd = "$Pandoc\defaults"; endi $Pd
# syli $MD4PDF\defaults-toc.yaml "$Pd\md4pdfToC.yaml"
# syli $MD4PDF/defaults.yaml "$Pd\md4pdf.yaml"
#   csl $Pandoc\defaults

# #=> Pandoc\templates
# $Pt = "$Pandoc\templates"; endi $Pt
# syli $onGH\pandoc-templates "$Pt"
#   csl $Pandoc

# #=> Process Explorer v17.06
# # https://learn.microsoft.com/en-gb/sysinternals/downloads/process-explorer
# cpi $cITcc\forMSWin\ProcessExplorer\procexp64.exe "$Env:AppData\Microsoft\Windows\Start Menu\Programs\Startup"

# #=> Ruby
# cpi $misc\irbrc ~\.irbrc

# #=> secure
# endi ~/encrypted
# endi ~/.ssh

# #=> vim flavours - minimap
# cp $cITcc/forMSWin/code-minimap-v0_6_8-x86_64-pc-windows-msvc/code-minimap.exe $HADL/Microsoft/WindowsApps/code-minimap.exe

# #=> vim flavours - nvim 0 nvim 0 clear
# if ( test-path $nvim ) { ri -path $nvim -recurse } ; md $nvim\pack

#=> vim flavours - nvim 0 nvim 1 use
syli $vfv/after               $nvim/after
syli $vfv/filetype.vim        $nvim/filetype.vim
syli $vfv/ftplugin            $nvim/ftplugin
syli $vfn/init.vim            $nvim/init.vim
syli $vfn/lua                 $nvim/lua
syli $vfn/lsp                 $nvim/lsp
syli $vfv/packs/packs-colo    $nvim/pack/colo
syli $vfv/packs/packs-cp-all  $nvim/pack/cp-all
syli $vfv/packs/packs-cp-full $nvim/pack/cp-full
syli $vfv/packs/packs-unix    $nvim/pack/unix
syli $vfv/packs/packs-win64   $nvim/pack/win64
syli $vfv/plugin/packs.vim    $nvim/plugin/packs.vim
syli $vfv/plugin/plugin.vim   $nvim/plugin/plugin.vim
syli $vfv/spell               $nvim/spell
syli $vfv/syntax              $nvim/syntax
syli $vfv/thesaurus           $nvim/thesaurus
  csl $nvim; csl $nvim/pack

# #=> vim flavours - vim - vimfiles 0 clear
# if ( test-path ~\vimfiles ) { ri -path ~\vimfiles -recurse } ; md ~\vimfiles\pack

# # g $home\vimfiles

# #=> vim flavours - vim - vimfiles 0 vimrc
# syli $MSn\Vim\_gvimrc ~/_gvimrc
#   csl ~/_gvimrc
# syli $MSn\Vim\_vimrc-AZERTY ~/_vimrc
#   csl ~/_*vimrc

# #=> vim flavours - vim - vimfiles 1 test
# syli $vimfiles/test/filetype.vim        ~/vimfiles/filetype.vim
# syli $vimfiles/test/plugin/packs.vim    ~/vimfiles/plugin/packs.vim
# syli $vimfiles/test/plugin/plugin.vim   ~/vimfiles/plugin/plugin.vim
# syli $vfv/enter/Win10Paths.vim          ~/vimfiles/Win10Paths.vim
# syli $vfv/ftplugin                      ~/vimfiles/ftplugin
# syli $vfv/packs/packs-colo              ~/vimfiles/pack/colo
# syli $vfv/packs/packs-cp                ~/vimfiles/pack/cp
# syli $vfv/packs/packs-unix              ~/vimfiles/pack/unix
# syli $vfv/plugin/fzf                    ~/vimfiles/plugin/fzf
# syli $vfv/spell                         ~/vimfiles/spell
# syli $vfv/syntax                        ~/vimfiles/syntax
# syli $vfv/thesaurus                     ~/vimfiles/thesaurus
# csl ~/vimfiles

#=> vim flavours - vim - vimfiles 1 use
syli $vfv/after                ~/vimfiles/after
syli $vfv/enter/Win10Paths.vim ~/vimfiles/Win10Paths.vim
syli $vfv/filetype.vim         ~/vimfiles/filetype.vim
syli $vfv/ftplugin             ~/vimfiles/ftplugin
syli $vfv/packs/packs-colo     ~/vimfiles/pack/colo
syli $vfv/packs/packs-cp-all   ~/vimfiles/pack/cp-all
syli $vfv/packs/packs-cp-full  ~/vimfiles/pack/cp-full
syli $vfv/packs/packs-unix     ~/vimfiles/pack/unix
syli $vfv/packs/packs-win64    ~/vimfiles/pack/win64
syli $vfv/plugin/fzf           ~/vimfiles/plugin/fzf
syli $vfv/plugin/packs.vim     ~/vimfiles/plugin/packs.vim
syli $vfv/plugin/plugin.vim    ~/vimfiles/plugin/plugin.vim
syli $vfv/spell                ~/vimfiles/spell
syli $vfv/syntax               ~/vimfiles/syntax
syli $vfv/thesaurus            ~/vimfiles/thesaurus
  csl ~/vimfiles

# #=> ~\.bashrc
# syli $MSn/bashrc ~\.bashrc
#   csl ~/.bashrc

# #=> ~\.gitconfig
# syli $MSn\gitconfig ~\.gitconfig
#   csl ~\.gitconfig
# # b $HOME\.gitconfig

# #=> ~\.alacritty.toml
# syli $MSn/alacritty.toml $Env:AppData/alacritty/alacritty.toml

# #=> ~\.wezterm.lua
# syli $MSn/wezterm.lua ~/.wezterm.lua
#   csl ~/.wezterm.lua

