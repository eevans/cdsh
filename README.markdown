cdsh
====

A simple wrapper script around [DSH](https://www.netfort.gr.jp/~dancer/software/dsh.html.en)
for [Apache Cassandra](http://cassandra.apache.org).

Description
-----------

`dsh` restricts you to flat groups lists, `cdsh` wraps `dsh` to allow you to define your
clusters in a single YAML file (`~/.cdsh` by default), and then specify the hosts for remote
commands using arguments for cluster name, data-center, and rack.

Usage
-----

    usage: cdsh [-h] [-c CLUSTER] [-d DATA_CENTER] [-r RACK] [--config CONFIG]
                [-P]
                [args [args ...]]
    
    A dsh wrapper for Cassandra
    
    positional arguments:
      args                  arguments to dsh
    
    optional arguments:
      -h, --help            show this help message and exit
      -c CLUSTER, --cluster CLUSTER
                            cluster name
      -d DATA_CENTER, --data-center DATA_CENTER
                            data-center name
      -r RACK, --rack RACK  rack name
      --config CONFIG       yaml configuration file
      -P, --print-hosts     output matching hosts (no command run)


Examples
--------
Executing a command on all nodes of cluster `default`:

    $ cdsh -c default -- uname -r

Executing a command on `rack1` of cluster `test` in data-center `datacenter1`:

    $ cdsh -c test -d datacenter1 -r rack1 -- nodetool setstreamthroughput 200

Using the host list for other commands:

    $ for i in `cdsh -c default -P`; do rsync cassandra.yaml $i:/etc/cassandra; done

