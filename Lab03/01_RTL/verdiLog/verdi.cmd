wvResizeWindow -win $_nWave1 54 297 960 332
wvOpenFile -win $_nWave1 {/users/dlab2016/2016dlab69/Lab03/01_RTL/IMPOR.fsdb}
wvSetPosition -win $_nWave1 {("G1" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/TESTBED"
wvGetSignalSetScope -win $_nWave1 "/TESTBED/I_IMPOR"
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/I_IMPOR/b1[2:0]} \
{/TESTBED/I_IMPOR/b2[2:0]} \
{/TESTBED/I_IMPOR/b3[2:0]} \
{/TESTBED/I_IMPOR/b4[2:0]} \
{/TESTBED/I_IMPOR/b5[2:0]} \
{/TESTBED/I_IMPOR/b6[2:0]} \
{/TESTBED/I_IMPOR/b7[2:0]} \
{/TESTBED/I_IMPOR/b8[2:0]} \
{/TESTBED/I_IMPOR/b9[2:0]} \
{/TESTBED/I_IMPOR/clk} \
{/TESTBED/I_IMPOR/count[3:0]} \
{/TESTBED/I_IMPOR/in[2:0]} \
{/TESTBED/I_IMPOR/in_valid} \
{/TESTBED/I_IMPOR/mode[2:0]} \
{/TESTBED/I_IMPOR/out[2:0]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 )}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/I_IMPOR/b1[2:0]} \
{/TESTBED/I_IMPOR/b2[2:0]} \
{/TESTBED/I_IMPOR/b3[2:0]} \
{/TESTBED/I_IMPOR/b4[2:0]} \
{/TESTBED/I_IMPOR/b5[2:0]} \
{/TESTBED/I_IMPOR/b6[2:0]} \
{/TESTBED/I_IMPOR/b7[2:0]} \
{/TESTBED/I_IMPOR/b8[2:0]} \
{/TESTBED/I_IMPOR/b9[2:0]} \
{/TESTBED/I_IMPOR/clk} \
{/TESTBED/I_IMPOR/count[3:0]} \
{/TESTBED/I_IMPOR/in[2:0]} \
{/TESTBED/I_IMPOR/in_valid} \
{/TESTBED/I_IMPOR/mode[2:0]} \
{/TESTBED/I_IMPOR/out[2:0]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 )}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/I_IMPOR/b1[2:0]} \
{/TESTBED/I_IMPOR/b2[2:0]} \
{/TESTBED/I_IMPOR/b3[2:0]} \
{/TESTBED/I_IMPOR/b4[2:0]} \
{/TESTBED/I_IMPOR/b5[2:0]} \
{/TESTBED/I_IMPOR/b6[2:0]} \
{/TESTBED/I_IMPOR/b7[2:0]} \
{/TESTBED/I_IMPOR/b8[2:0]} \
{/TESTBED/I_IMPOR/b9[2:0]} \
{/TESTBED/I_IMPOR/clk} \
{/TESTBED/I_IMPOR/count[3:0]} \
{/TESTBED/I_IMPOR/in[2:0]} \
{/TESTBED/I_IMPOR/in_valid} \
{/TESTBED/I_IMPOR/mode[2:0]} \
{/TESTBED/I_IMPOR/out[2:0]} \
{/TESTBED/I_IMPOR/out_valid} \
{/TESTBED/I_IMPOR/ready} \
{/TESTBED/I_IMPOR/rst_n} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 16 17 18 )}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/I_IMPOR/b1[2:0]} \
{/TESTBED/I_IMPOR/b2[2:0]} \
{/TESTBED/I_IMPOR/b3[2:0]} \
{/TESTBED/I_IMPOR/b4[2:0]} \
{/TESTBED/I_IMPOR/b5[2:0]} \
{/TESTBED/I_IMPOR/b6[2:0]} \
{/TESTBED/I_IMPOR/b7[2:0]} \
{/TESTBED/I_IMPOR/b8[2:0]} \
{/TESTBED/I_IMPOR/b9[2:0]} \
{/TESTBED/I_IMPOR/clk} \
{/TESTBED/I_IMPOR/count[3:0]} \
{/TESTBED/I_IMPOR/in[2:0]} \
{/TESTBED/I_IMPOR/in_valid} \
{/TESTBED/I_IMPOR/mode[2:0]} \
{/TESTBED/I_IMPOR/out[2:0]} \
{/TESTBED/I_IMPOR/out_valid} \
{/TESTBED/I_IMPOR/ready} \
{/TESTBED/I_IMPOR/rst_n} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 16 17 18 )}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvGetSignalClose -win $_nWave1
wvResizeWindow -win $_nWave1 122 121 960 333
wvResizeWindow -win $_nWave1 122 121 960 336
wvResizeWindow -win $_nWave1 122 121 960 346
wvResizeWindow -win $_nWave1 122 121 960 351
wvResizeWindow -win $_nWave1 122 121 960 359
wvResizeWindow -win $_nWave1 122 121 960 366
wvResizeWindow -win $_nWave1 122 121 960 374
wvResizeWindow -win $_nWave1 122 121 960 382
wvResizeWindow -win $_nWave1 122 121 960 389
wvResizeWindow -win $_nWave1 122 121 960 397
wvResizeWindow -win $_nWave1 122 121 960 403
wvResizeWindow -win $_nWave1 122 121 960 409
wvResizeWindow -win $_nWave1 122 121 960 412
wvResizeWindow -win $_nWave1 122 121 960 414
wvResizeWindow -win $_nWave1 122 121 960 416
wvResizeWindow -win $_nWave1 122 121 960 419
wvResizeWindow -win $_nWave1 122 121 960 422
wvResizeWindow -win $_nWave1 122 121 960 425
wvResizeWindow -win $_nWave1 122 121 960 428
wvResizeWindow -win $_nWave1 122 121 960 432
wvResizeWindow -win $_nWave1 122 121 960 436
wvResizeWindow -win $_nWave1 122 121 960 440
wvResizeWindow -win $_nWave1 122 121 960 444
wvResizeWindow -win $_nWave1 122 121 960 449
wvResizeWindow -win $_nWave1 122 121 960 454
wvResizeWindow -win $_nWave1 122 121 960 458
wvResizeWindow -win $_nWave1 122 121 960 462
wvResizeWindow -win $_nWave1 122 121 960 466
wvResizeWindow -win $_nWave1 122 121 960 472
wvResizeWindow -win $_nWave1 122 121 960 479
wvResizeWindow -win $_nWave1 122 121 960 485
wvResizeWindow -win $_nWave1 122 121 960 491
wvResizeWindow -win $_nWave1 122 121 960 496
wvResizeWindow -win $_nWave1 122 121 960 502
wvResizeWindow -win $_nWave1 122 121 960 508
wvResizeWindow -win $_nWave1 122 121 960 513
wvResizeWindow -win $_nWave1 122 121 960 519
wvResizeWindow -win $_nWave1 122 121 960 524
wvResizeWindow -win $_nWave1 122 121 960 527
wvResizeWindow -win $_nWave1 122 121 960 531
wvResizeWindow -win $_nWave1 122 121 960 534
wvResizeWindow -win $_nWave1 122 121 960 537
wvResizeWindow -win $_nWave1 122 121 960 539
wvResizeWindow -win $_nWave1 122 121 960 541
wvResizeWindow -win $_nWave1 122 121 960 543
wvResizeWindow -win $_nWave1 122 121 960 544
wvResizeWindow -win $_nWave1 122 121 960 547
wvResizeWindow -win $_nWave1 122 121 960 548
wvResizeWindow -win $_nWave1 122 121 960 549
wvResizeWindow -win $_nWave1 122 121 960 551
wvResizeWindow -win $_nWave1 122 121 960 552
wvResizeWindow -win $_nWave1 122 121 960 553
wvResizeWindow -win $_nWave1 122 121 960 555
wvResizeWindow -win $_nWave1 122 121 960 556
wvResizeWindow -win $_nWave1 122 121 960 557
wvResizeWindow -win $_nWave1 122 121 960 558
wvResizeWindow -win $_nWave1 122 121 960 560
wvResizeWindow -win $_nWave1 122 121 960 562
wvResizeWindow -win $_nWave1 122 121 960 564
wvResizeWindow -win $_nWave1 122 121 960 566
wvResizeWindow -win $_nWave1 122 121 960 568
wvResizeWindow -win $_nWave1 122 121 960 571
wvResizeWindow -win $_nWave1 122 121 960 572
wvResizeWindow -win $_nWave1 122 121 960 573
wvResizeWindow -win $_nWave1 122 121 960 574
wvResizeWindow -win $_nWave1 122 121 960 575
wvResizeWindow -win $_nWave1 122 121 960 574
wvResizeWindow -win $_nWave1 122 121 960 572
wvResizeWindow -win $_nWave1 122 121 960 571
wvResizeWindow -win $_nWave1 122 121 960 569
wvResizeWindow -win $_nWave1 122 121 960 567
wvResizeWindow -win $_nWave1 122 121 960 564
wvResizeWindow -win $_nWave1 122 121 960 562
wvResizeWindow -win $_nWave1 122 121 960 561
wvResizeWindow -win $_nWave1 122 121 960 558
wvResizeWindow -win $_nWave1 122 121 960 556
wvResizeWindow -win $_nWave1 122 121 960 553
wvResizeWindow -win $_nWave1 122 121 960 552
wvResizeWindow -win $_nWave1 122 121 960 551
wvResizeWindow -win $_nWave1 122 121 960 550
wvResizeWindow -win $_nWave1 122 121 960 549
wvResizeWindow -win $_nWave1 122 121 960 548
wvResizeWindow -win $_nWave1 122 121 960 544
wvResizeWindow -win $_nWave1 122 121 960 542
wvResizeWindow -win $_nWave1 122 121 960 540
wvResizeWindow -win $_nWave1 122 121 960 538
wvResizeWindow -win $_nWave1 122 121 960 536
wvResizeWindow -win $_nWave1 122 121 960 534
wvResizeWindow -win $_nWave1 122 121 960 532
wvResizeWindow -win $_nWave1 122 121 960 530
wvResizeWindow -win $_nWave1 122 121 960 528
wvResizeWindow -win $_nWave1 122 121 960 526
wvResizeWindow -win $_nWave1 122 121 960 525
wvResizeWindow -win $_nWave1 122 121 960 524
wvResizeWindow -win $_nWave1 122 121 960 523
wvResizeWindow -win $_nWave1 122 121 960 521
wvResizeWindow -win $_nWave1 122 121 960 519
wvResizeWindow -win $_nWave1 122 121 960 516
wvResizeWindow -win $_nWave1 122 121 960 514
wvResizeWindow -win $_nWave1 122 121 960 513
wvResizeWindow -win $_nWave1 122 121 960 512
wvResizeWindow -win $_nWave1 122 121 962 514
wvResizeWindow -win $_nWave1 122 121 964 517
wvResizeWindow -win $_nWave1 122 121 968 521
wvResizeWindow -win $_nWave1 122 121 972 525
wvResizeWindow -win $_nWave1 122 121 976 529
wvResizeWindow -win $_nWave1 122 121 980 533
wvResizeWindow -win $_nWave1 122 121 984 537
wvResizeWindow -win $_nWave1 122 121 988 541
wvResizeWindow -win $_nWave1 122 121 992 545
wvResizeWindow -win $_nWave1 122 121 996 549
wvResizeWindow -win $_nWave1 122 121 1000 553
wvResizeWindow -win $_nWave1 122 121 1002 555
wvResizeWindow -win $_nWave1 122 121 1004 557
wvResizeWindow -win $_nWave1 122 121 1006 559
wvResizeWindow -win $_nWave1 122 121 1007 562
wvResizeWindow -win $_nWave1 122 121 1009 564
wvResizeWindow -win $_nWave1 122 121 1010 566
wvResizeWindow -win $_nWave1 122 121 1012 568
wvResizeWindow -win $_nWave1 122 121 1013 570
wvResizeWindow -win $_nWave1 122 121 1015 572
wvResizeWindow -win $_nWave1 122 121 1016 574
wvResizeWindow -win $_nWave1 122 121 1017 575
wvResizeWindow -win $_nWave1 122 121 1018 576
wvResizeWindow -win $_nWave1 122 121 1019 577
wvResizeWindow -win $_nWave1 122 121 1020 578
wvResizeWindow -win $_nWave1 122 121 1022 579
wvResizeWindow -win $_nWave1 122 121 1024 580
wvResizeWindow -win $_nWave1 122 121 1026 582
wvResizeWindow -win $_nWave1 122 121 1028 584
wvResizeWindow -win $_nWave1 122 121 1030 585
wvResizeWindow -win $_nWave1 122 121 1033 588
wvResizeWindow -win $_nWave1 122 121 1035 589
wvResizeWindow -win $_nWave1 122 121 1036 590
wvResizeWindow -win $_nWave1 122 121 1037 591
wvResizeWindow -win $_nWave1 122 121 1038 592
wvResizeWindow -win $_nWave1 122 121 1040 592
wvResizeWindow -win $_nWave1 122 121 1043 593
wvResizeWindow -win $_nWave1 122 121 1046 594
wvResizeWindow -win $_nWave1 122 121 1049 595
wvResizeWindow -win $_nWave1 122 121 1051 596
wvResizeWindow -win $_nWave1 122 121 1053 597
wvResizeWindow -win $_nWave1 122 121 1056 598
wvResizeWindow -win $_nWave1 122 121 1059 599
wvResizeWindow -win $_nWave1 122 121 1062 600
wvResizeWindow -win $_nWave1 122 121 1064 601
wvResizeWindow -win $_nWave1 122 121 1066 601
wvResizeWindow -win $_nWave1 122 121 1068 601
wvResizeWindow -win $_nWave1 122 121 1071 602
wvResizeWindow -win $_nWave1 122 121 1073 602
wvResizeWindow -win $_nWave1 122 121 1076 602
wvResizeWindow -win $_nWave1 122 121 1078 601
wvResizeWindow -win $_nWave1 122 121 1080 600
wvResizeWindow -win $_nWave1 122 121 1082 600
wvResizeWindow -win $_nWave1 122 121 1083 599
wvResizeWindow -win $_nWave1 122 121 1084 598
wvResizeWindow -win $_nWave1 122 121 1087 597
wvResizeWindow -win $_nWave1 122 121 1089 596
wvResizeWindow -win $_nWave1 122 121 1091 595
wvResizeWindow -win $_nWave1 122 121 1090 595
wvResizeWindow -win $_nWave1 122 121 1089 595
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 4367.013397 -snap {("G2" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 17006.763617 -snap {("G1" 13)}
wvSetCursor -win $_nWave1 16965.073752 -snap {("G1" 13)}
wvSetCursor -win $_nWave1 17090.143348 -snap {("G1" 13)}
wvSetCursor -win $_nWave1 17017.186083 -snap {("G1" 13)}
wvSetCursor -win $_nWave1 16975.496218 -snap {("G1" 13)}
wvSetCursor -win $_nWave1 16965.073752 -snap {("G1" 12)}
wvSetCursor -win $_nWave1 16923.383886 -snap {("G1" 13)}
wvSetCursor -win $_nWave1 17444.507203 -snap {("G1" 16)}
wvSetCursor -win $_nWave1 17402.817338 -snap {("G1" 16)}
wvSetCursor -win $_nWave1 17277.747742 -snap {("G1" 17)}
wvSetCursor -win $_nWave1 17006.763617 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 16996.341151 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 16944.228819 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 15714.377791 -snap {("G1" 16)}
wvSetCursor -win $_nWave1 13629.884523 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 13411.012730 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 12785.664749 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 12222.851567 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 12389.611028 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 13223.408336 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 17486.197069 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 17225.635410 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 21276.649608 -snap {("G1" 16)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 10480.718277 -snap {("G2" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 9040.850472 -snap {("G1" 14)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 11769.243502 -snap {("G1" 1)}
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 20)}
wvSetPosition -win $_nWave1 {("G1" 20)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/I_IMPOR/b1[2:0]} \
{/TESTBED/I_IMPOR/b2[2:0]} \
{/TESTBED/I_IMPOR/b3[2:0]} \
{/TESTBED/I_IMPOR/b4[2:0]} \
{/TESTBED/I_IMPOR/b5[2:0]} \
{/TESTBED/I_IMPOR/b6[2:0]} \
{/TESTBED/I_IMPOR/b7[2:0]} \
{/TESTBED/I_IMPOR/b8[2:0]} \
{/TESTBED/I_IMPOR/b9[2:0]} \
{/TESTBED/I_IMPOR/clk} \
{/TESTBED/I_IMPOR/count[3:0]} \
{/TESTBED/I_IMPOR/in[2:0]} \
{/TESTBED/I_IMPOR/in_valid} \
{/TESTBED/I_IMPOR/mode[2:0]} \
{/TESTBED/I_IMPOR/out[2:0]} \
{/TESTBED/I_IMPOR/out_valid} \
{/TESTBED/I_IMPOR/ready} \
{/TESTBED/I_IMPOR/rst_n} \
{/TESTBED/I_IMPOR/current_state[1:0]} \
{/TESTBED/I_IMPOR/next_state[1:0]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 19 20 )}
wvSetPosition -win $_nWave1 {("G1" 20)}
wvSetPosition -win $_nWave1 {("G1" 20)}
wvSetPosition -win $_nWave1 {("G1" 20)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/I_IMPOR/b1[2:0]} \
{/TESTBED/I_IMPOR/b2[2:0]} \
{/TESTBED/I_IMPOR/b3[2:0]} \
{/TESTBED/I_IMPOR/b4[2:0]} \
{/TESTBED/I_IMPOR/b5[2:0]} \
{/TESTBED/I_IMPOR/b6[2:0]} \
{/TESTBED/I_IMPOR/b7[2:0]} \
{/TESTBED/I_IMPOR/b8[2:0]} \
{/TESTBED/I_IMPOR/b9[2:0]} \
{/TESTBED/I_IMPOR/clk} \
{/TESTBED/I_IMPOR/count[3:0]} \
{/TESTBED/I_IMPOR/in[2:0]} \
{/TESTBED/I_IMPOR/in_valid} \
{/TESTBED/I_IMPOR/mode[2:0]} \
{/TESTBED/I_IMPOR/out[2:0]} \
{/TESTBED/I_IMPOR/out_valid} \
{/TESTBED/I_IMPOR/ready} \
{/TESTBED/I_IMPOR/rst_n} \
{/TESTBED/I_IMPOR/current_state[1:0]} \
{/TESTBED/I_IMPOR/next_state[1:0]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 19 20 )}
wvSetPosition -win $_nWave1 {("G1" 20)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 10043.082487 -snap {("G1" 19)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 11705.312811 -snap {("G1" 16)}
wvSetCursor -win $_nWave1 18181.096844 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 18943.940715 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 19773.533424 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 20679.410520 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 21041.761358 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 21413.647745 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 23864.283679 -snap {("G1" 10)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 24608.056452 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 23854.748130 -snap {("G1" 12)}
wvSetCursor -win $_nWave1 23845.212582 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 23034.690970 -snap {("G1" 12)}
wvSetCursor -win $_nWave1 23025.155421 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 22205.098261 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 22967.942131 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 8624.796374 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 2202.711676 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 2994.162191 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 3861.897094 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 3032.304385 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 2641.346901 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 3041.839933 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 2155.033934 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 2956.019998 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 3814.219352 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 4605.669868 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 2250.389418 -snap {("G1" 10)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 9388.088117 -snap {("G1" 19)}
wvSetCursor -win $_nWave1 24655.734194 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 23826.141485 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 22967.942131 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 23807.070389 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 22252.776003 -snap {("G1" 11)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 23025.155421 -snap {("G1" 18)}
wvSetCursor -win $_nWave1 23053.762066 -snap {("G1" 19)}
wvSetCursor -win $_nWave1 23816.605937 -snap {("G1" 15)}
wvSetCursor -win $_nWave1 8544.645418 -snap {("G1" 19)}
wvSetCursor -win $_nWave1 2202.711676 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 2202.711676 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 2202.711676 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 3051.375482 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 2174.105031 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 3022.768837 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 2240.853869 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 1859.431934 -snap {("G1" 13)}
wvSetCursor -win $_nWave1 2221.782773 -snap {("G1" 19)}
wvSetCursor -win $_nWave1 3032.304385 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 2612.740256 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 3060.911030 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 1973.858515 -snap {("G1" 12)}
wvSetCursor -win $_nWave1 1392.190064 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 1411.261160 -snap {("G1" 17)}
wvSetCursor -win $_nWave1 12484.762167 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 12932.932941 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 16303.379427 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 15864.744202 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 15740.782073 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 15778.924266 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 15826.602008 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 1830.825289 -snap {("G1" 12)}
wvSetCursor -win $_nWave1 2269.460515 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 1411.261160 -snap {("G1" 17)}
wvSetCursor -win $_nWave1 1830.825289 -snap {("G1" 13)}
wvSetCursor -win $_nWave1 2240.853869 -snap {("G1" 19)}
wvSetCursor -win $_nWave1 1811.754192 -snap {("G1" 20)}
wvSetCursor -win $_nWave1 2221.782773 -snap {("G1" 19)}
wvSetCursor -win $_nWave1 1802.218644 -snap {("G1" 14)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 1811.754192 -snap {("G1" 12)}
wvSetCursor -win $_nWave1 2269.460515 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 1420.796709 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 1802.218644 -snap {("G1" 13)}
wvSetCursor -win $_nWave1 2183.640579 -snap {("G1" 19)}
wvSetCursor -win $_nWave1 1830.825289 -snap {("G1" 20)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 2317.138256 -snap {("G1" 18)}
wvSetCursor -win $_nWave1 2202.711676 -snap {("G1" 19)}
wvSetCursor -win $_nWave1 2574.598063 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 2240.853869 -snap {("G1" 19)}
wvSetCursor -win $_nWave1 7809.614123 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 8438.960317 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 10165.660493 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 2612.740256 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 2994.162191 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 2612.740256 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 2212.247224 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 1725.934257 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 2240.853869 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 3079.982127 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 12839.773187 -snap {("G1" 19)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 2641.346901 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 2984.626643 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 3785.612707 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 3852.361546 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 4586.598771 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 5406.655932 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 4987.091803 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 2555.526966 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 3013.233288 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 3432.797417 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 3823.754900 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 4195.641287 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 2298.067160 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 11893.653063 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 15694.090395 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 15856.194717 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 16620.007790 -snap {("G1" 19)}
wvSetCursor -win $_nWave1 17039.571919 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 17401.922757 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 16991.586227 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 17401.614808 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 17439.757001 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 17344.401517 -snap {("G1" 16)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 2193.176127 -snap {("G1" 18)}
wvSetCursor -win $_nWave1 2221.782773 -snap {("G1" 19)}
wvSetCursor -win $_nWave1 2221.782773 -snap {("G1" 20)}
wvSetCursor -win $_nWave1 2231.318321 -snap {("G1" 19)}
wvSetCursor -win $_nWave1 1830.825289 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 2202.711676 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 8203.552617 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 7390.433530 -snap {("G1" 20)}
wvSetCursor -win $_nWave1 21471.847099 -snap {("G1" 17)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 2212.247224 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 2984.626643 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 2240.853869 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 2603.204708 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 3432.797417 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 2250.389418 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 2584.133611 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 3385.119675 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 4214.712384 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 4996.627351 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 5788.077867 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 6598.599479 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 7409.121091 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 8181.500510 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 2631.811353 -snap {("G1" 10)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 8618.688869 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 9114.537385 -snap {("G1" 14)}
wvSetCursor -win $_nWave1 1840.360837 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 1411.261160 -snap {("G1" 17)}
wvSetCursor -win $_nWave1 1811.754192 -snap {("G1" 13)}
wvSetCursor -win $_nWave1 1420.796709 -snap {("G1" 17)}
wvSetCursor -win $_nWave1 1792.683095 -snap {("G1" 13)}
wvSetCursor -win $_nWave1 2183.640579 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 2612.740256 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 2250.389418 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 2612.740256 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 3413.726320 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 23903.411936 -snap {("G1" 12)}
wvSetCursor -win $_nWave1 23798.520904 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 23026.141485 -snap {("G1" 20)}
wvSetCursor -win $_nWave1 23808.056452 -snap {("G1" 12)}
wvSetCursor -win $_nWave1 23798.520904 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 19202.386585 -snap {("G2" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 9005.915387 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 8605.422355 -snap {("G1" 19)}
wvSetCursor -win $_nWave1 24579.449807 -snap {("G1" 12)}
wvSetCursor -win $_nWave1 24588.985356 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 23854.748130 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 24579.449807 -snap {("G1" 11)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 8996.310694 -snap {("G1" 12)}
wvSetCursor -win $_nWave1 9444.481468 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 9814.888182 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 10654.016440 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 11397.789213 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 12160.633084 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 12942.548051 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 13781.676308 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 14592.197921 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 15421.790630 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 16136.956758 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 17042.833854 -snap {("G1" 10)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 22214.633809 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 22653.269035 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 22643.733486 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 22309.989293 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 22996.548776 -snap {("G1" 10)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 18953.476263 -snap {("G1" 15)}
wvSetCursor -win $_nWave1 17066.058177 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 16799.062822 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 16160.181081 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 9001.084413 -snap {("G1" 13)}
wvSetCursor -win $_nWave1 9034.710256 -snap {("G1" 14)}
wvSetCursor -win $_nWave1 9797.554127 -snap {("G1" 14)}
wvSetCursor -win $_nWave1 10617.611287 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 10589.004642 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 9597.307611 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 9807.089675 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 9778.483030 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 9778.483030 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 9788.018578 -snap {("G1" 8)}
wvSetCursor -win $_nWave1 9826.160772 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 10608.075739 -snap {("G1" 2)}
wvSearchNext -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSetCursor -win $_nWave1 17468.363366 -snap {("G1" 15)}
wvSetCursor -win $_nWave1 16695.983948 -snap {("G1" 19)}
wvSetCursor -win $_nWave1 17487.434463 -snap {("G1" 15)}
wvSetCursor -win $_nWave1 16734.126141 -snap {("G1" 19)}
wvSetCursor -win $_nWave1 17792.572011 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 17049.362050 -snap {("G1" 13)}
wvSetCursor -win $_nWave1 16410.480309 -snap {("G1" 17)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 17001.684308 -snap {("G1" 13)}
wvSetCursor -win $_nWave1 17430.783986 -snap {("G1" 19)}
wvSetCursor -win $_nWave1 18212.698953 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 19042.291662 -snap {("G1" 14)}
wvSetCursor -win $_nWave1 17840.812566 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 17487.997276 -snap {("G1" 19)}
wvSetCursor -win $_nWave1 17802.670372 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 17402.177340 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 2231.318321 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 2555.526966 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 3013.233288 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 2221.782773 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 600.739548 -snap {("G1" 18)}
wvSetCursor -win $_nWave1 1382.654515 -snap {("G1" 17)}
wvSetCursor -win $_nWave1 17847.228025 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 18591.000799 -snap {("G1" 8)}
wvSetCursor -win $_nWave1 23815.619873 -snap {("G1" 19)}
wvSetCursor -win $_nWave1 24559.392647 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 23109.989293 -snap {("G1" 20)}
wvSetCursor -win $_nWave1 23787.013228 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 23014.633809 -snap {("G1" 20)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGoToTime -win $_nWave1 110600
wvSetCursor -win $_nWave1 108587.999292 -snap {("G1" 15)}
wvSetCursor -win $_nWave1 107882.368712 -snap {("G1" 15)}
wvSetCursor -win $_nWave1 103135.466330 -snap {("G1" 15)}
wvSetCursor -win $_nWave1 97087.684620 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 97135.362362 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 95449.459676 -snap {("G1" 12)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 94114.482903 -snap {("G2" 0)}
wvZoomOut -win $_nWave1
