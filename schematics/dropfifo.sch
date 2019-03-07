VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "virtex2p"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL cpu_sel
        SIGNAL XLXN_45
        SIGNAL lastword
        SIGNAL firstword
        SIGNAL XLXN_21
        SIGNAL XLXN_46
        SIGNAL XLXN_5
        SIGNAL fifowrite
        SIGNAL valid_data
        SIGNAL fiforead
        SIGNAL XLXN_12(7:0)
        SIGNAL clk
        SIGNAL rst
        SIGNAL XLXN_17
        SIGNAL in_fifo(71:0)
        SIGNAL out_sram(71:0)
        SIGNAL out_fifo(71:0)
        SIGNAL XLXN_7
        SIGNAL XLXN_134
        SIGNAL XLXN_19
        SIGNAL XLXN_159(71:0)
        SIGNAL XLXN_160
        SIGNAL raddr(7:0)
        SIGNAL waddr(7:0)
        SIGNAL in_sram(71:0)
        SIGNAL XLXN_204(7:0)
        SIGNAL XLXN_205(71:0)
        SIGNAL sramwrite
        SIGNAL sramaddr(7:0)
        PORT Input cpu_sel
        PORT Input lastword
        PORT Input firstword
        PORT Input fifowrite
        PORT Output valid_data
        PORT Input fiforead
        PORT Input clk
        PORT Input rst
        PORT Input in_fifo(71:0)
        PORT Output out_sram(71:0)
        PORT Output out_fifo(71:0)
        PORT Output raddr(7:0)
        PORT Output waddr(7:0)
        PORT Input in_sram(71:0)
        PORT Input sramwrite
        PORT Input sramaddr(7:0)
        BEGIN BLOCKDEF cb8ce
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 384 -128 320 -128 
            RECTANGLE N 320 -268 384 -244 
            LINE N 384 -256 320 -256 
            LINE N 0 -192 64 -192 
            LINE N 192 -32 64 -32 
            LINE N 192 -64 192 -32 
            LINE N 80 -128 64 -144 
            LINE N 64 -112 80 -128 
            LINE N 0 -128 64 -128 
            LINE N 0 -32 64 -32 
            LINE N 384 -192 320 -192 
            RECTANGLE N 64 -320 320 -64 
        END BLOCKDEF
        BEGIN BLOCKDEF dualportmem9B
            TIMESTAMP 2019 3 7 2 14 6
            RECTANGLE N 32 0 256 496 
            BEGIN LINE W 0 48 32 48 
            END LINE
            BEGIN LINE W 0 80 32 80 
            END LINE
            LINE N 0 112 32 112 
            LINE N 0 240 32 240 
            BEGIN LINE W 0 272 32 272 
            END LINE
            LINE N 0 464 32 464 
            BEGIN LINE W 256 48 288 48 
            END LINE
            BEGIN LINE W 256 272 288 272 
            END LINE
        END BLOCKDEF
        BEGIN BLOCKDEF reg9B
            TIMESTAMP 2019 3 4 9 25 41
            RECTANGLE N 64 -256 320 0 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            LINE N 64 -224 0 -224 
            RECTANGLE N 0 -236 64 -212 
            LINE N 320 -224 384 -224 
            RECTANGLE N 320 -236 384 -212 
        END BLOCKDEF
        BEGIN BLOCKDEF comp8
            TIMESTAMP 2000 1 1 10 10 10
            RECTANGLE N 64 -384 320 -64 
            LINE N 384 -224 320 -224 
            RECTANGLE N 0 -332 64 -308 
            LINE N 0 -320 64 -320 
            RECTANGLE N 0 -140 64 -116 
            LINE N 0 -128 64 -128 
        END BLOCKDEF
        BEGIN BLOCKDEF and3b2
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 40 -64 
            CIRCLE N 40 -76 64 -52 
            LINE N 0 -128 40 -128 
            CIRCLE N 40 -140 64 -116 
            LINE N 0 -192 64 -192 
            LINE N 256 -128 192 -128 
            LINE N 64 -64 64 -192 
            ARC N 96 -176 192 -80 144 -80 144 -176 
            LINE N 144 -80 64 -80 
            LINE N 64 -176 144 -176 
        END BLOCKDEF
        BEGIN BLOCKDEF fd8ce
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -128 64 -128 
            LINE N 0 -192 64 -192 
            LINE N 0 -32 64 -32 
            LINE N 0 -256 64 -256 
            LINE N 384 -256 320 -256 
            LINE N 192 -32 64 -32 
            LINE N 192 -64 192 -32 
            LINE N 80 -128 64 -144 
            LINE N 64 -112 80 -128 
            RECTANGLE N 320 -268 384 -244 
            RECTANGLE N 0 -268 64 -244 
            RECTANGLE N 64 -320 320 -64 
        END BLOCKDEF
        BEGIN BLOCKDEF vcc
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 -32 64 -64 
            LINE N 64 0 64 -32 
            LINE N 96 -64 32 -64 
        END BLOCKDEF
        BEGIN BLOCKDEF fd
            TIMESTAMP 2000 1 1 10 10 10
            RECTANGLE N 64 -320 320 -64 
            LINE N 0 -128 64 -128 
            LINE N 0 -256 64 -256 
            LINE N 384 -256 320 -256 
            LINE N 80 -128 64 -144 
            LINE N 64 -112 80 -128 
        END BLOCKDEF
        BEGIN BLOCKDEF or2
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 64 -64 
            LINE N 0 -128 64 -128 
            LINE N 256 -96 192 -96 
            ARC N 28 -224 204 -48 112 -48 192 -96 
            ARC N -40 -152 72 -40 48 -48 48 -144 
            LINE N 112 -144 48 -144 
            ARC N 28 -144 204 32 192 -96 112 -144 
            LINE N 112 -48 48 -48 
        END BLOCKDEF
        BEGIN BLOCKDEF fdc
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -128 64 -128 
            LINE N 0 -32 64 -32 
            LINE N 0 -256 64 -256 
            LINE N 384 -256 320 -256 
            RECTANGLE N 64 -320 320 -64 
            LINE N 64 -112 80 -128 
            LINE N 80 -128 64 -144 
            LINE N 192 -64 192 -32 
            LINE N 192 -32 64 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF mux72
            TIMESTAMP 2019 3 7 2 10 38
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            RECTANGLE N 320 -172 384 -148 
            LINE N 320 -160 384 -160 
        END BLOCKDEF
        BEGIN BLOCKDEF mux8
            TIMESTAMP 2019 3 7 1 27 41
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            RECTANGLE N 320 -172 384 -148 
            LINE N 320 -160 384 -160 
        END BLOCKDEF
        BEGIN BLOCKDEF muxcy
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 192 0 192 -64 
            LINE N 192 -224 192 -160 
            LINE N 96 -160 32 -64 
            LINE N 224 -160 96 -160 
            LINE N 288 -64 224 -160 
            LINE N 32 -64 288 -64 
            LINE N 128 0 128 -64 
            LINE N 0 -96 56 -96 
        END BLOCKDEF
        BEGIN BLOCK XLXI_13 fd
            PIN C clk
            PIN D lastword
            PIN Q XLXN_46
        END BLOCK
        BEGIN BLOCK XLXI_12 fd
            PIN C clk
            PIN D firstword
            PIN Q XLXN_21
        END BLOCK
        BEGIN BLOCK XLXI_14 or2
            PIN I0 XLXN_46
            PIN I1 XLXN_21
            PIN O XLXN_45
        END BLOCK
        BEGIN BLOCK XLXI_6 comp8
            PIN A(7:0) raddr(7:0)
            PIN B(7:0) XLXN_12(7:0)
            PIN EQ XLXN_7
        END BLOCK
        BEGIN BLOCK XLXI_10 fd
            PIN C clk
            PIN D fifowrite
            PIN Q XLXN_19
        END BLOCK
        BEGIN BLOCK XLXI_52 cb8ce
            PIN C clk
            PIN CE XLXN_19
            PIN CLR rst
            PIN CEO
            PIN Q(7:0) waddr(7:0)
            PIN TC
        END BLOCK
        BEGIN BLOCK XLXI_8 fd8ce
            PIN C clk
            PIN CE XLXN_45
            PIN CLR rst
            PIN D(7:0) waddr(7:0)
            PIN Q(7:0) XLXN_12(7:0)
        END BLOCK
        BEGIN BLOCK XLXI_50 fdc
            PIN C clk
            PIN CLR rst
            PIN D XLXN_134
            PIN Q valid_data
        END BLOCK
        BEGIN BLOCK XLXI_9 vcc
            PIN P XLXN_17
        END BLOCK
        BEGIN BLOCK XLXI_4 reg9B
            PIN ce XLXN_17
            PIN clk clk
            PIN clr rst
            PIN d(71:0) in_fifo(71:0)
            PIN q(71:0) XLXN_159(71:0)
        END BLOCK
        BEGIN BLOCK XLXI_3 dualportmem9B
            PIN addra(7:0) XLXN_204(7:0)
            PIN dina(71:0) XLXN_205(71:0)
            PIN wea XLXN_160
            PIN clka clk
            PIN addrb(7:0) raddr(7:0)
            PIN clkb clk
            PIN douta(71:0) out_sram(71:0)
            PIN doutb(71:0) out_fifo(71:0)
        END BLOCK
        BEGIN BLOCK XLXI_5 comp8
            PIN A(7:0) waddr(7:0)
            PIN B(7:0) raddr(7:0)
            PIN EQ XLXN_5
        END BLOCK
        BEGIN BLOCK XLXI_7 and3b2
            PIN I0 XLXN_7
            PIN I1 XLXN_5
            PIN I2 fiforead
            PIN O XLXN_134
        END BLOCK
        BEGIN BLOCK XLXI_2 cb8ce
            PIN C clk
            PIN CE XLXN_134
            PIN CLR rst
            PIN CEO
            PIN Q(7:0) raddr(7:0)
            PIN TC
        END BLOCK
        BEGIN BLOCK XLXI_55 muxcy
            PIN CI sramwrite
            PIN DI XLXN_19
            PIN S cpu_sel
            PIN O XLXN_160
        END BLOCK
        BEGIN BLOCK XLXI_53 mux72
            PIN S cpu_sel
            PIN I0(71:0) XLXN_159(71:0)
            PIN I1(71:0) in_sram(71:0)
            PIN O(71:0) XLXN_205(71:0)
        END BLOCK
        BEGIN BLOCK XLXI_70 mux8
            PIN S cpu_sel
            PIN I0(7:0) waddr(7:0)
            PIN I1(7:0) sramaddr(7:0)
            PIN O(7:0) XLXN_204(7:0)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN BRANCH XLXN_45
            WIRE 928 1344 1120 1344
        END BRANCH
        BEGIN BRANCH lastword
            WIRE 144 1632 256 1632
        END BRANCH
        BEGIN BRANCH firstword
            WIRE 144 1312 256 1312
        END BRANCH
        INSTANCE XLXI_13 256 1888 R0
        INSTANCE XLXI_12 256 1568 R0
        BEGIN BRANCH XLXN_21
            WIRE 640 1312 672 1312
        END BRANCH
        INSTANCE XLXI_14 672 1440 R0
        BEGIN BRANCH XLXN_46
            WIRE 640 1632 656 1632
            WIRE 656 1376 672 1376
            WIRE 656 1376 656 1632
        END BRANCH
        INSTANCE XLXI_6 1120 2544 R0
        BEGIN BRANCH XLXN_5
            WIRE 1504 1936 1536 1936
        END BRANCH
        INSTANCE XLXI_10 1120 1184 R0
        BEGIN BRANCH fifowrite
            WIRE 880 928 1120 928
        END BRANCH
        BEGIN BRANCH valid_data
            WIRE 2336 2304 3328 2304
        END BRANCH
        BEGIN BRANCH fiforead
            WIRE 880 1664 1536 1664
            WIRE 1536 1664 1536 1872
        END BRANCH
        BEGIN BRANCH XLXN_12(7:0)
            WIRE 992 1568 1568 1568
            WIRE 992 1568 992 2416
            WIRE 992 2416 1120 2416
            WIRE 1504 1280 1568 1280
            WIRE 1568 1280 1568 1568
        END BRANCH
        INSTANCE XLXI_52 1952 1664 R0
        INSTANCE XLXI_8 1120 1536 R0
        INSTANCE XLXI_50 1952 2560 R0
        BEGIN INSTANCE XLXI_4 1952 1120 R0
        END INSTANCE
        BEGIN BRANCH in_fifo(71:0)
            WIRE 1744 896 1952 896
        END BRANCH
        BEGIN BRANCH out_sram(71:0)
            WIRE 3296 1744 3312 1744
        END BRANCH
        BEGIN BRANCH out_fifo(71:0)
            WIRE 3296 1968 3312 1968
        END BRANCH
        BEGIN INSTANCE XLXI_3 3008 1696 R0
        END INSTANCE
        INSTANCE XLXI_5 1120 2160 R0
        INSTANCE XLXI_7 1536 2064 R0
        BEGIN BRANCH XLXN_7
            WIRE 1504 2320 1520 2320
            WIRE 1520 2000 1536 2000
            WIRE 1520 2000 1520 2320
        END BRANCH
        BEGIN BRANCH XLXN_134
            WIRE 1792 1936 1808 1936
            WIRE 1808 1936 1808 2304
            WIRE 1808 2304 1952 2304
            WIRE 1808 1936 1968 1936
        END BRANCH
        INSTANCE XLXI_2 1968 2128 R0
        BEGIN BRANCH XLXN_19
            WIRE 1504 928 1712 928
            WIRE 1712 928 1712 1472
            WIRE 1712 1472 1952 1472
            WIRE 1712 1472 1712 1680
            WIRE 1712 1680 2656 1680
        END BRANCH
        IOMARKER 144 1632 lastword R180 28
        IOMARKER 144 1312 firstword R180 28
        IOMARKER 3136 608 waddr(7:0) R0 28
        IOMARKER 3136 656 raddr(7:0) R0 28
        IOMARKER 80 2528 rst R180 28
        IOMARKER 3328 2304 valid_data R0 28
        IOMARKER 3312 1744 out_sram(71:0) R0 28
        IOMARKER 3312 1968 out_fifo(71:0) R0 28
        IOMARKER 880 928 fifowrite R180 28
        IOMARKER 880 1664 fiforead R180 28
        BEGIN BRANCH in_sram(71:0)
            WIRE 1776 752 2560 752
            WIRE 2560 752 2560 960
            WIRE 2560 960 2576 960
        END BRANCH
        BEGIN BRANCH raddr(7:0)
            WIRE 1104 2032 1120 2032
            WIRE 1104 2032 1104 2128
            WIRE 1104 2128 1104 2224
            WIRE 1104 2224 1120 2224
            WIRE 1104 2128 2448 2128
            WIRE 2352 1872 2448 1872
            WIRE 2448 1872 2448 1968
            WIRE 2448 1968 3008 1968
            WIRE 2448 1968 2448 2128
            WIRE 2448 656 3136 656
            WIRE 2448 656 2448 1872
        END BRANCH
        BEGIN INSTANCE XLXI_53 2576 992 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_70 2576 1296 R0
        END INSTANCE
        BEGIN BRANCH XLXN_159(71:0)
            WIRE 2336 896 2576 896
        END BRANCH
        BEGIN BRANCH waddr(7:0)
            WIRE 1056 1280 1120 1280
            WIRE 1056 1280 1056 1744
            WIRE 1056 1744 1056 1840
            WIRE 1056 1840 1120 1840
            WIRE 1056 1744 1616 1744
            WIRE 1616 1744 2400 1744
            WIRE 2336 1408 2400 1408
            WIRE 2400 1408 2400 1744
            WIRE 2400 608 2768 608
            WIRE 2768 608 3136 608
            WIRE 2400 608 2400 1200
            WIRE 2400 1200 2576 1200
            WIRE 2400 1200 2400 1408
            BEGIN DISPLAY 1616 1744 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
            BEGIN DISPLAY 2768 608 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_204(7:0)
            WIRE 2960 1136 2976 1136
            WIRE 2976 1136 2976 1744
            WIRE 2976 1744 3008 1744
        END BRANCH
        BEGIN BRANCH XLXN_205(71:0)
            WIRE 2960 832 2992 832
            WIRE 2992 832 2992 1776
            WIRE 2992 1776 3008 1776
        END BRANCH
        BEGIN BRANCH sramwrite
            WIRE 880 1184 2480 1184
            WIRE 2480 1184 2480 1744
            WIRE 2480 1744 2656 1744
        END BRANCH
        IOMARKER 880 1184 sramwrite R180 28
        BEGIN BRANCH sramaddr(7:0)
            WIRE 1776 656 1840 656
            WIRE 1840 656 1840 1264
            WIRE 1840 1264 2576 1264
        END BRANCH
        BEGIN BRANCH cpu_sel
            WIRE 1696 832 2512 832
            WIRE 2512 832 2576 832
            WIRE 2512 832 2512 1136
            WIRE 2512 1136 2576 1136
            WIRE 2512 1136 2512 1344
            WIRE 2512 1344 2752 1344
            WIRE 2752 1344 2752 1552
        END BRANCH
        BEGIN BRANCH XLXN_160
            WIRE 2880 1744 2928 1744
            WIRE 2928 1744 2928 1808
            WIRE 2928 1808 3008 1808
        END BRANCH
        BEGIN BRANCH rst
            WIRE 80 2528 1872 2528
            WIRE 1872 2528 1952 2528
            WIRE 1120 1504 1120 1632
            WIRE 1120 1632 1872 1632
            WIRE 1872 1632 1952 1632
            WIRE 1872 1632 1872 2096
            WIRE 1872 2096 1872 2528
            WIRE 1872 2096 1968 2096
            WIRE 1872 1088 1872 1632
            WIRE 1872 1088 1952 1088
        END BRANCH
        IOMARKER 1776 752 in_sram(71:0) R180 28
        IOMARKER 1776 656 sramaddr(7:0) R180 28
        BEGIN BRANCH clk
            WIRE 80 1056 240 1056
            WIRE 240 1056 240 1440
            WIRE 240 1440 256 1440
            WIRE 240 1440 240 1760
            WIRE 240 1760 256 1760
            WIRE 240 1056 1104 1056
            WIRE 1104 1056 1120 1056
            WIRE 1104 1056 1104 1152
            WIRE 1104 1152 1104 1408
            WIRE 1104 1408 1120 1408
            WIRE 1104 1152 1936 1152
            WIRE 1936 1152 1936 1536
            WIRE 1936 1536 1952 1536
            WIRE 1936 1536 1936 2000
            WIRE 1936 2000 1936 2160
            WIRE 1936 2160 1936 2432
            WIRE 1936 2432 1952 2432
            WIRE 1936 2160 2992 2160
            WIRE 2992 2160 3008 2160
            WIRE 1936 2000 1968 2000
            WIRE 1936 1024 1952 1024
            WIRE 1936 1024 1936 1152
            WIRE 2992 1936 3008 1936
            WIRE 2992 1936 2992 2160
        END BRANCH
        IOMARKER 1696 832 cpu_sel R180 28
        INSTANCE XLXI_55 2656 1552 R90
        BEGIN BRANCH XLXN_17
            WIRE 1936 176 1936 960
            WIRE 1936 960 1952 960
        END BRANCH
        INSTANCE XLXI_9 1872 176 R0
        IOMARKER 1744 896 in_fifo(71:0) R180 28
        IOMARKER 80 1056 clk R180 28
    END SHEET
END SCHEMATIC
