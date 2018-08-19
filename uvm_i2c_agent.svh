//------------------------------------------------------------------------------
//Verification Engineer: Rajkumar Raval
//Company Name: Personal Project.
//File Description: This file contains the definition of the i2c agent. The agent comprises of
//sequencer, Wishbone driver, I2C driver and a monitor.
//License: Released under Creative Commons Attribution - BY
//------------------------------------------------------------------------------
`include "ovm_macros.svh"
import ovm_pkg::*;

class i2c_agent extends ovm_agent; 
  
//------------------------------------------------------------------------------
//Registering the class with factory
//------------------------------------------------------------------------------
  `ovm_component_utils (i2c_agent);
 
//------------------------------------------------------------------------------
//Declaring the analysis port which is connected to the analysis port of the monitor
//this is to pass transactions from the monitor to another component(s) in the 
//verification environment
//------------------------------------------------------------------------------
  ovm_analysis_port #(i2c_transaction) aport;   

//------------------------------------------------------------------------------
//Instantiating various components of the agent
//Sequencer, Wishbone driver, I2C driver and a monitor
//------------------------------------------------------------------------------
  i2c_sequencer     i2c_sequencer_h;
  i2c_master_driver i2c_master_driver_h;
  i2c_monitor       i2c_monitor_h;
  i2c_subscriber    i2c_subscriber_h;

//------------------------------------------------------------------------------
//Constructor
//------------------------------------------------------------------------------
  function new (string name, ovm_component parent);
    super.new(name, parent);
  endfunction

//------------------------------------------------------------------------------
//Overriding the default build method in order to create various objects using
//factory method
//------------------------------------------------------------------------------
  function void build();
    super.build();
    aport = new("aport", this);
    i2c_sequencer_h       = i2c_sequencer::type_id::create("i2c_sequencer_h", this);
    i2c_master_driver_h   = i2c_master_driver::type_id::create("i2c_master_driver_h", this);
    i2c_monitor_h         = i2c_monitor::type_id::create("i2c_monitor_h", this);
    i2c_subscriber_h         = i2c_subscriber::type_id::create("i2c_subscriber_h", this);
  endfunction

//------------------------------------------------------------------------------
//Connect method: Connecting the port of driver to the and export of the sequencer and
//connecting the analysis port of the monitor to the analysis port of this agent
//------------------------------------------------------------------------------
  function void connect();
    i2c_master_driver_h.seq_item_port.connect( i2c_sequencer_h.seq_item_export);
    i2c_monitor_h.aport.connect(aport);
    i2c_monitor_h.aport.connect(i2c_subscriber_h.analysis_export);
  endfunction

endclass


