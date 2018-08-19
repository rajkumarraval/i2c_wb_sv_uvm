//------------------------------------------------------------------------------
//Verification Engineer: Rajkumar Raval
//Company Name: Personal Project.
//File Description: This file contains the scoreboard component which compares and checks the transactions that
//are input to DUT and output from WB and vice versa
//License: Released under Creative Commons Attribution - BY
//------------------------------------------------------------------------------
`include "ovm_macros.svh"
import ovm_pkg::*;

class i2c_wb_scoreboard extends ovm_component;
  `ovm_component_utils(i2c_wb_scoreboard)


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

endclass


