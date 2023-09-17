SIM ?= icarus
TOPLEVEL_LANG ?= verilog
VERILOG_SOURCES += $(PWD)/../build/verilog/or_gate.v
or:
	$(MAKE) sim MODULE=test_mkstage1 TOPLEVEL=or_gate
include $(shell cocotb-config --makefile)/Makefile.sim