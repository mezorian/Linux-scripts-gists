# How to use Signal without Smartphone

## Installation of Signal Commandline Interface 

Download from https://github.com/AsamK/signal-cli/releases/latest

**Installation**
``` 
wget https://github.com/AsamK/signal-cli/releases/download/v0.10.0/signal-cli-0.10.0.tar.gz
sudo tar -xvzf signal-cli-0.10.0.tar.gz --directory=/usr/local/bin/
sudo ln -s /usr/local/bin/signal-cli-0.10.0/bin/signal-cli /usr/bin/signal-cli
```

**Check Installation**
```
signal-cli -v
```
should print
```
signal-cli 0.10.0
```

## Register for a new account 
**Request registration for mobile number**
```
signal-cli -u YOUR_NUMBER register
```
This will send a verification code via SMS

```
signal-cli -u YOUR_NUMBER verify VERIFICATIONCODE
```

It might bee that the register step requires you to solve a captcha. 
In this case you will be prompted to got open a link in the browser, solve the captcha, copy the result of the captcha from the failed redirect message in the browsers development console. 
Once the captcha is solved you can copy the result string and repeat the register command with the --captcha option
```
signal-cli -u YOUR_NUMBER register --captcha CAPTCHA_STRING
signal-cli -u YOUR_NUMBER verify VERIFICATIONCODE
```

## Install Signal desktop client
Follow the instructions at https://signal.org/download/ to install the signal desktop client at your system 

## Add Signal Desktop Client as a new device
If you open the Signal Desktop Client, it will ask you to connect the client to your 'master' installation, in this case to the signal cli. 
![link broken](images/add_device.png)

Usually in this step you need to scan the QR-code with your mobile-phones camera. 
In the case of signal cli we have to take a screenshot of the QR code and read the QR code with:
```
zbarimg /tmp/qr.png
```
This will print something like : 
```
QR-Code:sgnl://linkdevice?uuid=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

scanned 1 barcode symbols from 1 images in 0,02 seconds

	. EAN/UPC (EAN-13, EAN-8, EAN-2, EAN-5, UPC-A, UPC-E, ISBN-10, ISBN-13)
	. DataBar, DataBar Expanded
	. Code 128
	. Code 93
	. Code 39
	. Codabar
	. Interleaved 2 of 5
	. QR code
	. SQ code
  - is the barcode large enough in the image?
  - is the barcode mostly in focus?
  - is there sufficient contrast/illumination?
  - If the symbol is split in several barcodes, are they combined in one image?
  - Did you enable the barcode type?
    some EAN/UPC codes are disabled by default. To enable all, use:
    $ zbarimg -S*.enable <files>
    Please also notice that some variants take precedence over others.
    Due to that, if you want, for example, ISBN-10, you should do:
    $ zbarimg -Sisbn10.enable <files>
```

Copy the uuid string and paste it in the below command
```
signal-cli -u YOUR_NUMBER addDevice --uri "tsdevice:/?uuid=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
```
