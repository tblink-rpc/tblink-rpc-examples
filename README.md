# tblink-rpc-examples
Repository of examples


## Directory Structure
- sv -- examples using TbLink with a full SystemVerilog simulator
  - cocotb
    - uvm_py_ref_model
      - Testbench in UVM with a reference model in Python
    - py_uvm_seq
      - Testbench in UVM with test sequences written in Python
    - py_uvm_agent
      - Testbench in Python using existing UVM Agent
      - Use pyuvm?
    - py_wb_bfm
      - Testbench in Python using SV BFMs
      - Use pyuvm?
      
    - analysis?
  - uvm
    - wb_agent
      - Testbench in UVM using a tblink-bfms BFM
      
  - ???
- vlog -- examples using Verilog and non-full SystemVerilog simulators (Icarus, Verilator)
  - cocotb
    - py_wb_bfm
      - Testbench in Python using SV BFMs
      - Use pyuvm?

  - ???
- vhdl -- examples using a VHDL simulator (TBD)
  - cocotb

  
