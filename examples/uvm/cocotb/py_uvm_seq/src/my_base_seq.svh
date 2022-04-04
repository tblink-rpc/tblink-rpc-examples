
/****************************************************************************
 * my_base_seq.svh
 ****************************************************************************/

  
/**
 * Class: my_base_seq
 * 
 * TODO: Add class documentation
 */
class my_base_seq extends uvm_sequence;
	`uvm_object_utils(my_base_seq)

	virtual task read(
		input unsigned int		initiator_if,
		input unsigned int		address,
		output unsigned int		data);
	endtask
	
	virtual task write(
		input unsigned int		initiator_if,
		input unsigned int		address,
		input unsigned int		data);
	endtask

endclass


