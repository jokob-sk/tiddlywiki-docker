#!/bin/sh
set -e

tiddlywiki_script=$(readlink -f $(which tiddlywiki))

if [ -n "$NODE_MEM" ]; then
    # Based on rule of thumb from:
    # http://fiznool.com/blog/2016/10/01/running-a-node-dot-js-app-in-a-low-memory-environment/
    mem_node_old_space=$((($NODE_MEM*4)/5))
    NODEJS_V8_ARGS="--max_old_space_size=$mem_node_old_space $NODEJS_V8_ARGS"
fi

if [ ! -d /var/lib/tiddlywiki/mywiki ]; then
  /usr/bin/env node $NODEJS_V8_ARGS $tiddlywiki_script mywiki --init server

  mkdir /var/lib/tiddlywiki/mywiki/tiddlers
fi


# Re-build the tiddlywiki static file
exec node $NODEJS_V8_ARGS $tiddlywiki_script /var/lib/tiddlywiki/mywiki --rendertiddler $:/core/save/all index.html text/plain