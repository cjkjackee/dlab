wvResizeWindow -win $_nWave1 -9 32 1134 714
wvResizeWindow -win $_nWave1 -4 32 1134 718
wvResizeWindow -win $_nWave1 -4 32 1134 733
wvResizeWindow -win $_nWave1 -4 32 1134 775
wvResizeWindow -win $_nWave1 -4 32 1134 786
wvResizeWindow -win $_nWave1 -4 32 1134 797
wvResizeWindow -win $_nWave1 -4 32 1134 806
wvResizeWindow -win $_nWave1 -4 32 1134 813
wvResizeWindow -win $_nWave1 -4 32 1134 818
wvResizeWindow -win $_nWave1 -4 32 1134 823
wvResizeWindow -win $_nWave1 -4 32 1134 830
wvResizeWindow -win $_nWave1 -4 32 1134 841
wvResizeWindow -win $_nWave1 -4 32 1134 854
wvResizeWindow -win $_nWave1 -4 32 1134 868
wvResizeWindow -win $_nWave1 -4 32 1134 881
wvResizeWindow -win $_nWave1 -4 32 1134 892
wvResizeWindow -win $_nWave1 -4 32 1134 903
wvResizeWindow -win $_nWave1 -4 32 1134 911
wvResizeWindow -win $_nWave1 -4 32 1134 916
wvResizeWindow -win $_nWave1 -4 32 1134 920
wvResizeWindow -win $_nWave1 -4 32 1134 924
wvResizeWindow -win $_nWave1 -4 32 1134 929
wvResizeWindow -win $_nWave1 -4 32 1134 933
wvResizeWindow -win $_nWave1 -4 32 1134 943
wvResizeWindow -win $_nWave1 -4 32 1134 944
wvResizeWindow -win $_nWave1 -4 32 1134 945
wvResizeWindow -win $_nWave1 -4 32 1134 946
wvResizeWindow -win $_nWave1 -4 32 1134 949
wvResizeWindow -win $_nWave1 -4 32 1134 953
wvResizeWindow -win $_nWave1 -4 32 1134 957
wvResizeWindow -win $_nWave1 -4 32 1134 961
wvResizeWindow -win $_nWave1 -4 32 1134 967
wvResizeWindow -win $_nWave1 -4 32 1134 974
wvResizeWindow -win $_nWave1 -4 32 1134 978
wvResizeWindow -win $_nWave1 -4 32 1134 981
wvResizeWindow -win $_nWave1 -4 32 1134 984
wvResizeWindow -win $_nWave1 -4 32 1134 986
wvResizeWindow -win $_nWave1 -4 32 1134 989
wvResizeWindow -win $_nWave1 -4 32 1134 993
wvResizeWindow -win $_nWave1 -4 32 1134 996
wvResizeWindow -win $_nWave1 -4 32 1134 998
wvResizeWindow -win $_nWave1 -4 32 1134 1002
wvResizeWindow -win $_nWave1 -4 32 1134 1005
wvResizeWindow -win $_nWave1 -4 32 1134 1008
wvResizeWindow -win $_nWave1 -4 32 1134 1009
wvResizeWindow -win $_nWave1 -4 32 1134 1010
wvResizeWindow -win $_nWave1 -4 32 1134 1011
wvResizeWindow -win $_nWave1 -4 32 1134 1014
wvResizeWindow -win $_nWave1 -4 32 1134 1026
wvOpenFile -win $_nWave1 {/users/dlab2016/2016dlab69/Lab02/01_RTL/CONVCOR.fsdb}
wvSetPosition -win $_nWave1 {("G1" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/TESTBED"
wvGetSignalSetScope -win $_nWave1 "/TESTBED/U_DESIGN"
wvSetPosition -win $_nWave1 {("G1" 36)}
wvSetPosition -win $_nWave1 {("G1" 36)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/U_DESIGN/a0_chk} \
{/TESTBED/U_DESIGN/a0_img[7:0]} \
{/TESTBED/U_DESIGN/a0_real[7:0]} \
{/TESTBED/U_DESIGN/a1_chk} \
{/TESTBED/U_DESIGN/a1_img[7:0]} \
{/TESTBED/U_DESIGN/a1_real[7:0]} \
{/TESTBED/U_DESIGN/a2_chk} \
{/TESTBED/U_DESIGN/a2_img[7:0]} \
{/TESTBED/U_DESIGN/a2_real[7:0]} \
{/TESTBED/U_DESIGN/a3_chk} \
{/TESTBED/U_DESIGN/a3_img[7:0]} \
{/TESTBED/U_DESIGN/a3_real[7:0]} \
{/TESTBED/U_DESIGN/a4_chk} \
{/TESTBED/U_DESIGN/a4_img[7:0]} \
{/TESTBED/U_DESIGN/a4_real[7:0]} \
{/TESTBED/U_DESIGN/a_chk} \
{/TESTBED/U_DESIGN/a_img[7:0]} \
{/TESTBED/U_DESIGN/a_real[7:0]} \
{/TESTBED/U_DESIGN/b0_chk} \
{/TESTBED/U_DESIGN/b0_img[7:0]} \
{/TESTBED/U_DESIGN/b0_real[7:0]} \
{/TESTBED/U_DESIGN/b1_chk} \
{/TESTBED/U_DESIGN/b1_img[7:0]} \
{/TESTBED/U_DESIGN/b1_real[7:0]} \
{/TESTBED/U_DESIGN/b2_chk} \
{/TESTBED/U_DESIGN/b2_img[7:0]} \
{/TESTBED/U_DESIGN/b2_real[7:0]} \
{/TESTBED/U_DESIGN/b_chk} \
{/TESTBED/U_DESIGN/b_img[7:0]} \
{/TESTBED/U_DESIGN/b_real[7:0]} \
{/TESTBED/U_DESIGN/cal_valid} \
{/TESTBED/U_DESIGN/clear} \
{/TESTBED/U_DESIGN/clk} \
{/TESTBED/U_DESIGN/in_a[15:0]} \
{/TESTBED/U_DESIGN/in_b[15:0]} \
{/TESTBED/U_DESIGN/in_mode} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 \
           19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 )}
