Add-Type -AssemblyName System.Drawing
$images = @{
    'project5.jpg' = 'Design System'
    'project6.jpg' = 'Mobile UI'
    'project7.jpg' = 'Brand Launch'
    'name.jpg' = 'Mohamed Umar'
}
foreach ($file in $images.Keys) {
    $bmp = New-Object System.Drawing.Bitmap 900,600
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.Clear([System.Drawing.Color]::FromArgb(15,24,42))
    $brush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(125,108,255))
    $font = New-Object System.Drawing.Font('Segoe UI', 42, [System.Drawing.FontStyle]::Bold)
    $sf = New-Object System.Drawing.StringFormat
    $sf.Alignment = 'Center'
    $sf.LineAlignment = 'Center'
    $rect = [System.Drawing.RectangleF]::new(0,0,900,600)
    $g.DrawString($images[$file], $font, $brush, $rect, $sf)
    $g.Dispose()
    $bmp.Save((Join-Path 'resources' $file), [System.Drawing.Imaging.ImageFormat]::Jpeg)
    $bmp.Dispose()
}
