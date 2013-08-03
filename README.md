# My First CouchDB Plugin

This is a practical guide to developing CouchDB plugins.


## Preparation

To get started, you need to install CouchDB from source, grab the CouchDB sources:

    git clone https://git-wip-us.apache.org/repos/asf/couchdb.git

Follow the instructions in `couchdb/INSTALL.Unix` and `couchdb/DEVELOPERS` to get a development environment going.

Be sure to install CouchDB into your system. If you want to install CouchDB into a development directory, make sure that the `bin/` folder of that directory is in your `PATH`.

Next, install *rebar* from <https://github.com/rebar/rebar>. Rebar is a build tool for Erlang projects and it makes our lives a lot easier.


## Quick Start


`my_first_couchdb_plugin` includes two directories `src` and `test` with an `.erl` file in them each. `src/my_first_couchdb_plugin.erl` is where our module code will live and `test/my_first_couchdb_plugin_tests.erl` will contain any tests for that code.

`src/my_first_couchdb_plugin.erl` now should look like this:

    -module(my_first_couchdb_plugin).

    -export([my_func/0]).

    my_func() ->
        ok.

It doesn’t do much, but you get your first module going. Let’s try to compile it.

`my_first_couchdb_plugin` comes with a `Makefile` that helps you with common tasks.

To compile your code, simply run:

    make

The output should be something like this:

    rebar compile
    ==> my_first_couchdb_plugin (compile)
    Compiled src/my_first_couchdb_plugin.erl

The compiled results are stored in a directory called `ebin/`. Poke around in there if you are interested on how this all looks.

To run CouchDB with your new plugin make sure CouchDB isn’t already running elsewhere and then do this:

    make dev

The output should look something like this:


    Erlang R15B03 (erts-5.9.3.1) [source] [64-bit] [smp:4:4] [async-threads:4] [hipe] [kernel-poll:true] [dtrace]

    Eshell V5.9.3.1  (abort with ^G)
    1> Apache CouchDB 1.3.0 (LogLevel=info) is starting.
    Apache CouchDB has started. Time to relax.
    [info] [<0.36.0>] Apache CouchDB has started on http://127.0.0.1:5984/

That means, CouchDB is now running normally, in the foreground as opposed to in the background like you would normally, so you get status and error messages in the terminal. And one more thing, this drops you into an interactive Erlang shell that runs inside your CouchDB instance. To see it, just hit enter and you will get:

    1>

This is the Erlang command prompt and you can enter arbitrary commands. To call our module function, type this:

    my_first_couchdb_plugin:my_func().

And then enter. The full stop at the end is essential. The output should look like this:

    1> my_first_couchdb_plugin:my_func().
    ok
    2>

`ok` is the return value of your function, if you remember the code of `my_first_couchdb_plugin,erl`, you see `ok` is the last statement before the final full stop in the function definition of `my_func()` and thus, it is the return value of that function and we see it in the command prompt. Then the command prompt waits for your next line of input with `2>` (the number increases with each entered command). To get out of the command prompt and to stop CouchDB, just hit `ctrl-c` twice.

Note: from now on you can just type `make dev`, it will run `make` for you internally and compile all changes you may have made in the meantime.

* * *

That is all that is needed to get started building a CouchDB plugin. The rest of this guide will explain how to hook into the various parts of CouchDB that allow you to do all sorts of fun things. That means you can write different types of plugins, once that handle HTTP requests, others that operate on database changes, and yet others that provide a deamon that does useful things for us.

* * *

## Publishing a Plugin
// what can go wrong at this step...
