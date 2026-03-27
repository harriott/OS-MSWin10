# vim: se fdl=2:

# Joseph Harriott, mer 25 mars 2026

# $MSn\PS\Env.ps1
#  needed for system build
#  symlinked in  $MSn/set/2-PSProfile.ps1
#   then called by  $MSn/PS/Profile.ps1

#=> 0 useful variables
$Cn = $Env:Computername

#==> for  gokcehan  lf
$env:PAGER='bat'  # i  only
# $env:PAGER='less'
$env:SHELL='pwsh'
# see  $MSn/PS/Profile.ps1

#==> places
$CPF = $env:programfiles
$CPFx = ${env:programfiles(x86)}
$ITr = 'E:\ITr'  # see  $OSL/nodes/jo/export
$notDr = "D:\notDr"
  $GRs = "$notDr\GRs"  # copied Git Repositories

#===> 0 $Drpbx, or just $coreIT
if ( test-path "~\_noDropbox.ps1" ) {
    $coreIT = 'D:\ITr-coreIT'
    $JHCc = "D:\ITr-Cop-code"
    $jtIT = "D:\ITr-jtIT"
  } else {
  $Drpbx = "D:\Dropbox"
    $DrCop = "$Drpbx\Cop"
      $COT = "$DrCop\OutThere"
    $DJH = "$Drpbx\JH"
      $CfWk = "$DJH\Cop-work"
        $Cwet = "$CfWk\education\technos"
      $Cfzd = "$DJH\work-Cz"
        $CzMa = "$Cfzd\manage"
          $CzMaEx = "$CzMa\expenses"
        $CzPeo = "$Cfzd\people"
          $Cmdt = "$CzPeo\adherents\dt"
            $Cmd0 = "$Cmdt\data-0-wgetGS"
            $Cmd1 = "$Cmdt\data-1-adh"
            $Cmdts = "$Cmdt\scripts"
              $Cmdts1 = "$Cmdts\1-process"
        $CzPhy = "$Cfzd\PhysicalProperty"
      $core = "$DJH\core"
        $coreIT = "$core\IT"
        $TeNo = "$core\TextNotes"  # used in  $TeNo
          $TNt = "$TeNo\tex"  # used in  $TeNo
      $DaLi = "$DJH\Jo-now\DailyLife"
      $ess = "$DJH\Jo-now\essential"
        $eFr = "$ess\France"
        $hlth = "$ess\health"
      $FrFa = "$DJH\Jo-F+F"
        $FFIdF = "$FrFa\France\IdF"
      $cFr = "$DJH\Cop-France"
        $CFrp = "$cFr\places"
      $JCop = "$DJH\Cop"
        $chum = "$JCop\human"  # deprecated
        $JChu = "$JCop\human"  # used in  $TeNo
        $Pr0 = "$JCop\Practical0"
          $Pr0t = "$Pr0\technos"
      $JHt = "$DJH\Jo-technos"
        $jtIT = "$JHt\IT"
          $jtCP = "$jtIT\CP"
        $tIs = "$JHt\IT-storage"  # $tIs\diskUsage.txt
      $JHThb = "$DJH\Thb"  # Thunderbird
      $JHw = "$DJH\work"  # for IT websites and more
        $JHm = "$JHw\IT-Jekyll-harriott-minima"
        $wP = "$JHw\France\IdF\Paris"
          $rEr = "$wP\20e-rueErmitage"
            $StEr = "$rEr\StudioErmitage"
      $JJt0 = "$DJH\Jo-then0"
        $T0Fr = "$JJt0\world\Europe\France"
          $T0Frl = "$T0Fr\lieux"
    $DrSh = "$Drpbx\JH\dev-Sh"
    $ZNc = "$DJH/work-Cz-manage-online-ZNc"
}
#===> 0 $HOME
$Enc = "$home\encrypted"
$HADL = "$HOME\AppData\Local"  # ($env:localappdata)
  $HADLM = "$HADL\Microsoft"
  $lazy = "$HADL\nvim-data\lazy"
  $nvmp = "$HADL\nvim-data\mason\packages"
  $nvim = "$HADL\nvim"  # lf  don't grok  ~
$HADR = $Env:AppData  # Roaming
  $Pandoc = "$HADR\Pandoc"
  $RTh = "$HADR\Thunderbird"
  $tex = "$HADR\MiKTeX\tex"

#===> 1 rooting on $coreIT
$cITCP = "$coreIT\CP"
  $LTXj = "$cITCP\documenting\LaTeX\jo"
$DWp = "$coreIT\DokuWiki\pages"
$cITcc = "$coreIT\copied-code"
$cITcr = "$coreIT\copied-reference"
if ( test-path "~\_noDropbox.ps1" )
  { $MSWml = "D:\ITJ\ml" } else { $MSWml = "$coreIT\MSWin\ml-$Cn" }
$onGH = "$coreIT\onGitHub"
  if ( test-path "~\_noDropbox.ps1" )
    { $misc = 'D:\ITJ\gc-misc' } else { $misc = "$onGH\misc" }
  $MD4PDF = "$onGH\pandoc-md4pdf"
  if ( test-path "~\_noDropbox.ps1" )
    { $MSWin10 = 'D:\ITJ\gc-OS-MSWin10' } else { $MSWin10 = "$onGH\OS-MSWin10" }
    $MSn = "$MSWin10\nodes"
  $OSAB = "$onGH\OS-ArchBuilds"
    $ABjo = "$OSAB\nodes-jo"
      $AjB = "$ABjo\Bash"
      $Openbox = "$ABjo\wm\Openbox"
          $Obc = "$Openbox\openbox"
  $OSL = "$onGH\OS-Linux"
    $clMail = "$OSL\nodes\jo\clm"
      $clMn = "$clMail\neomutt"
  $culL = "$coreIT\ulLinux"
    $lclm = "$culL\clm"  # linux command-line mail
    $culLA = "$culL\Arch"
  if ( test-path "~\_noDropbox.ps1" )
    { $vimfiles = 'D:\ITJ\RC-vimfiles' } else { $vimfiles = "$onGH\vimfiles" }
  # $vimfiles = "~\vfs"  # vimfiles source - for testing outside of Dropbox
    $vfn = "$vimfiles\nvim"
    $vfv = "$vimfiles\vim"
      $vfvp = "$vfv\packs"

