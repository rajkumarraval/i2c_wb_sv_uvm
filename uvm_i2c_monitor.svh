//------------------------------------------------------------------------------
//Verification Engineer: Rajkumar Raval
//Company Name: Personal Project.
//File Description: This file contains the monitor component. Still under construction.
//License: Released under Creative Commons Attribution - BY
//------------------------------------------------------------------------------
`include "ovm_macros.svh"
import ovm_pkg::*;

class i2c_monitor extends ovm_monitor;
//------------------------------------------------------------------------------
//Registering the class
//------------------------------------------------------------------------------
  `ovm_component_utils(i2c_monitor);

//------------------------------------------------------------------------------
//instantiating the analysis port
//------------------------------------------------------------------------------
  ovm_analysis_port #(i2c_transaction) aport;

//------------------------------------------------------------------------------
//Instantiating the virtual interface
//------------------------------------------------------------------------------
  virtual i2c_if i2c_vi;

//------------------------------------------------------------------------------
//constructor
//------------------------------------------------------------------------------
  function new (string name, ovm_component parent);
    super.new(name, parent);
  endfunction

//------------------------------------------------------------------------------
//build method. Here we retrieve the interface from the configuration database.
//------------------------------------------------------------------------------
  function void build();
    super.build();
    aport = new("aport", this);
    begin
      ovm_object obj;
      i2c_if_wrapper i2c_if_wrapper1;
      get_config_object("i2c_if_wrapper", obj, 0);
      assert($cast(i2c_if_wrapper1, obj));
      i2c_vi = i2c_if_wrapper1.i2c_vi;
    end
  endfunction

//------------------------------------------------------------------------------
//Main run method which monitors the pin wiggles and creates transactions.
//State machines that detect data on the SDA lines will have to be implemented.
//Here the monitor behaves as a I2C slave. TODO
//------------------------------------------------------------------------------
    task run;
      forever
      begin
        i2c_transaction i2c_tx;
        i2c_tx = i2c_transaction::type_id::create("i2c_tx");
        @(posedge i2c_vi.clk);
        //i2c_tx.sda = i2c_vi.sda;
        //i2c_tx.addr = i2c_vi.addr;
        //i2c_tx.data = i2c_vi.data;
      end
      //aport.write(i2c_tx);
    endtask
endclass

//-------------------------------

