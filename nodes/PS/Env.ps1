# vim: se fdl=2:

# Joseph Harriott, sam 08 févr 2025

# $MSn\PS\Env.ps1
#  needed for system build
#  symlink ($MSn\set\1-PSProfile.ps1) sourced by  $MSWin10\PSProfile.ps1

#=> 0 useful variables
$Cn = $Env:Computername

#==> places
$CPF = $env:programfiles
$CPFx = ${env:programfiles(x86)}
$tricky = "D:\tricky"
  $cGRs = "$tricky\GRs"  # Copied Git Repositories Use

#===> 0 $Drpbx, or just $coreIT
if ( test-path "~\_noDropbox.ps1" ) { $coreIT = 'D:\IT' } else {
  $Drpbx = "D:\Dropbox"
    $COT = "$Drpbx\Cop\OutThere"
    $DJH = "$Drpbx\JH"
      $CfWk = "$DJH\Cop-work"
        $Cwet = "$CfWk\education\technos"
      $Cfzd = "$DJH\work-Cz"
        $CzMa = "$Cfzd\manage"
        $CzPeo = "$Cfzd\people"
          $Csst = "$CzPeo\adherents\sstreat"
            $d0g = "$Csst\data-0-grab"
            $d1ad = "$Csst\data-1-adh"
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
      $JCop = "$DJH\Cop"
        $cFr = "$JCop\France"
          $CFrp = "$JCop\France\places"
        $chum = "$JCop\human"  # deprecated
        $JChu = "$JCop\human"  # used in  $TeNo
        $Pr0 = "$JCop\Practical0"
          $Pr0t = "$Pr0\technos"
      $JHt = "$DJH\Jo-technos"
        $jtIT = "$JHt\IT"
          $jtCP = "$jtIT\CP"
        $tIs = "$JHt\IT-storage"  # $tIs\diskUsage.txt
      $JHw = "$DJH\work"  # for IT websites and more
        $JHm = "$JHw\IT-Jekyll-harriott-minima"
        $wP = "$JHw\France\IdF\Paris"
          $rEr = "$wP\20e-rueErmitage"
            $StEr = "$rEr\StudioErmitage"
      $JJt0 = "$DJH\Jo-then0"
        $T0Fr = "$JJt0\world-Europe\France"
      $Thb = "$DJH\Thb-dr"  # Thunderbird
    $DrSh = "$Drpbx\JH\dev-Sh"
}
#===> 0 $HOME
$Enc = "$home\encrypted"
$HADL = "$HOME\AppData\Local"  # ($env:localappdata)
  $HADLM = "$HADL\Microsoft"
  $lazy = "$HADL\nvim-data\lazy"
  $mason = "$HADL\nvim-data\mason\packages"
  $nvim = "$HADL\nvim"  # lf  don't grok  ~
$HADR = $Env:AppData  # Roaming
  $Pandoc = "$HADR\Pandoc"
  $tex = "$HADR\MiKTeX\tex"

#===> 1 rooting on $coreIT
$ITsCP = "$coreIT\CP"
  $LTXj = "$ITsCP\documenting\LaTeX\jo"
$DWp = "$coreIT\DokuWiki\pages"
$ITscc = "$coreIT\copied-code"
$ITscr = "$coreIT\copied-reference"
$MSWml = "$coreIT\MSWin\ml-$Cn"
$onGH = "$coreIT\onGitHub"
  $misc = "$onGH\misc"
  $MD4PDF = "$onGH\pandoc-md4pdf"
  $MSWin10 = "$onGH\OS-MSWin10"
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
  $vimfiles = "$onGH\vimfiles"
  # $vimfiles = "~\vfs"  # vimfiles source - for testing outside of Dropbox
    $vfn = "$vimfiles\nvim"
    $vfv = "$vimfiles\vim"
      $vfvp = "$vfv\packs"

