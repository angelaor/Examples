
# Convert to hex Unicode \u0000
$foo=32
Write-Host ('\u{0:x4}' -f $foo)

# Get or print the special character unicode decimal value
[Char]8217
[int][char]" "

