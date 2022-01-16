# A NodeJS tiddlywiki docker image for building a static index.html file containing all tiddlers.

You need a separate Docker image for creating and serving the wiki, e.g. [m0wer/tiddlywiki-docker](https://github.com/m0wer/tiddlywiki-docker).

# Source code location

[https://github.com/jokob-sk/tiddlywiki-docker](https://github.com/jokob-sk/tiddlywiki-docker)

Forked from
[m0wer/tiddlywiki-docker](https://github.com/m0wer/tiddlywiki-docker).

The Docker image is available at [jokobsk/tiddlywiki-generate-index-html - Docker
Hub](https://registry.hub.docker.com/r/jokobsk/tiddlywiki-generate-index-html/).

## Pointing to a TiddlyWiki

In this example, the folder `$(pwd)/.tiddlywiki` is used for the data.

The index.html file can be found in `/var/lib/tiddlywiki/output`

## Runtime
The rebuild is executed based on the `crontab.txt` entry, by default at 3:30AM. Modify the `crontab.txt` file an rebuild the container according to your needs. 

## Pointing to a TiddlyWiki

In this example, the folder `/var/lib/tiddlywiki/` is used for the data. Map this folder to to the location of your `mywiki` folder containing your wiki. This can NOT be changed via configuration. You can fork this repo and change the corresponding code if you need a different wiki folder name. 

The built (generated) index.html file can be found in `/var/lib/tiddlywiki/output`
