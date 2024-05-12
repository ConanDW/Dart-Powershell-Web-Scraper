#region DECLORATIONS
#endregion DECLORATIONS
#region FUNCTIONS
Function Get-ScrapedData () {
    [cmdletbinding()]
    Param (
        [Parameter(Mandatory)]
        [string]$url,
        $Images,
        $Links,
        $Headers,
        $HTML,
        $StatusCode
    )
    $scrape = (Invoke-WebRequest -Uri $url)
    switch ($Images -or $Links -or $Headers -or $HTML -or $StatusCode) {
        {$Images -eq 1} { 
            Write-Output "Images Alt Text:`r" "-----`r" $scrape.Images.Alt | Get-Unique
            Write-Output "Images Source:`r" "-----`r" $scrape.Images.Src | Get-Unique
        }
        {$Links -eq 1} { Write-Output "Links:`r" "-----`r" $scrape.Links.Href | Get-Unique }
        {$Headers -eq 1} { Write-Output "Headers:`r" "-----`r" $scrape.Headers | Get-Unique }
        {$HTML -eq 1} { Write-Output "HTML:`r" "-----`r" $scrape.Content`n }
        {$StatusCode -eq 1} { Write-Output "StatusCode:`r" "-----`r" $scrape.StatusCode }
        Default { Write-Output "Nothing has been selected!"}
}
#endregion FUNCTIONS
#region SCRIPT
Get-ScrapedData -Images 1 -Links 1 -Headers 1 -Html 1 -StatusCode 1 -url "www.coolmathgames.com" | Out-GridView -Wait
#endregion SCRIPT
