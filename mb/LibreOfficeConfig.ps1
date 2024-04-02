# vim: se fdl=1:

# Joseph Harriott - https://harriott.github.io/

# $MSwin10\mb\LibreOfficeConfig.ps1

#=> 0 config directory
$uc0 = "~\AppData\Roaming\LibreOffice\4\user"

#=> 1 export
$uc1 = "$CrPl/documenting/LibreOffice/user-o42-HPEB840G37"
mkdir $uc1
cp -r "$uc0/config" "$uc1/config"
cp "$uc0/registrymodifications.xcu" "$uc1/registrymodifications.xcu"

