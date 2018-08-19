//------------------------------------------------------------------------------
//Verification Engineer: Rajkumar Raval
//Company Name: Personal Project.
//File Description: This file contains the wrapper class to wrap the SystemVerilog structural component interface
//in order to pass it to the configuration database. This is no long required if the ovm - container class is used
//License: Released under Creative Commons Attribution - BY
//------------------------------------------------------------------------------
import ovm_pkg::*;

class i2c_if_wrapper extends ovm_object;

//------------------------------------------------------------------------------
//Instantiating virtual interface
//------------------------------------------------------------------------------
  virtual i2c_if i2c_vi;

//------------------------------------------------------------------------------
//constructor and passing the interface as the argument
//------------------------------------------------------------------------------
  function new (string name, virtual i2c_if arg);
    super.new(name);
    i2c_vi = arg;
  endfunction

endclass : i2c_if_wrapper 
