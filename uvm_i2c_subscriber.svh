//------------------------------------------------------------------------------
//Verification Engineer: Rajkumar Raval
//Company Name: Personal Project.
//File Description: This file contains the coverage subscriber component. Coverage groups and bins are
//defined here for the purpose of functional coverage. Under construction
//License: Released under Creative Commons Attribution - BY
//------------------------------------------------------------------------------
`include "ovm_macros.svh"
import ovm_pkg::*;

class i2c_subscriber extends ovm_subscriber #(i2c_transaction);
  `ovm_component_utils(i2c_subscriber)

    bit cmd;
    logic [6:0] addr;
    logic [7:0] data;

//------------------------------------------------------------------------------
//cover group
//------------------------------------------------------------------------------
    covergroup cover_bus;
      //coverpoint cmd;
//------------------------------------------------------------------------------
//cover bins containing address
//------------------------------------------------------------------------------
      coverpoint addr { 
        bins a[7] = {[0:127]}; 
      }
//------------------------------------------------------------------------------
//cover bins containing data
//------------------------------------------------------------------------------
      coverpoint data {
        bins d[8] = {[0:255]};
      }
    endgroup

//------------------------------------------------------------------------------
//Constructor
//------------------------------------------------------------------------------
    function new (string name, ovm_component parent);
      super.new(name, parent);
    endfunction

//------------------------------------------------------------------------------
//Class build method. 
//------------------------------------------------------------------------------
    function void build();
      super.build();
    endfunction

//------------------------------------------------------------------------------
//Write method of the subscriber which captures transcations and samples them
//for coverage
//------------------------------------------------------------------------------

    function void write(i2c_transaction t);
      data = t.data;
      addr = t.addr;
      cover_bus.sample();
      ovm_report_info("ja", "Transaction Received");
    endfunction
    
endclass


