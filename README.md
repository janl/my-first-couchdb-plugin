# My First CouchDB Plugin

This is a practical guide to developing CouchDB plugins.


## Preparation

To get started, you need to install CouchDB from source, grab the CouchDB sources:

    git clone https://git-wip-us.apache.org/repos/asf/couchdb.git

Follow the instructions in `couchdb/INSTALL.Unix` and `couchdb/DEVELOPERS` to get a development environment going.

Be sure to install CouchDB into your system. If you want to install CouchDB into a development directory, make sure that the `bin/` folder of that directory is in your `PATH`.

Next, install *rebar* from <https://github.com/rebar/rebar>. Rebar is a build tool for Erlang projects and it makes our lives a lot easier.


## Quick Start

We start by creating a new rebar project:

    rebar create template=simplemod modid=my_first_couchdb_plugin

Rebar allows to create different types of projects. We’ll start with a simple module, hence `template=simplemod` and we want to call it `my_first_couchdb_plugin`, hence `modid=my_first_couchdb_plugin`.

This should show you something like this:

    ==> my_first_couchdb_plugin (create)
    Writing src/my_first_couchdb_plugin.erl
    Writing test/my_first_couchdb_plugin_tests.erl

Rebar creates two directories `src` and `test` with an `.erl` file in them each. `src/my_first_couchdb_plugin.erl` is where our module code will live and `test/my_first_couchdb_plugin_tests.erl` will contain any tests for that code.





// learn more about rebar at [list of refs]