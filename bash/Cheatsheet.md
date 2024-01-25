# Linux Cheat Sheet

## Archives

### Split directory into splitted archives of equal size
If you have a big directory and want to transfer it somewhere, but have limited options using rsync, ssh or other technologies it might help to split the directory into a bunch of small tar-files, copy them and finally extract them again.

To create the splitted tar-files you can use the following command:
```bash
tar cvzf - BIG_DIRECTORY | split --bytes=250MB - SPLITTED_BIG_DIRECTORY.tar.gz.
```

This will create files like the following with the size of 250MB each:
```bash
SPLITTED_BIG_DIRECTORY.tar.gz.aa
SPLITTED_BIG_DIRECTORY.tar.gz.ab
SPLITTED_BIG_DIRECTORY.tar.gz.ac
SPLITTED_BIG_DIRECTORY.tar.gz.ad
...
```

To uncompress these files you can use the following command:
```bash
cat SPLITTED_BIG_DIRECTORY.tar.gz.* | tar xzvf -
```

## File Names
### Rename a bunch of files via console
If you have a bunch of stupidly named files with a lot of bad characters inside the following command can help to loop over all of them and rename them in an efficient way
```bash
for f in download\?path\=%2F\&files\=ab08012024.tar.gz.* ; do mv -vi -- "$f" "${f//download?path=%2F&files=/}"; done
```

This will rename files like shown below
```bash
renamed 'download?path=%2F&files=ab08012024.tar.gz.hs' -> 'ab08012024.tar.gz.hs'
renamed 'download?path=%2F&files=ab08012024.tar.gz.ht' -> 'ab08012024.tar.gz.ht'
renamed 'download?path=%2F&files=ab08012024.tar.gz.hu' -> 'ab08012024.tar.gz.hu'
renamed 'download?path=%2F&files=ab08012024.tar.gz.hv' -> 'ab08012024.tar.gz.hv'
renamed 'download?path=%2F&files=ab08012024.tar.gz.hw' -> 'ab08012024.tar.gz.hw'
renamed 'download?path=%2F&files=ab08012024.tar.gz.hx' -> 'ab08012024.tar.gz.hx'
renamed 'download?path=%2F&files=ab08012024.tar.gz.hy' -> 'ab08012024.tar.gz.hy'
```


## Search a string in files found with find command
```bash
grep 'LinuxSlave' $(find jobs/* -name "config.xml")
```

## git file history
https://github.com/pomber/git-history/tree/master/cli
```bash
npm install -g git-file-history
git-file-history path/to/file.ext
```

# redo last commands
```bash
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
```bash
PACKAGES="ca-certificates wget"
apt-get download $(apt-cache depends --recurse --no-recommends --no-suggests \
  --no-conflicts --no-breaks --no-replaces --no-enhances \
  --no-pre-depends ${PACKAGES} | grep "^\w")
```

# go back to previous directory
```bash
cd -
```

# rsync (don't backup files from /proc /media /....
```bash
rsync --one-file-system (https://unix.stackexchange.com/a/107230)
```

# console output
## table formatted output
use `foo | column -t` to format your space separated output like a table
Example:
```bash
sudo apt list --installed | column -t
```

# QR Codes
# Scan QR code from command line:
```bash
zbarimg /tmp/qr.png
```
