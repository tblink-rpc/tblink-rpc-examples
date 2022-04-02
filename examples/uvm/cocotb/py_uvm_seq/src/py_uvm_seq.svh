/****************************************************************************
 * py_uvm_seq.svh
 ****************************************************************************/

/**
 * Class: py_uvm_seq
 * 
 * TODO: Add class documentation
 */
class py_uvm_seq extends my_seq_if_base #(uvm_sequence);
	`uvm_object_utils(py_uvm_seq)

	function new(string name="py_uvm_seq");
		super.new(name);
	endfunction

endclass


