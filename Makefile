# Customize here
NAME=my_first_couchdb_plugin
VERSION=1.0.0
# Stop customizing here

ERL=$(shell couch-config --erl-bin)
ERLANG_VERSION=$(shell couch-config --erlang-version)
COUCHDB_VERSION=$(shell couch-config --couch-version | sed 's/\+.*//')
PLUGIN_DIRS=ebin priv
PLUGIN_VERSION_SLUG=$(NAME)-$(VERSION)-$(ERLANG_VERSION)-$(COUCHDB_VERSION)
PLUGIN_DIST=$(PLUGIN_VERSION_SLUG)

all: compile

compile:
	ERL_LIBS=$(shell couch-config --erl-libs-dir):$(ERL_LIBS) rebar compile

dev:
	@ERL_LIBS=$(shell pwd) couchdb -i -a priv/default.d/*.ini

plugin: compile
	@mkdir -p $(PLUGIN_DIRS)
	@mkdir -p $(PLUGIN_DIST)
	@cp -r $(PLUGIN_DIRS) $(PLUGIN_DIST)
	@tar czf $(PLUGIN_VERSION_SLUG).tar.gz $(PLUGIN_DIST)
	@$(ERL) -eval 'File = "$(PLUGIN_VERSION_SLUG).tar.gz", {ok, Data} = file:read_file(File),io:format("~s: ~s~n", [File, base64:encode(crypto:sha(Data))]),halt()' -noshell
