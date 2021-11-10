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
