//------------------------------------------------------------------------------
//Verification Engineer: Rajkumar Raval
//Company Name: Personal Project.
//File Description: This file contains a test which instantiates the entire verification 
//environment and configures it to run the test on the DUT 
//License: Released under Creative Commons Attribution - BY
//------------------------------------------------------------------------------
`include "ovm_macros.svh"
import ovm_pkg::*;

class init_wb extends ovm_test; 
//------------------------------------------------------------------------------
//Registering the class with factory
//------------------------------------------------------------------------------
  `ovm_component_utils(init_wb)

//------------------------------------------------------------------------------
//Instantiating the env
//------------------------------------------------------------------------------
  i2c_env i2c_env_h;
  
//------------------------------------------------------------------------------
//Constructor
//------------------------------------------------------------------------------
  function new(string name, ovm_component parent);
    super.new(name, parent);
  endfunction

//------------------------------------------------------------------------------
//Build method which creates the environment using factory method
//------------------------------------------------------------------------------
  function void build();
    super.build();
    i2c_env_h = i2c_env::type_id::create("i2c_env_h", this);
  endfunction

//------------------------------------------------------------------------------
//Run method which creates and starts a sequence on the DUT using the sequencer
//------------------------------------------------------------------------------
  task run;
    wb_sequence seq;
    seq = wb_sequence ::type_id::create("seq");
    seq.start(i2c_env_h.wb_agent_h.wb_sequencer_h);
  endtask
  
endclass


