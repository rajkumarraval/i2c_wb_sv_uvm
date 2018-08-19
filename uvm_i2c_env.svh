//------------------------------------------------------------------------------
//Verification Engineer: Rajkumar Raval
//Company Name: Personal Project.
//File Description: This file contains the definition of the i2c verification env class. 
//This class instantiates the agent and subscriber.
//License: Released under Creative Commons Attribution - BY
//------------------------------------------------------------------------------
`include "ovm_macros.svh"
import ovm_pkg::*;

class i2c_env extends ovm_env; 
//------------------------------------------------------------------------------
//Registering the class with the factory utils
//------------------------------------------------------------------------------
  `ovm_component_utils(i2c_env)

//------------------------------------------------------------------------------
//Instantiating the agent and coverage subscriber
//------------------------------------------------------------------------------
  i2c_agent i2c_agent_h;
  wb_agent wb_agent_h;
  i2c_wb_scoreboard i2c_wb_scoreboard_h;
  //i2c_subscriber i2c_subscriber_h;
  //wb_subscriber wb_subscriber_h;

//------------------------------------------------------------------------------
//Constructor for this class
//------------------------------------------------------------------------------

  function new (string name, ovm_component parent);
    super.new(name, parent);
  endfunction

//------------------------------------------------------------------------------
//Build method which creates agent and subscriber objects using factory method
//------------------------------------------------------------------------------
  function void build();

    super.build();
    i2c_wb_scoreboard_h = i2c_wb_scoreboard::type_id::create("i2c_wb_scoreboard_h", this);
    i2c_agent_h = i2c_agent::type_id::create("i2c_agent_h", this);
    //i2c_subscriber_h = i2c_subscriber::type_id::create("i2c_subscriber_h", this);
    wb_agent_h = wb_agent::type_id::create("wb_agent_h", this);
    //wb_subscriber_h = wb_subscriber::type_id::create("wb_subscriber_h", this);
  endfunction

//------------------------------------------------------------------------------
//Connecting the analysis port of the agent to the export of the coverage subscriber
//in order to receive transaction for coverage purposes
//------------------------------------------------------------------------------
  function void connect();
    //i2c_agent_h.aport.connect(i2c_subscriber_h.analysis_export);
    //wb_agent_h.aport.connect(wb_subscriber_h.analysis_export);
  endfunction


endclass


