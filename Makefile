MAKEFLAGS=--no-builtin-rules --no-builtin-variables --always-make
ROOT := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

gen:
	flutter pub run build_runner build --delete-conflicting-outputs

vendor:
	flutter pub get