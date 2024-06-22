openssl aes-256-cbc -k "password" -in dist.p12.enc -d -a -out dist.p12
openssl aes-256-cbc -k "password" -in dist.cer.enc -d -a -out dist.cer
openssl aes-256-cbc -k "password" -in dist.mobileprovision.enc -d -a -out dist.mobileprovision
