# vim: se fdl=2:

# Joseph Harriott, mar 23 juil 2024

# $MSn\PS\Env.ps1
#  needed for system build
#  symlink ($MSn\set\1-PSProfile.ps1) sourced by  $MSWin10\PSProfile.ps1

#=> 0 useful variables
$Cn = $Env:Computername
#==> places
$CPF = $env:programfiles
$CPFx = ${env:programfiles(x86)}
#===> 0 $Drpbx, or just $ITstack
if ( test-path "~\_noDropbox.ps1" ) { $ITstack = 'D:\IT_stack' } else {
  $Drpbx = "D:\Dropbox"
    $DJH = "$Drpbx\JH"
      $CfWk = "$DJH\Cop-work"
      $Cfzd = "$DJH\work-Cz"
        $CzMa = "$Cfzd\manage"
        $CzPeo = "$Cfzd\people"
          $Copil = "$CzPeo\adherents\FA+Copil"
        $CzPhy = "$Cfzd\PhysicalProperty"
      $core = "$DJH\core"
        $ITstack = "$core\IT_stack"
        $TeNo = "$core\TextNotes"  # used in  $TeNo
          $TNt = "$TeNo\tex"  # used in  $TeNo
      $DaLi = "$DJH\Jo-now\DailyLife"
      $ess = "$DJH\Jo-now\essential"
        $eFr = "$ess\France"
        $hlth = "$ess\health"
      $FrFa = "$DJH\Jo-F+F"
        $FFIdF = "$FrFa\France\IdF"  # $FFIdF  used in  $TeNo
      $JCop = "$DJH\Cop"
        $cFr = "$JCop\France"  # $cFr  used in  $TeNo
        $chum = "$JCop\human"  # used in  $TeNo
        $Pr0 = "$JCop\Practical0"
          $Pr0t = "$Pr0\technos"  # $Pr0t
      $JHt = "$DJH\Jo-technos"
        $jtIT = "$JHt\IT"
        $tIs = "$JHt\IT-storage"  # $tIs\diskUsage.txt
      $JHw = "$DJH\work"  # for IT websites and more
        $JHm = "$JHw\IT-Jekyll-harriott-minima"
        $rEr = "$JHw\France\IdF\Paris\20e-rueErmitage"
          $StEr = "$rEr\StudioErmitage"  # $StEr
      $Thb = "$DJH\Thb-dr"  # Thunderbird
      $JJt0 = "$DJH\Jo-then0"
    $DCGRs = "$Drpbx\Cop\GRs"  # Copied Git Repositories Use
}
#===> 0 $HOME
$Enc = "$home\encrypted"
$HADL = "$HOME\AppData\Local"  # ($env:localappdata)
  $HADLM = "$HADL\Microsoft"
  $lazy = "$HADL\nvim-data\lazy"
  $nvim = "$HADL\nvim"  # lf  don't grok  ~
$HADR = $Env:AppData
  $Pandoc = "$HADR\Pandoc"
  $tex = "$HADR\MiKTeX\tex"
#===> 0 $HOME DH
if ( $Cn -eq 'HPEB840G36' ) {
  $HDH = 'C:\Users\deaur'
  $HDADL = "$HDH\AppData\Local"
    $nvimD = "$HDADL\nvim"  # lf  don't grok  ~
  $HDADR = "$HDH\AppData\Roaming"
}
#===> 1 rooting on $ITstack
$CrPl = "$ITstack\CP"
  $LTXj = "$CrPl\documenting\LaTeX\jo"
$DWp = "$ITstack\DokuWiki\pages"
$ITscc = "$ITstack\copied-code"
$ITscr = "$ITstack\copied-reference"
$machLg = "$ITstack\MSWin\ml-$Cn"
$onGH = "$ITstack\onGitHub"
  $misc = "$onGH\misc"
  $MD4PDF = "$onGH\pandoc-md4pdf"
  $MSWin10 = "$onGH\OS-MSWin10"
    $MSn = "$MSWin10\nodes"
    $MSWSL = "$MSn\WSL"
  $OSAB = "$onGH\OS-ArchBuilds"
    $ABjo = "$OSAB\jo"
      $AjB = "$ABjo\Bash"
      $Openbox = "$ABjo\wm\Openbox"
          $Obc = "$Openbox\openbox"
  $OSL = "$onGH\OS-Linux"
  $ulL = "$ITstack\unix_like-linux"
    $lclm = "$ulL\clm"  # $lclm  linux command-line mail
  $vimfiles = "$onGH\vimfiles"
  # $vimfiles = "~\vfs"  # vimfiles source - for testing outside of Dropbox
    $vfv = "$vimfiles\vim"
      $vfvp = "$vfv\packs"

