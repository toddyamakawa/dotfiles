
ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
dirs = $(patsubst %/, %, $(wildcard */))
files = $(filter-out $(dirs), $(wildcard *))

outdir := outdir

src := src/foo.c src/bar.c
fsrc := $(notdir $(src))
obj := $(fsrc:%.c=$(outdir)/%.o)

.PHONY: all

all: $(obj)

# Create fake objects from source files
$(obj): $(src) $(outdir)
	@echo Creating $@ from $<
	@cat $< > $@
$(outdir):
	@mkdir -pv $@

# Create fake source files
$(src):
	@mkdir -p $(@D)
	@echo $(@F) > $@

realclean: clean
	@echo making $@
	@rm -rf src

clean: mostlyclean
	@echo making $@

mostlyclean:
	@echo making $@
	rm -rf $(outdir)

