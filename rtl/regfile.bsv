package registerfile;
  // library package
  import RegFile :: *;

  // -------------------------- interface definitions ------------------------------------------ //
  interface Ifc_registerfile;
    method Action upd(Bit#(5) addr, Bit#(32) d);
    method ActionValue #(Bit#(32)) src1(Bit#(5) addr);
    method ActionValue #(Bit#(32)) src2(Bit#(5) addr);
  endinterface: Ifc_registerfile
  // ----------------------------end interface definitions ------------------------------------- //

  // ------------------------- module definitions ---------------------------------------------- //
  module mkregisterfile(Ifc_registerfile);
    // -------------------- Instantiations ------------------------------------------------------ //

    RegFile#(Bit#(5), Bit#(32)) rf <- mkRegFileWCF(0,31);

    // capture the curren address and value being written into the regfile
    Wire#(Bit#(5)) wr_write_address <- mkDWire(0);
    Wire#(Bit#(32)) wr_write_data <- mkDWire(0);

    // update the regfile with new data
    method Action upd(Bit#(5) addr, Bit#(32) d);
      rf.upd(addr, d);
      wr_write_address <= addr;
      wr_write_data <= d;
    endmethod

    // read the latest content of the regfile at a particular address
    method ActionValue #(Bit#(32)) src1(Bit#(5) addr);
      if( addr == wr_write_address )
        return wr_write_data;
      else
        return zeroExtend(rf.sub(addr));
    endmethod
    // read the latest content of the regfile at a particular address
    method ActionValue #(Bit#(32)) src2(Bit#(5) addr);
        if( addr == wr_write_address )
          return wr_write_data;
        else
          return zeroExtend(rf.sub(addr));
      endmethod
  endmodule: mkregisterfile
  // ----------------------------end module definitions ------------------------------------- //
endpackage

