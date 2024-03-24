include makefile.inc

default: sim

.PHONY: sim
sim:
	@echo "Running sim cmd"
	@bsc -u -sim $(TOPFILE_DIR)/$(TOPFILE)
	@bsc -sim -e $(TOP_MODULE) -o build/Bin/$(TOP_MODULE)
	@./build/Bin/$(TOP_MODULE)