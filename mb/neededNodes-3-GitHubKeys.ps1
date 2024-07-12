# vim: set fdl=1:

# Joseph Harriott - https://harriottgithubio/ - ven 12 juil 2024

# once  $Cn,  APS> . $MSWin10\mb\neededNodes-3-GitHubKeys.ps1

function endi { if ( ! ( test-path $args[0] ) ) { md $args[0] } } # ensure directory

cpi ~\Encrypted\Secure1\Networking\SSH\id_ed25519-forGitHub ~\.ssh\id_rsa
cpi ~\Encrypted\Secure1\Networking\SSH\id_ed25519-forGitHub.pub ~\.ssh\id_rsa.pub

