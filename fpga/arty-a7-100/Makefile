BOARD=arty_a7_100t

dual: dual_issue.bit

single: single_issue.bit

all: single dual

%.bit: %.tcl
	vivado -tempDir tmp_vivado -mode batch -source $<

flash-dual: dual_issue.bit
	openFPGALoader -b ${BOARD} $<

flash-single: single_issue.bit
	openFPGALoader -b ${BOARD} $<

clean:
	rm -rf tmp_vivado vivado.jou vivado.log vivado_*.backup.jou vivado_*.backup.log .Xil

Clean: clean
	rm -rf \
		birisc_vivado_project \
		vivado_project \
		clockInfo.txt \
		ip/axi_cdc_buffer/axi_cdc_buffer.dcp \
		ip/axi_cdc_buffer/axi_cdc_buffer.veo \
		ip/axi_cdc_buffer/axi_cdc_buffer.vho \
		ip/axi_cdc_buffer/axi_cdc_buffer.xml \
		ip/axi_cdc_buffer/axi_cdc_buffer_clocks.xdc \
		ip/axi_cdc_buffer/axi_cdc_buffer_ooc.xdc \
		ip/axi_cdc_buffer/axi_cdc_buffer_sim_netlist.v \
		ip/axi_cdc_buffer/axi_cdc_buffer_sim_netlist.vhdl \
		ip/axi_cdc_buffer/axi_cdc_buffer_stub.v \
		ip/axi_cdc_buffer/axi_cdc_buffer_stub.vhdl \
		ip/axi_cdc_buffer/doc/ \
		ip/axi_cdc_buffer/hdl/ \
		ip/axi_cdc_buffer/sim/ \
		ip/axi_cdc_buffer/simulation/ \
		ip/axi_cdc_buffer/synth/ \
		ip/axi_cdc_buffer/sysc/ \
		ip/mig_axis/doc/ \
		ip/mig_axis/mig_axis.dcp \
		ip/mig_axis/mig_axis.veo \
		ip/mig_axis/mig_axis.xml \
		ip/mig_axis/mig_axis/ \
		ip/mig_axis/mig_axis_sim_netlist.v \
		ip/mig_axis/mig_axis_sim_netlist.vhdl \
		ip/mig_axis/mig_axis_stub.v \
		ip/mig_axis/mig_axis_stub.vhdl \
		ip/mig_axis/mig_axis_xmdf.tcl \
		ip/mig_axis/xil_txt.in \
		ip/mig_axis/xil_txt.out \
		*.bit \
		tight_setup_hold_pins.txt \
		vivado*.jou \
		vivado*.log
