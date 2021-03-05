$chocolateyAppList = "googlechrome,firefox,brave,vivaldi,git,dotnet4.5,python3,python2,nodejs,dotnetfx,javaruntime,golang,fiddler,terraform,packer,consul,vault,vagrant,docker-desktop,docker-compose,vscode.install,notepadplusplus,brackets,sourcetree,pdfcreator,cmder,postman,microsoft-windows-terminal,sql-server-management-studio,postgresql,powershell-core,awscli,azure-cli,azcopy,azurepowershell,microsoftazurestorageexplorer,kubernetes-cli,kubernetes-helm,keepass.install,microsoft-teams.install,slack,zoom,gimp,paint.net,treesizefree,vlc,k-litecodecpackmega,k-litecodecpackfull,winmerge,winscp.install,openssh,putty.install,sysinternals,psping,pstools,rufus,wireshark,handbrake.install,obs-studio,googleearthpro,dellcommandupdate,redis-64,7zip,dotnetcore-sdk,dotnetcore-windowshosting"
$dismAppList = "Microsoft-Hyper-V-All,IIS-ASPNET,IIS-ASPNET45,IIS-CertProvider,IIS-HttpRedirect,IIS-BasicAuthentication,IIS-WebSockets,IIS-ApplicationInit,IIS-CustomLogging,IIS-ManagementService,WCF-Services45,WCF-HTTP-Activation45,IIS-WindowsAuthentication"

Write-Host "Checking for elevated permissions..."

if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
    [Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "Insufficient permissions to run this script. Open the PowerShell console as an administrator and run this script again."
    Break
}
else {
    Write-Host "Executing Choco installs..." -ForegroundColor Green
    Invoke-Expression "$PSScriptRoot\install.ps1 ""$chocolateyAppList"" ""$dismAppList"""
}