# African safari characters
$safari = @("🦓", "🦒", "🐘", "🦏", "🦁")

# Initial positions for the safari animals
$safari_pos = @()
for ($i = 0; $i -lt $safari.Count; $i++) {
    $safari_pos += ,(New-Object PSObject -Property @{X = Get-Random -Minimum 0 -Maximum ($Host.UI.RawUI.WindowSize.Width - 1); Y = Get-Random -Minimum 0 -Maximum ($Host.UI.RawUI.WindowSize.Height - 1)})
}

while ($true)
{
    # Clear the screen
    Clear-Host

    # Print the savanna
    for ($i = 0; $i -lt $Host.UI.RawUI.WindowSize.Width; $i++) {
        Write-Host -NoNewline "🌵🌾🌴"
    }

    # Print the safari animals
    for ($i = 0; $i -lt $safari.Count; $i++) {
        Write-Host -NoNewline ("`n" * $safari_pos[$i].Y) -ForegroundColor Black -BackgroundColor Yellow
        Write-Host -NoNewline (" " * $safari_pos[$i].X) -ForegroundColor Black -BackgroundColor Yellow
        Write-Host -NoNewline $safari[$i] -ForegroundColor Black -BackgroundColor Yellow
    }

    # Move safari animals
    for ($i = 0; $i -lt $safari.Count; $i++) {
        $safari_pos[$i].X += Get-Random -Minimum -1 -Maximum 2
        $safari_pos[$i].Y += Get-Random -Minimum -1 -Maximum 2
        # Ensure that the safari animals stay within the terminal window
        if ($safari_pos[$i].X -lt 0)
        {
            $safari_pos[$i].X = 0
        }
        if ($safari_pos[$i].X -ge $Host.UI.RawUI.WindowSize.Width)
        {
            $safari_pos[$i].X = $Host.UI.RawUI.WindowSize.Width - 1
        }
        if ($safari_pos[$i].Y -lt 0)
        {
            $safari_pos[$i].Y = 0
        }
        if ($safari_pos[$i].Y -ge $Host.UI.RawUI.WindowSize.Height)
        {
            $safari_pos[$i].Y = $Host.UI.RawUI.WindowSize.Height - 1
        }
    }

    # Add a delay
    Start-Sleep -Milliseconds 250

}