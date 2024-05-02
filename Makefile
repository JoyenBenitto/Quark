include makefile.inc

default: sim

.PHONY: sim
sim:
	@echo "Running sim cmd"
	@bsc -sim -p $(BSCINCDIR) -vdir $(VERILOGDIR) -bdir $(BDIR) -info-dir $(BSVBUILDDIR) -g $(TOP_MODULE) $(TOPFILE_DIR)/$(TOPFILE)
	@echo "elabs"
	@bsc -sim -e $(TOP_MODULE) -o build/bin/exe_$(TOP_MODULE) build/intermediate/mkTop.ba
	@./build/bin/exe_$(TOP_MODULE)