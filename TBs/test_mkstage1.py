import cocotb
from cocotb.triggers import Timer, RisingEdge
from cocotb import Clock



@cocotb.test()
async def mkstage1_test(dut):
    clock = Clock(dut.clk, 10, units="us")  # Create a 10us period clock on port clk
    # Start the clock. Start it low to avoid issues on the first RisingEdge
    cocotb.start_soon(clock.start(start_high=False))
    
    for i in range(4):
        dut.RST_N.value = 0
        await RisingEdge(dut.CLK)
        print(f"The value of the PC: {dut.program_counter.value}")
        assert dut.program_counter.value == i, f"Error at iteration" 
        
    pass