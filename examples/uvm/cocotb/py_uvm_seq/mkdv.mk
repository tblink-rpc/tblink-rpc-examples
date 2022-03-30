MKDV_MK:=$(abspath $(lastword $(MAKEFILE_LIST)))
TEST_DIR:=$(dir $(MKDV_MK))
TBLINK_RPC_EXAMPLES:=$(abspath $(TEST_DIR)/../../../..)
PACKAGES_DIR:=$(TBLINK_RPC_EXAMPLES)/packages
PYTHON:=$(PACKAGES_DIR)/python/bin/python3
DV_MK:=$(shell $(PYTHON) -m mkdv mkfile)
MKDV_TOOL ?= questa

TBLINK_RPC_HDL_DPI := $(shell $(PYTHON) -m tblink_rpc_hdl simplugin dpi)
DPI_LIBS += $(TBLINK_RPC_HDL_DPI)

# Ensure the interface file is generated prior to building source
MKDV_BUILD_DEPS += $(MKDV_CACHEDIR)/my_seq_if.svh

# Ensure the compiler can find our generated file
MKDV_VL_INCDIRS  += $(MKDV_CACHEDIR)
TOP_MODULE ?= py_uvm_seq_tb

UVM_TESTNAME ?= py_uvm_seq_test
MKDV_RUN_ARGS += +UVM_TESTNAME=$(UVM_TESTNAME)

PY_UVM_SEQ_CLASS ?= MySeqIf
PY_UVM_SEQ_MODULE ?= my_seq_if

TBLINK_RPC_PYTHON := $(PYTHON)
export TBLINK_RPC_PYTHON

MKDV_PYTHONPATH += $(TEST_DIR)/python

include $(DV_MK)

include $(MKDV_CACHEDIR)/files.mk

RULES := 1

include $(DV_MK)

$(MKDV_CACHEDIR)/files.mk : $(TEST_DIR)/filespec.yaml
	$(Q)mkdir -p `dirname $@`
	$(Q)$(PYTHON) -m mkdv filespec $^ -t mk -o $@


$(MKDV_CACHEDIR)/my_seq_if.svh : $(TEST_DIR)/python/my_seq_if.py
	$(PYTHON) -m tblink_rpc_utils gen \
		-l $(TEST_DIR)/python \
		-is python \
		-os sv-uvm \
		-o $(@) \
		my_seq_if
