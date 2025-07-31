set design_name "single_issue"

create_project -force -part "xc7a100tcsg324-1" ${design_name} vivado_project

set_property BOARD_PART digilentinc.com:arty-a7-100:part0:1.1 [current_project]

read_ip "ip/axi_cdc_buffer/axi_cdc_buffer.xci"
generate_target all [get_ips axi_cdc_buffer]
synth_ip [get_ips axi_cdc_buffer]
get_files -all -of_objects [get_files "ip/axi_cdc_buffer/axi_cdc_buffer.xci"]


read_ip "ip/mig_axis/mig_axis.xci"
generate_target all [get_ips mig_axis]
synth_ip [get_ips mig_axis]
get_files -all -of_objects [get_files "ip/mig_axis/mig_axis.xci"]

read_verilog -sv "../../core/core/rv32imsu/riscv_defs.v"
read_verilog -sv "../../core/core/rv32imsu/riscv_alu.v"
read_verilog -sv "../../core/core/rv32imsu/riscv_core.v"
read_verilog -sv "../../core/core/rv32imsu/riscv_csr.v"
read_verilog -sv "../../core/core/rv32imsu/riscv_decode.v"
read_verilog -sv "../../core/core/rv32imsu/riscv_exec.v"
read_verilog -sv "../../core/core/rv32imsu/riscv_fetch.v"
read_verilog -sv "../../core/core/rv32imsu/riscv_lsu.v"
read_verilog -sv "../../core/core/rv32imsu/riscv_mmu.v"
read_verilog -sv "../../core/core/rv32imsu/riscv_mmu_arb.v"
read_verilog -sv "../../core/core/rv32imsu/riscv_muldiv.v"
read_verilog -sv "../../core/core/rv32imsu/riscv_regfile.v"

read_verilog -sv "../../soc/axi4_arb.v"
read_verilog -sv "../../soc/axi4_lite_tap.v"
read_verilog -sv "../../soc/axi4_retime.v"
read_verilog -sv "../../soc/axi4lite_axi4_conv.v"
read_verilog -sv "../../soc/dport_bridge.v"
read_verilog -sv "../../soc/gpio_defs.v"
read_verilog -sv "../../soc/gpio.v"
read_verilog -sv "../../soc/icache.v"
read_verilog -sv "../../soc/icache_data_ram.v"
read_verilog -sv "../../soc/icache_tag_ram.v"
read_verilog -sv "../../soc/irq_ctrl_defs.v"
read_verilog -sv "../../soc/irq_ctrl.v"
read_verilog -sv "../../soc/riscv_soc.v"
read_verilog -sv "../../soc/riscv_top.v"
read_verilog -sv "../../soc/soc.v"
read_verilog -sv "../../soc/spi_lite_defs.v"
read_verilog -sv "../../soc/spi_lite.v"
read_verilog -sv "../../soc/timer_defs.v"
read_verilog -sv "../../soc/timer.v"
read_verilog -sv "../../soc/uart_lite_defs.v"
read_verilog -sv "../../soc/uart_lite.v"

read_verilog -sv "dbg_bridge.v"
read_verilog -sv "dbg_bridge_fifo.v"
read_verilog -sv "dbg_bridge_uart.v"
read_verilog -sv "arty_ddr.v"
read_verilog -sv "axi4_cdc.v"
read_verilog -sv "fpga_top.v"
read_verilog -sv "artix7_pll.v"
read_verilog -sv "top.v"

read_xdc "arty-a7-100t.xdc"

synth_design -top "top" -part "xc7a100tcsg324-1"
opt_design
place_design
route_design

write_bitstream -force "${design_name}.bit"
