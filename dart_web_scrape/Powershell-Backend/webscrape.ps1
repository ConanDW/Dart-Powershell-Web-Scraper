Import-Module pglet
#region DECLORATIONS
$page = Connect-PgletPage -Name "PSBackend"
#endregion DECLORATIONS
#region FUNCTIONS
# https://github.com/AriDevK/Rocket-PS/tree/main/examples/handling_errors/views
Function Get-ScrapedData () {
    [cmdletbinding()]
    Param (
        [Parameter(Mandatory)]
        [string]$url
    )
    $scrape = (Invoke-WebRequest -Uri $url Out-String)
    Write-Output "Images Alt Text:`r" "-----`r" $scrape.Images.Alt | Get-Unique
    Write-Output "Images Source:`r" "-----`r" $scrape.Images.Src | Get-Unique
    Write-Output "Links:`r" "-----`r" $scrape.Links.Href | Get-Unique
    Write-Output "Headers:`r" "-----`r" $scrape.Headers | Get-Unique
    Write-Output "StatusCode:`r" "-----`r" $scrape.StatusCode
    Write-Output "Nothing has been selected!"
}
#endregion FUNCTIONS
#region SCRIPT
$page.clean()
$results = Get-ScrapedData -url "https://camerondaycustomwebsites.net" | Out-String #Scrapes url, add -f notation soon
Start-Sleep 5
$results.ToString()
$page.Controls.Add("$results")


#endregion SCRIPT
