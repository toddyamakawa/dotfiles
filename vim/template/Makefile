
ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
dirs = $(patsubst %/, %, $(wildcard */))
files = $(filter-out $(dirs), $(wildcard *))

