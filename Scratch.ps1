
pandoc -f markdown_strict -V papersize:A4 -V geometry:hmargin=1cm -V geometry:vmargin='{1cm,2cm}' -V fontsize=12pt -V mainfont=Arial -V CJKmainfont='Noto Sans CJK SC Regular' -V CJKoptions=AutoFakeBold -H C:\Users\troin\Dropbox\JH\core\IT_stack\onGitHub\md4pdf\iih\iih.tex -d md4pdf  -o PandocToCdepth6MWE.pdf

pandoc -f markdown_strict -V papersize:A4 -V geometry:hmargin=1cm -V geometry:vmargin='{1cm,2cm}' -V fontsize=12pt -V mainfont=Arial -V CJKmainfont='Noto Sans CJK SC Regular' -V CJKoptions=AutoFakeBold -d md4pdf  -o PandocToCdepth6MWE.pdf

pandoc -f markdown_strict -V papersize:A4 -V geometry:hmargin=1cm -V geometry:vmargin='{1cm,2cm}' -V fontsize=12pt -V mainfont=Arial -V CJKmainfont='Noto Sans CJK SC Regular' -d md4pdf  -o PandocToCdepth6MWE.pdf

pandoc -f markdown_strict -V papersize:A4 -V geometry:hmargin=1cm -V geometry:vmargin='{1cm,2cm}' -V fontsize=12pt -V mainfont=Arial -d md4pdf  -o PandocToCdepth6MWE.pdf

