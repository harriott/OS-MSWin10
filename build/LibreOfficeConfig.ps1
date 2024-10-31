# vim: se fdl=1:

# Joseph Harriott - https://harriott.github.io/

# $MSWin10\build\LibreOfficeConfig.ps1

#=> 0 config directory
$uc0 = "$HOME\AppData\Roaming\LibreOffice\4\user"

#=> 1 import
remove-itemsafely "$uc0\config"  # not yet tried
remove-itemsafely "$uc0\registrymodifications.xcu"
$uc1 = "$CrPl/documenting/LibreOffice/user-o42-HPEB840G37"
cp -recurse $uc1/config $uc0/config
cp $uc1/registrymodifications.xcu $uc0/registrymodifications.xcu

#=> 1 export
$uc1 = "$CrPl/documenting/LibreOffice/user-o42-HPEB840G37"
mkdir $uc1
cp -r "$uc0/config" "$uc1/config"
cp "$uc0/registrymodifications.xcu" "$uc1/registrymodifications.xcu"

