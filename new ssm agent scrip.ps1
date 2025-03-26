[System.Net.ServicePointManager]::SecurityProtocol = 'TLS12'
$code = "UUZrYgMBolXhS1D25Kqq"
$id = "b0188625-c017-4a9a-b427-37f9380c281d"
$region = "us-east-1"
$dir = $env:TEMP + "\ssm"
New-Item -ItemType directory -Path $dir -Force
cd $dir
(New-Object System.Net.WebClient).DownloadFile("https://amazon-ssm-$region.s3.$region.amazonaws.com/latest/windows_amd64/ssm-setup-cli.exe", $dir + "\ssm-setup-cli.exe")
./ssm-setup-cli.exe -register -activation-code="$code" -activation-id="$id" -region="$region"