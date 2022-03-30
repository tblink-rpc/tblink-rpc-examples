/****************************************************************************
 * py_uvm_seq_test.svh
 ****************************************************************************/

  
/**
 * Class: py_uvm_seq_test
 * 
 * TODO: Add class documentation
 */
class py_uvm_seq_test extends uvm_test;
	`uvm_component_utils(py_uvm_seq_test)

	function new(string name="py_uvm_seq_test", uvm_component parent=null);
		super.new(name, parent);
	endfunction
	
	task run_phase(uvm_phase phase);
		py_uvm_seq seq1 = py_uvm_seq::type_id::create();
		py_uvm_seq seq2 = py_uvm_seq::type_id::create();
		TbLinkAgentConfig cfg1 = mkConfigPythonSingleObject("my_seq_if");
		TbLinkAgentConfig cfg2 = mkConfigPythonSingleObject("my_seq_if");
		
		seq1.set_config(cfg1);
		seq2.set_config(cfg2);
		
		phase.raise_objection(this, "Main");
//		fork
			seq1.start(null);
//			seq2.start(null);
//		join
		phase.drop_objection(this, "Main");

	endtask


endclass


