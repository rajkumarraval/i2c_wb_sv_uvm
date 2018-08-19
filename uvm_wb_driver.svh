
//------------------------------------------------------------------------------
//Verification Engineer: Rajkumar Raval
//Company Name: Personal Project.
//File Description: This file contains the Wishbone driver. This driver is used to configure the DUT 
//on the Wishbone bus. 
//License: Released under Creative Commons Attribution - BY
//------------------------------------------------------------------------------
`include "ovm_macros.svh"
import ovm_pkg::*;

class wb_driver extends ovm_driver #(wb_transaction);
//------------------------------------------------------------------------------
//registering with factory
//------------------------------------------------------------------------------
  `ovm_component_utils (wb_driver)
  
//------------------------------------------------------------------------------
//instantiating virtual interface
//------------------------------------------------------------------------------
  virtual i2c_if i2c_vi;

//------------------------------------------------------------------------------
//consctructor
//------------------------------------------------------------------------------
  function new (string name, ovm_component parent);
    super.new(name, parent);
  endfunction

//------------------------------------------------------------------------------
//Build method which retrieves the interface from the configuration database
//------------------------------------------------------------------------------
  function void build();
    super.build();
    begin
      ovm_object obj;
      i2c_if_wrapper i2c_if_wrapper1;
      get_config_object("i2c_if_wrapper", obj, 0);
      assert($cast(i2c_if_wrapper1, obj));
      i2c_vi = i2c_if_wrapper1.i2c_vi;
    end
  endfunction


//------------------------------------------------------------------------------
//Main run method which consumes time and wiggles pins of the DUT
//Comprises task to read and write data over Wishbone bus
//------------------------------------------------------------------------------
  
  task run;
      reg [7:0] addr_in;
      reg [7:0] data_in;
      repeat(4)
      begin
        wb_transaction wb_tx;
        @(posedge i2c_vi.clk);
        seq_item_port.get(wb_tx);

        addr_in = wb_tx.addr;   
        data_in = wb_tx.data;

        write_data_2_slave(addr_in, data_in);
        @(posedge i2c_vi.clk) ovm_top.stop_request();
      end
  endtask

//------------------------------------------------------------------------------
//Basic task to communicate on the Wishbone side of the interface of the DUT
//------------------------------------------------------------------------------
task write_data_2_slave (input [7:0] addr_in, input [7:0] data_in);
  @(posedge i2c_vi.clk);
  i2c_vi.we = 1;
  i2c_vi.addr_in = addr_in; //8'h0c;
  i2c_vi.data_in = data_in; //8'h02;
  i2c_vi.wb_cyc_i = 1;
  i2c_vi.wb_stb_i = 1;
  @(negedge i2c_vi.ack_o);
  i2c_vi.we = 0;
  i2c_vi.wb_stb_i = 0;
  i2c_vi.wb_cyc_i = 0;
  i2c_vi.addr_in = 8'h00;
  i2c_vi.data_in = 8'b00;
  @(posedge i2c_vi.clk);

  //i2c_vi.addr_in = 8'h0a;
  //i2c_vi.data_in = 8'hFF;
  //i2c_vi.addr_in = 8'h0E;
  //i2c_vi.data_in = 8'hde;
endtask
  
endclass
