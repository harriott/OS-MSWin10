# vim: se fdl=2:

# Joseph Harriott, sam 30 mars 2024

# $MSWin10\Env.ps1
#  needed for system build
#  symlink ($MSWin10\symlinks.ps1) sourced by  $MSWin10\PSProfile.ps1

#=> 0 useful variables
$Cn = $Env:Computername
$lazy = "$HOME\AppData\Local\nvim-data\lazy"
$uname = $Env:USERNAME

#==> places
$Drpbx = "C:\Users\$uname\Dropbox"
if ( $Cn -eq 'HPEB840G36' ) { $Drpbx = "D:\Dropbox" }
  $DJH = "$Drpbx\JH"
    $CfWk = "$DJH\Cop-work"
    $Cfzd = "$DJH\work-Cz"
      $CzPhy = "$Cfzd\PhysicalProperty"
    $JCop = "$DJH\Cop"
      $cFr = "$JCop\France"  # $cFr  used in  $TeNo
      $Pr0 = "$JCop\Practical0"
    $core = "$DJH\core"
      $ITstack = "$core\IT_stack"
        $CrPl = "$ITstack\CP"
          $LTXj = "$CrPl\documenting\LaTeX\jo"
        $ITscc = "$ITstack\copied-code"
        $ITscr = "$ITstack\copied-reference"
        $machLg = "$ITstack\MSWin\ml-$Cn"
        $onGH = "$ITstack\onGitHub"
          $misc = "$onGH\misc"
          $MD4PDF = "$onGH\pandoc-md4pdf"
          $MSWin10 = "$onGH\OS-MSWin10"
            $machBld = "$MSWin10\mb\$Cn"
            $MSWSL = "$MSWin10\WSL"
            $OSAB = "$onGH\OS-ArchBuilds"
          $SPD = "$onGH\FM-MSWin-syncDrives\RoboCopy\$Cn"  # used in  $machBld\PSProfile.ps1
          $vimfiles = "$onGH\vimfiles"
            $vfp = "$vimfiles\pack"
    $DaLi = "$DJH\now\DailyLife"
    $ess = "$DJH\Jo-now\essential"
      $eFr = "$ess\France"
    $FrFa = "$DJH\Jo-F+F"
      $FFIdF = "$FrFa\France\IdF"  # $FFIdF  used in  $TeNo
    $JHt = "$DJH\Jo-technos"
      $jtIT = "$JHt\IT"
      $tIs = "$JHt\IT-storage"  # $tIs\diskUsage.txt
    $JHw = "$DJH\work"  # for IT websites and more
      $JHm = "$JHw\IT-Jekyll-harriott-minima"
      $rEr = "$JHw\France\IdF\Paris\20e-rueErmitage"
        $StEr = "$rEr\StudioErmitage"  # $StEr
    $Thb = "$DJH\Thb-dr"
    $JJt0 = "$DJH\Then0"
  $DCGRs = "$Drpbx\Cop\GRs"  # Copied Git Repositories Use
$Enc = "C:\Users\$uname\encrypted"
$nvim = "$home\AppData\Local\nvim"  # lf  don't grok  ~
$Pandoc = "$Env:AppData\Pandoc"
$tex = "$Env:AppData\MiKTeX\tex"


