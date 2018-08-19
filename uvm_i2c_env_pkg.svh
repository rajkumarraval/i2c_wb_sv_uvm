//------------------------------------------------------------------------------
//Verification Engineer: Rajkumar Raval
//Company Name: Personal Project.
//File Description: This file contains package in which all the class based components of the 
//I2C verification environment has been included  
//This class instantiates the agent and subscriber.
//License: Released under Creative Commons Attribution - BY
//------------------------------------------------------------------------------

package i2c_env_pkg;

import ovm_pkg::*;
`include "ovm_macros.svh"

`include "ovm_i2c_interface_wrapper.svh"
`include "ovm_i2c_wb_scoreboard.svh"

`include "ovm_i2c_transaction.svh"
`include "ovm_i2c_sequence.svh"
`include "ovm_i2c_sequencer.svh"
`include "ovm_i2c_master_driver.svh"
`include "ovm_i2c_monitor.svh"
`include "ovm_i2c_subscriber.svh"
`include "ovm_i2c_agent.svh"


`include "ovm_wb_transaction.svh"
`include "ovm_wb_sequence.svh"
`include "ovm_wb_sequencer.svh"
`include "ovm_wb_driver.svh"
`include "ovm_wb_monitor.svh"
`include "ovm_wb_subscriber.svh"
`include "ovm_wb_agent.svh"


`include "ovm_i2c_env.svh"
`include "ovm_i2c_test1_init_wb.svh"
`include "ovm_i2c_test1_wrt_data.svh"


//import i2c_agent::*;
//import wb_agent::*

endpackage
