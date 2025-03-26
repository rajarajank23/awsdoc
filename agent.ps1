[System.Net.ServicePointManager]::SecurityProtocol = 'TLS12'
$code = "zQn36RAk7vyjId18txOk"
$id = "d01e34b5-02ab-4c52-bf02-73e92969e62f"
$region = "us-east-1"
$dir = $env:TEMP + "\ssm"
New-Item -ItemType directory -Path $dir -Force
cd $dir
(New-Object System.Net.WebClient).DownloadFile("https://amazon-ssm-$region.s3.$region.amazonaws.com/latest/windows_amd64/ssm-setup-cli.exe", $dir + "\ssm-setup-cli.exe")
./ssm-setup-cli.exe -register -activation-code="$code" -activation-id="$id" -region="$region"
Get-Content ($env:ProgramData + "\Amazon\SSM\InstanceData\registration")
Get-Service -Name "AmazonSSMAgent"