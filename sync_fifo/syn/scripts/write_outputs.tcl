#################################
### Write outputs
#################################

write_snapshot -outdir $REPORTS_PATH -tag final
report_summary -directory ${REPORTS_PATH}
write_hdl  > ${OUTPUTS_PATH}/${BLOCK_NAME}.vg
write_sdc > ${OUTPUTS_PATH}/${BLOCK_NAME}_m.sdc

write_do_lec -golden_design fv_map -revised_design ${OUTPUTS_PATH}/${BLOCK_NAME}_m.v -logfile  ${LOG_PATH}/intermediate2final.lec.log > ${OUTPUTS_PATH}/intermediate2final.lec.do
write_do_lec -revised_design ${OUTPUTS_PATH}/${BLOCK_NAME}_m.v -logfile ${LOG_PATH}/rtl2final.lec.log > ${OUTPUTS_PATH}/rtl2final.lec.do

write_dft_atpg -directory $OUTPUTS_PATH -run_from_directory -library /home/lvalent/training/RTL_DFT_OPCG_COMP_GENUS_MODUS23.10/LIBS/verilog/typical.v