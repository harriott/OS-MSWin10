# vim: set et tw=0:
# #region & #endregion create folding blocks if Peter Provost's vim-ps1 is installed

# Joseph Harriott
# to be run in Administator Powershell

#region --- MiKTeX

new-item "$Env:AppData\MiKTeX\tex\latex\jo" -itemtype symboliclink -value $ITstack\CrossPlatform\forLaTeX

#endregion
