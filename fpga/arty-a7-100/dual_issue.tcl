set design_name "dual_issue"

create_project -force -part "xc7a100tcsg324-1" ${design_name} biriscv_vivado_project

set_property BOARD_PART digilentinc.com:arty-a7-100:part0:1.1 [current_project]

read_ip "ip/axi_cdc_buffer/axi_cdc_buffer.xci"
generate_target all [get_ips axi_cdc_buffer]
synth_ip [get_ips axi_cdc_buffer]
get_files -all -of_objects [get_files "ip/axi_cdc_buffer/axi_cdc_buffer.xci"]


read_ip "ip/mig_axis/mig_axis.xci"
generate_target all [get_ips mig_axis]
synth_ip [get_ips mig_axis]
get_files -all -of_objects [get_files "ip/mig_axis/mig_axis.xci"]

read_verilog "../../biriscv/src/core/biriscv_alu.v"
read_verilog "../../biriscv/src/core/biriscv_csr.v"
read_verilog "../../biriscv/src/core/biriscv_csr_regfile.v"
read_verilog "../../biriscv/src/core/biriscv_decode.v"
read_verilog "../../biriscv/src/core/biriscv_decoder.v"
read_verilog "../../biriscv/src/core/biriscv_defs.v"
read_verilog "../../biriscv/src/core/biriscv_divider.v"
read_verilog "../../biriscv/src/core/biriscv_exec.v"
read_verilog "../../biriscv/src/core/biriscv_fetch.v"
read_verilog "../../biriscv/src/core/biriscv_frontend.v"
read_verilog "../../biriscv/src/core/biriscv_issue.v"
read_verilog "../../biriscv/src/core/biriscv_lsu.v"
read_verilog "../../biriscv/src/core/biriscv_mmu.v"
read_verilog "../../biriscv/src/core/biriscv_multiplier.v"
read_verilog "../../biriscv/src/core/biriscv_npc.v"
read_verilog "../../biriscv/src/core/biriscv_pipe_ctrl.v"
read_verilog "../../biriscv/src/core/biriscv_regfile.v"
read_verilog "../../biriscv/src/core/biriscv_xilinx_2r1w.v"
read_verilog "../../biriscv/src/core/riscv_core.v"
read_verilog "../../biriscv/src/dcache/dcache.v"
read_verilog "../../biriscv/src/dcache/dcache_axi.v"
read_verilog "../../biriscv/src/dcache/dcache_axi_axi.v"
read_verilog "../../biriscv/src/dcache/dcache_core.v"
read_verilog "../../biriscv/src/dcache/dcache_core_data_ram.v"
read_verilog "../../biriscv/src/dcache/dcache_core_tag_ram.v"
read_verilog "../../biriscv/src/dcache/dcache_if_pmem.v"
read_verilog "../../biriscv/src/dcache/dcache_mux.v"
read_verilog "../../biriscv/src/dcache/dcache_pmem_mux.v"
read_verilog "../../biriscv/src/icache/icache.v"
read_verilog "../../biriscv/src/icache/icache_data_ram.v"
read_verilog "../../biriscv/src/icache/icache_tag_ram.v"
read_verilog "biriscv_top.v"
read_verilog "biriscv_soc.v"

read_verilog "../../soc/axi4_arb.v"
read_verilog "../../soc/axi4_lite_tap.v"
read_verilog "../../soc/axi4_retime.v"
read_verilog "../../soc/axi4lite_axi4_conv.v"
read_verilog "../../soc/gpio_defs.v"
read_verilog "../../soc/gpio.v"
read_verilog "../../soc/irq_ctrl_defs.v"
read_verilog "../../soc/irq_ctrl.v"
read_verilog "../../soc/soc.v"
read_verilog "../../soc/spi_lite_defs.v"
read_verilog "../../soc/spi_lite.v"
read_verilog "../../soc/timer_defs.v"
read_verilog "../../soc/timer.v"
read_verilog "../../soc/uart_lite_defs.v"
read_verilog "../../soc/uart_lite.v"

read_verilog "dbg_bridge.v"
read_verilog "dbg_bridge_fifo.v"
read_verilog "dbg_bridge_uart.v"
read_verilog "arty_ddr.v"
read_verilog "axi4_cdc.v"
read_verilog "fpga_top.v"
read_verilog "artix7_pll.v"
read_verilog "top.v"


read_xdc "arty-a7-100t.xdc"

synth_design -top "top" -part "xc7a100tcsg324-1"
opt_design
place_design
route_design

write_bitstream -force "${design_name}.bit"
