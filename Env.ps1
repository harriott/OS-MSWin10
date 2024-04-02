# vim: se fdl=2:

# Joseph Harriott, sam 30 mars 2024

# $MSWin10\Env.ps1
#  needed for system build
#  symlink ($MSWin10\symlinks.ps1) sourced by  $MSWin10\PSProfile.ps1

#=> 0 useful variables
$Cn = $Env:Computername
$uname = $Env:USERNAME

#==> places
$Drpbx = "C:\Users\$uname\Dropbox"
if ( $Cn -eq 'HPEB840G36' ) { $Drpbx = "D:\Dropbox" }
  $DJH = "$Drpbx\JH"
    $ess = "$DJH\now\essential"
      $eFr = "$ess\France"
    $CfWk = "$DJH\CforWork"
    $Cfzd = "$DJH\Cafezoide"
      $CzPhy = "$Cfzd\PhysicalProperty"
    $copied = "$DJH\copied"
      $cFr = "$copied\France"  # $cFr  used in  $TeNo
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
          $SPD = "$onGH\FM-MSWin-syncDrives\RoboCopy\$Cn"  # used in  $machBld\PSProfile.ps1
          $vimfiles = "$onGH\vimfiles"
            $vfp = "$vimfiles\pack"
    $FrFa = "$DJH\F+F"
      $FFIdF = "$FrFa\France\IdF"  # $FFIdF  used in  $TeNo
    $GHrUse = "$Drpbx\CGHrepos"  # GitHub Repositories Use
    $JHw = "$DJH\work"  # for IT websites and more
      $JHm = "$JHw\IT-Jekyll-harriott-minima"
      $rEr = "$JHw\France\IdF\Paris\20e-rueErmitage"
        $StEr = "$rEr\StudioErmitage"  # $StEr
    $jtIT = "$DJH\technos\IT"
    $tIs = "$DJH\Technos\IT-storage"  # $tIs\diskUsage.txt
    $Pr0 = "$DJH\Copied\Practical0"
    $Thb = "$DJH\Thb-dr"
$Enc = "C:\Users\$uname\encrypted"
$Pandoc = "$Env:AppData\Pandoc"
$tex = "$Env:AppData\MiKTeX\tex"


