# Signal without Smartphone
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

