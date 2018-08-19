//------------------------------------------------------------------------------
//Verification Engineer: Rajkumar Raval
//Company Name: Personal Project.
//File Description: This file contains the I2C agent package in which all the class based components of the 
//I2C agent has been included  
//This class instantiates the agent and subscriber.
//License: Released under Creative Commons Attribution - BY
//------------------------------------------------------------------------------

package i2c_agent_pkg;

`include "ovm_macros.svh"
import ovm_pkg::*;

`include "ovm_i2c_transaction.svh"
`include "ovm_i2c_sequence.svh"
`include "ovm_i2c_sequencer.svh"
`include "ovm_i2c_master_driver.svh"
`include "ovm_i2c_monitor.svh"
`include "ovm_i2c_agent.svh"
`include "ovm_i2c_subscriber.svh"

endpackage
