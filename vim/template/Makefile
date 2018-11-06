
# ==============================================================================
# Automatic Variables
# ==============================================================================
# $@: Name of target
# $%: Target member name
# $<: Name of first prerequisite
# $?: Names of all new prerequisites newer than target
# $^: Names of all new prerequisites
# $+: Like $^ but includes duplicates
# $|: Names of order-only prerequisites
# $*: Stem, e.g. target=dir/foo.pattern.bar, pattern=foo.%.bar, stem=dir/foo.
# ==============================================================================

ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
dirs = $(patsubst %/, %, $(wildcard */))
files = $(filter-out $(dirs), $(wildcard *))

outdir := outdir

src := src/foo.c src/bar.c src2/foo.c
fsrc := $(notdir $(src))
srcpath := src2 src
obj := $(fsrc:%.c=$(outdir)/%.o)

.PHONY: all

all: $(src) $(outdir) $(obj)

debug:
	@echo src=$(src)
	@echo fsrc=$(fsrc)
	@echo obj=$(obj)

# Create fake objects from source files
vpath %.c $(srcpath)
$(outdir)/%.o: %.c
	@echo Creating $@ from $<
	@cat $< > $@
	@echo Done
$(outdir):
	@mkdir -pv $@

# Create fake source files
$(src):
	@mkdir -p $(@D)
	@echo $(@D) $(@F) > $@

realclean: clean
	@echo making $@
	@rm -rf src src2

clean: mostlyclean
	@echo making $@

mostlyclean:
	@echo making $@
	rm -rf $(outdir)

