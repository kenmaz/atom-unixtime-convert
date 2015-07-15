# unixtime-convert package
Convert unixtime to readable datetime format

https://atom.io/packages/unixtime-convert

![demo_movie](demo.gif)

Notice: This package just detects 9-digits of numbers as unixtime and convert to formatted datetime string. 

A large amount of misdetection will occurs.

**But this is enough for me**.

## how to develop on your local
 - clone git repo
 - make symbolic link

```
cd ~/work
git clone <git atom-unixtime-convert url>
cd ~/.atom/packages
ln -s ~/work/atom-unixtime-convert atom-unixtime-convert
```

## how to publish new version
```
apm publish minor
```
