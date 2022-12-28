To use two factor authentication you don't need a smartphone. 
Alternatively you can also use oath-toolkit + gpg. 
To generate a totp (Time-based One-Time Password) you simply have to run the below command and replace the text `PASTE_YOUR_DATA_HERE` with the content you get from your QR code.

```
oathtool -b --totp 'PASTE_YOUR_DATA_HERE'
```

As a result you will a 6 digit one time password. 
For every new interaction you have to re-run this command and you will get a new one time password.
