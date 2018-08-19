//------------------------------------------------------------------------------
//Verification Engineer: Rajkumar Raval
//Company Name: Personal Project.
//File Description: This file contains the definition of the wb agent. The agent comprises of
//sequencer, Wishbone driver, I2C driver and a monitor.
//License: Released under Creative Commons Attribution - BY
//------------------------------------------------------------------------------
`include "ovm_macros.svh"
import ovm_pkg::*;

class wb_agent extends ovm_agent; 
  
//------------------------------------------------------------------------------
//Registering the class with factory
//------------------------------------------------------------------------------
  `ovm_component_utils (wb_agent);
 
//------------------------------------------------------------------------------
//Declaring the analysis port which is connected to the analysis port of the monitor
//this is to pass transactions from the monitor to another component(s) in the 
//verification environment
//------------------------------------------------------------------------------
  ovm_analysis_port #(wb_transaction) aport;   

//------------------------------------------------------------------------------
//Instantiating various components of the agent
//Sequencer, Wishbone driver, I2C driver and a monitor
//------------------------------------------------------------------------------
  wb_sequencer      wb_sequencer_h;
  wb_driver         wb_driver_h;
  wb_monitor        wb_monitor_h;
  wb_subscriber     wb_subscriber_h;

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
    wb_sequencer_h       = wb_sequencer::type_id::create("wb_sequencer_h", this);
    wb_driver_h       = wb_driver::type_id::create("wb_driver_h", this);
    wb_monitor_h      = wb_monitor::type_id::create("wb_monitor_h", this);
    wb_subscriber_h      = wb_subscriber::type_id::create("wb_subscriber_h", this);
  endfunction

//------------------------------------------------------------------------------
//Connect method: Connecting the port of driver to the and export of the sequencer and
//connecting the analysis port of the monitor to the analysis port of this agent
//------------------------------------------------------------------------------
  function void connect();
    wb_driver_h.seq_item_port.connect( wb_sequencer_h.seq_item_export);
    wb_monitor_h.aport.connect(aport);
    wb_monitor_h.aport.connect(wb_subscriber_h.analysis_export);
  endfunction

endclass


