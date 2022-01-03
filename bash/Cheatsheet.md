# Linux Cheat Sheet

## Search a string in files found with find command
`grep 'LinuxSlave' $(find jobs/* -name "config.xml")`

## git file history
https://github.com/pomber/git-history/tree/master/cli
```
npm install -g git-file-history
git-file-history path/to/file.ext
```

# redo last commands
```
fc 
sudo !!
```

# text search 
## get the everything that not matches your grep command 
```bash
grep --invert 'foo.*bar'
```

# apt 

## download deb files with dependencies
```
PACKAGES="ca-certificates wget"
apt-get download $(apt-cache depends --recurse --no-recommends --no-suggests \
  --no-conflicts --no-breaks --no-replaces --no-enhances \
  --no-pre-depends ${PACKAGES} | grep "^\w")
```

# go back to previous directory
cd -

# rsync (don't backup files from /proc /media /....
rsync --one-file-system (https://unix.stackexchange.com/a/107230)

# console output
## table formatted output 
use `foo | column -t` to format your space separated output like a table
Example:
```
sudo apt list --installed | column -t
```

# QR Codes 
# Scan QR code from command line:
zbarimg /tmp/qr.png

