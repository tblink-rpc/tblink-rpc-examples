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
	
	TbLinkAgent				m_tblink_agent;

	function new(string name="py_uvm_seq_test", uvm_component parent=null);
		super.new(name, parent);
	endfunction
	
	function void build_phase(uvm_phase phase);
		TbLinkAgentConfig cfg = mkConfigPythonSingleObject("my_seq_if");
		m_tblink_agent = TbLinkAgent::type_id::create("m_tblink_agent", this);
		
		void'(m_tblink_agent.init(cfg));
		
	endfunction
	
	task run_phase(uvm_phase phase);
		py_uvm_seq seq1 = py_uvm_seq::type_id::create();
		py_uvm_seq seq2 = py_uvm_seq::type_id::create();
		
		my_seq_if_factory #(py_uvm_seq)::createObj(seq1, m_tblink_agent.m_ep);
		/*
		my_seq_if_factory #(py_uvm_seq)::createObj(seq2);
		 */
		
		phase.raise_objection(this, "Main");
//		fork
			seq1.start(null);
//			seq2.start(null);
//		join
		phase.drop_objection(this, "Main");

	endtask


endclass