wvSetPosition -win $_nWave1 {("G1" 36)}
wvSetPosition -win $_nWave1 {("G1" 45)}
wvSetPosition -win $_nWave1 {("G1" 45)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/U_DESIGN/a0_chk} \
{/TESTBED/U_DESIGN/a0_img[7:0]} \
{/TESTBED/U_DESIGN/a0_real[7:0]} \
{/TESTBED/U_DESIGN/a1_chk} \
{/TESTBED/U_DESIGN/a1_img[7:0]} \
{/TESTBED/U_DESIGN/a1_real[7:0]} \
{/TESTBED/U_DESIGN/a2_chk} \
{/TESTBED/U_DESIGN/a2_img[7:0]} \
{/TESTBED/U_DESIGN/a2_real[7:0]} \
{/TESTBED/U_DESIGN/a3_chk} \
{/TESTBED/U_DESIGN/a3_img[7:0]} \
{/TESTBED/U_DESIGN/a3_real[7:0]} \
{/TESTBED/U_DESIGN/a4_chk} \
{/TESTBED/U_DESIGN/a4_img[7:0]} \
{/TESTBED/U_DESIGN/a4_real[7:0]} \
{/TESTBED/U_DESIGN/a_chk} \
{/TESTBED/U_DESIGN/a_img[7:0]} \
{/TESTBED/U_DESIGN/a_real[7:0]} \
{/TESTBED/U_DESIGN/b0_chk} \
{/TESTBED/U_DESIGN/b0_img[7:0]} \
{/TESTBED/U_DESIGN/b0_real[7:0]} \
{/TESTBED/U_DESIGN/b1_chk} \
{/TESTBED/U_DESIGN/b1_img[7:0]} \
{/TESTBED/U_DESIGN/b1_real[7:0]} \
{/TESTBED/U_DESIGN/b2_chk} \
{/TESTBED/U_DESIGN/b2_img[7:0]} \
{/TESTBED/U_DESIGN/b2_real[7:0]} \
{/TESTBED/U_DESIGN/b_chk} \
{/TESTBED/U_DESIGN/b_img[7:0]} \
{/TESTBED/U_DESIGN/b_real[7:0]} \
{/TESTBED/U_DESIGN/cal_valid} \
{/TESTBED/U_DESIGN/clear} \
{/TESTBED/U_DESIGN/clk} \
{/TESTBED/U_DESIGN/in_a[15:0]} \
{/TESTBED/U_DESIGN/in_b[15:0]} \
{/TESTBED/U_DESIGN/in_mode} \
{/TESTBED/U_DESIGN/in_valid} \
{/TESTBED/U_DESIGN/mode} \
{/TESTBED/U_DESIGN/mode_chk} \
{/TESTBED/U_DESIGN/out[35:0]} \
{/TESTBED/U_DESIGN/out_img[18:0]} \
{/TESTBED/U_DESIGN/out_real[18:0]} \
{/TESTBED/U_DESIGN/out_tmp[35:0]} \
{/TESTBED/U_DESIGN/out_valid} \
{/TESTBED/U_DESIGN/rst_n} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 37 38 39 40 41 42 43 44 45 )}
wvSetPosition -win $_nWave1 {("G1" 45)}
wvSetPosition -win $_nWave1 {("G1" 45)}
wvSetPosition -win $_nWave1 {("G1" 45)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/U_DESIGN/a0_chk} \
{/TESTBED/U_DESIGN/a0_img[7:0]} \
{/TESTBED/U_DESIGN/a0_real[7:0]} \
{/TESTBED/U_DESIGN/a1_chk} \
{/TESTBED/U_DESIGN/a1_img[7:0]} \
{/TESTBED/U_DESIGN/a1_real[7:0]} \
{/TESTBED/U_DESIGN/a2_chk} \
{/TESTBED/U_DESIGN/a2_img[7:0]} \
{/TESTBED/U_DESIGN/a2_real[7:0]} \
{/TESTBED/U_DESIGN/a3_chk} \
{/TESTBED/U_DESIGN/a3_img[7:0]} \
{/TESTBED/U_DESIGN/a3_real[7:0]} \
{/TESTBED/U_DESIGN/a4_chk} \
{/TESTBED/U_DESIGN/a4_img[7:0]} \
{/TESTBED/U_DESIGN/a4_real[7:0]} \
{/TESTBED/U_DESIGN/a_chk} \
{/TESTBED/U_DESIGN/a_img[7:0]} \
{/TESTBED/U_DESIGN/a_real[7:0]} \
{/TESTBED/U_DESIGN/b0_chk} \
{/TESTBED/U_DESIGN/b0_img[7:0]} \
{/TESTBED/U_DESIGN/b0_real[7:0]} \
{/TESTBED/U_DESIGN/b1_chk} \
{/TESTBED/U_DESIGN/b1_img[7:0]} \
{/TESTBED/U_DESIGN/b1_real[7:0]} \
{/TESTBED/U_DESIGN/b2_chk} \
{/TESTBED/U_DESIGN/b2_img[7:0]} \
{/TESTBED/U_DESIGN/b2_real[7:0]} \
{/TESTBED/U_DESIGN/b_chk} \
{/TESTBED/U_DESIGN/b_img[7:0]} \
{/TESTBED/U_DESIGN/b_real[7:0]} \
{/TESTBED/U_DESIGN/cal_valid} \
{/TESTBED/U_DESIGN/clear} \
{/TESTBED/U_DESIGN/clk} \
{/TESTBED/U_DESIGN/in_a[15:0]} \
{/TESTBED/U_DESIGN/in_b[15:0]} \
{/TESTBED/U_DESIGN/in_mode} \
{/TESTBED/U_DESIGN/in_valid} \
{/TESTBED/U_DESIGN/mode} \
{/TESTBED/U_DESIGN/mode_chk} \
{/TESTBED/U_DESIGN/out[35:0]} \
{/TESTBED/U_DESIGN/out_img[18:0]} \
{/TESTBED/U_DESIGN/out_real[18:0]} \
{/TESTBED/U_DESIGN/out_tmp[35:0]} \
{/TESTBED/U_DESIGN/out_valid} \
{/TESTBED/U_DESIGN/rst_n} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 37 38 39 40 41 42 43 44 45 )}
wvSetPosition -win $_nWave1 {("G1" 45)}
wvGetSignalClose -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvUnknownSaveResult -win $_nWave1 -clear
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/U_DESIGN/a0_chk} \
{/TESTBED/U_DESIGN/a0_img[7:0]} \
{/TESTBED/U_DESIGN/a0_real[7:0]} \
{/TESTBED/U_DESIGN/a1_chk} \
{/TESTBED/U_DESIGN/a1_img[7:0]} \
{/TESTBED/U_DESIGN/a1_real[7:0]} \
{/TESTBED/U_DESIGN/a2_chk} \
{/TESTBED/U_DESIGN/a2_img[7:0]} \
{/TESTBED/U_DESIGN/a2_real[7:0]} \
{/TESTBED/U_DESIGN/a3_chk} \
{/TESTBED/U_DESIGN/a3_img[7:0]} \
{/TESTBED/U_DESIGN/a3_real[7:0]} \
{/TESTBED/U_DESIGN/a4_chk} \
{/TESTBED/U_DESIGN/a4_img[7:0]} \
{/TESTBED/U_DESIGN/a4_real[7:0]} \
{/TESTBED/U_DESIGN/a_chk} \
{/TESTBED/U_DESIGN/a_img[7:0]} \
{/TESTBED/U_DESIGN/a_real[7:0]} \
{/TESTBED/U_DESIGN/b0_chk} \
{/TESTBED/U_DESIGN/b0_img[7:0]} \
{/TESTBED/U_DESIGN/b0_real[7:0]} \
{/TESTBED/U_DESIGN/b1_chk} \
{/TESTBED/U_DESIGN/b1_img[7:0]} \
{/TESTBED/U_DESIGN/b1_real[7:0]} \
{/TESTBED/U_DESIGN/b2_chk} \
{/TESTBED/U_DESIGN/b2_img[7:0]} \
{/TESTBED/U_DESIGN/b2_real[7:0]} \
{/TESTBED/U_DESIGN/b_chk} \
{/TESTBED/U_DESIGN/b_img[7:0]} \
{/TESTBED/U_DESIGN/b_real[7:0]} \
{/TESTBED/U_DESIGN/cal_valid} \
{/TESTBED/U_DESIGN/clear} \
{/TESTBED/U_DESIGN/clk} \
{/TESTBED/U_DESIGN/in_a[15:0]} \
{/TESTBED/U_DESIGN/in_b[15:0]} \
{/TESTBED/U_DESIGN/in_mode} \
{/TESTBED/U_DESIGN/in_valid} \
{/TESTBED/U_DESIGN/mode} \
{/TESTBED/U_DESIGN/mode_chk} \
{/TESTBED/U_DESIGN/out[35:0]} \
{/TESTBED/U_DESIGN/out_tmp[35:0]} \
{/TESTBED/U_DESIGN/out_valid} \
{/TESTBED/U_DESIGN/rst_n} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/TESTBED/U_DESIGN/out_img[17:0]} \
{/TESTBED/U_DESIGN/out_real[17:0]} \
{/TESTBED/U_DESIGN/out_tmp[35:0]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 2 3 )}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/U_DESIGN/a0_chk} \
{/TESTBED/U_DESIGN/a0_img[7:0]} \
{/TESTBED/U_DESIGN/a0_real[7:0]} \
{/TESTBED/U_DESIGN/a1_chk} \
{/TESTBED/U_DESIGN/a1_img[7:0]} \
{/TESTBED/U_DESIGN/a1_real[7:0]} \
{/TESTBED/U_DESIGN/a2_chk} \
{/TESTBED/U_DESIGN/a2_img[7:0]} \
{/TESTBED/U_DESIGN/a2_real[7:0]} \
{/TESTBED/U_DESIGN/a3_chk} \
{/TESTBED/U_DESIGN/a3_img[7:0]} \
{/TESTBED/U_DESIGN/a3_real[7:0]} \
{/TESTBED/U_DESIGN/a4_chk} \
{/TESTBED/U_DESIGN/a4_img[7:0]} \
{/TESTBED/U_DESIGN/a4_real[7:0]} \
{/TESTBED/U_DESIGN/a_chk} \
{/TESTBED/U_DESIGN/a_img[7:0]} \
{/TESTBED/U_DESIGN/a_real[7:0]} \
{/TESTBED/U_DESIGN/b0_chk} \
{/TESTBED/U_DESIGN/b0_img[7:0]} \
{/TESTBED/U_DESIGN/b0_real[7:0]} \
{/TESTBED/U_DESIGN/b1_chk} \
{/TESTBED/U_DESIGN/b1_img[7:0]} \
{/TESTBED/U_DESIGN/b1_real[7:0]} \
{/TESTBED/U_DESIGN/b2_chk} \
{/TESTBED/U_DESIGN/b2_img[7:0]} \
{/TESTBED/U_DESIGN/b2_real[7:0]} \
{/TESTBED/U_DESIGN/b_chk} \
{/TESTBED/U_DESIGN/b_img[7:0]} \
{/TESTBED/U_DESIGN/b_real[7:0]} \
{/TESTBED/U_DESIGN/cal_valid} \
{/TESTBED/U_DESIGN/clear} \
{/TESTBED/U_DESIGN/clk} \
{/TESTBED/U_DESIGN/in_a[15:0]} \
{/TESTBED/U_DESIGN/in_b[15:0]} \
{/TESTBED/U_DESIGN/in_mode} \
{/TESTBED/U_DESIGN/in_valid} \
{/TESTBED/U_DESIGN/mode} \
{/TESTBED/U_DESIGN/mode_chk} \
{/TESTBED/U_DESIGN/out[35:0]} \
{/TESTBED/U_DESIGN/out_tmp[35:0]} \
{/TESTBED/U_DESIGN/out_valid} \
{/TESTBED/U_DESIGN/rst_n} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/TESTBED/U_DESIGN/out_img[17:0]} \
{/TESTBED/U_DESIGN/out_real[17:0]} \
{/TESTBED/U_DESIGN/out_tmp[35:0]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 2 3 )}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 8804.646251 -snap {("G1" 43)}
wvSetCursor -win $_nWave1 8688.489968 -snap {("G2" 1)}
wvSetCursor -win $_nWave1 1000676.874340 -snap {("G2" 2)}
wvSetCursor -win $_nWave1 999492.080253 -snap {("G1" 40)}
wvSetCursor -win $_nWave1 1000607.180570 -snap {("G2" 1)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvExit
