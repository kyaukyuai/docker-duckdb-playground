#!/bin/sh

# - VERY rudimentary test script to run latest image builds and test them all by running `--version`
# TODO: create a real test suite

clear \
&& echo "\n\n"\
"###################################\n"\
"##### Testing duckdb latest #####\n"\
"###################################\n"\
&& make build \
&& make run COMMAND="duckdb --version" \
