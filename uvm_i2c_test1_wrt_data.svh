//------------------------------------------------------------------------------
//Verification Engineer: Rajkumar Raval
//Company Name: Personal Project.
//File Description: This file contains a test which instantiates the entire verification 
//environment and configures it to run the test on the DUT 
//License: Released under Creative Commons Attribution - BY
//------------------------------------------------------------------------------
`include "ovm_macros.svh"
import ovm_pkg::*;

class i2c_test1 extends ovm_test; 
//------------------------------------------------------------------------------
//Registering the class with factory
//------------------------------------------------------------------------------
  `ovm_component_utils(i2c_test1)

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
    i2c_sequence seq;
    seq = i2c_sequence ::type_id::create("seq");
    seq.start(i2c_env_h.i2c_agent_h.i2c_sequencer_h);
  endtask
  
endclass


