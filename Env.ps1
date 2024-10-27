# vim: se fdl=2:

# Joseph Harriott, mar 23 juil 2024

# $MSWin10\Env.ps1
#  needed for system build
#  symlink ($MSWin10\mb\neededNodes-1.ps1) sourced by  $MSWin10\PSProfile.ps1

#=> 0 useful variables
$Cn = $Env:Computername
#==> places
$CPF = $env:programfiles
$CPFx = ${env:programfiles(x86)}
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
            $MSmb = "$MSWin10\mb"
              $mbC = "$MSmb\$Cn"
            $MSWSL = "$MSWin10\WSL"
          $OSAB = "$onGH\OS-ArchBuilds"
            $ABjo = "$OSAB/jo"
              $AjB = "$ABjo/Bash"
              $Openbox = "$ABjo/wm/Openbox"
                  $Obc = "$Openbox/openbox"
          $OSL = "$onGH\OS-Linux"
          $SPD = "$onGH\FM-MSWin-syncDrives\RoboCopy\$Cn"  # used in  $mbC\PSProfile.ps1
          $ulL = "$ITstack\unix_like-linux"
          $vimfiles = "$onGH\vimfiles"
          # $vimfiles = "~\vfs"  # vimfiles source - for testing outside of Dropbox
            $vfv = "$vimfiles\vim"
              $vfvp = "$vfv\packs"
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
    $JHt = "$DJH\Jo-technos"
      $jtIT = "$JHt\IT"
      $tIs = "$JHt\IT-storage"  # $tIs\diskUsage.txt
    $JHw = "$DJH\work"  # for IT websites and more
      $JHm = "$JHw\IT-Jekyll-harriott-minima"
      $rEr = "$JHw\France\IdF\Paris\20e-rueErmitage"
        $StEr = "$rEr\StudioErmitage"  # $StEr
    $Thb = "$DJH\Thb-dr"
    $JJt0 = "$DJH\Jo-then0"
  $DCGRs = "$Drpbx\Cop\GRs"  # Copied Git Repositories Use
$Enc = "$env:userprofile\encrypted"
$HADL = "$HOME\AppData\Local"  # ($env:localappdata)
  $HADLM = "$HADL\Microsoft"
  $lazy = "$HADL\nvim-data\lazy"
  $nvim = "$HADL\nvim"  # lf  don't grok  ~
$HADR = $Env:AppData
  $Pandoc = "$HADR\Pandoc"
  $tex = "$HADR\MiKTeX\tex"

