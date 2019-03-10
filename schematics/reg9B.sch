VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "virtex2p"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL q(63:48)
        SIGNAL d(63:48)
        SIGNAL q(47:32)
        SIGNAL d(47:32)
        SIGNAL q(31:16)
        SIGNAL d(31:16)
        SIGNAL q(15:0)
        SIGNAL d(15:0)
        SIGNAL q(71:64)
        SIGNAL d(71:64)
        SIGNAL d(71:0)
        SIGNAL XLXN_13
        SIGNAL ce
        SIGNAL XLXN_15
        SIGNAL XLXN_16
        SIGNAL XLXN_17
        SIGNAL XLXN_18
        SIGNAL XLXN_19
        SIGNAL XLXN_20
        SIGNAL XLXN_21
        SIGNAL clk
        SIGNAL XLXN_23
        SIGNAL clr
        SIGNAL XLXN_25
        SIGNAL XLXN_26
        SIGNAL XLXN_27
        SIGNAL q(71:0)
        PORT Input d(71:0)
        PORT Input ce
        PORT Input clk
        PORT Input clr
        PORT Output q(71:0)
        BEGIN BLOCKDEF fd16ce
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -128 64 -128 
            LINE N 0 -192 64 -192 
            LINE N 0 -32 64 -32 
            LINE N 0 -256 64 -256 
            LINE N 384 -256 320 -256 
            LINE N 80 -128 64 -144 
            LINE N 64 -112 80 -128 
            RECTANGLE N 320 -268 384 -244 
            RECTANGLE N 0 -268 64 -244 
            LINE N 192 -32 64 -32 
            LINE N 192 -64 192 -32 
            RECTANGLE N 64 -320 320 -64 
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
        BEGIN BLOCK XLXI_1 fd16ce
            PIN C clk
            PIN CE ce
            PIN CLR clr
            PIN D(15:0) d(63:48)
            PIN Q(15:0) q(63:48)
        END BLOCK
        BEGIN BLOCK XLXI_2 fd16ce
            PIN C clk
            PIN CE ce
            PIN CLR clr
            PIN D(15:0) d(47:32)
            PIN Q(15:0) q(47:32)
        END BLOCK
        BEGIN BLOCK XLXI_3 fd16ce
            PIN C clk
            PIN CE ce
            PIN CLR clr
            PIN D(15:0) d(31:16)
            PIN Q(15:0) q(31:16)
        END BLOCK
        BEGIN BLOCK XLXI_4 fd16ce
            PIN C clk
            PIN CE ce
            PIN CLR clr
            PIN D(15:0) d(15:0)
            PIN Q(15:0) q(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_5 fd8ce
            PIN C clk
            PIN CE ce
            PIN CLR clr
            PIN D(7:0) d(71:64)
            PIN Q(7:0) q(71:64)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE XLXI_1 1536 1248 R0
        BEGIN BRANCH q(63:48)
            WIRE 1920 992 2032 992
            WIRE 2032 992 2064 992
            BEGIN DISPLAY 2032 992 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH d(63:48)
            WIRE 1408 992 1472 992
            WIRE 1472 992 1536 992
            BEGIN DISPLAY 1472 992 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_2 1536 1600 R0
        BEGIN BRANCH q(47:32)
            WIRE 1920 1344 2032 1344
            WIRE 2032 1344 2064 1344
            BEGIN DISPLAY 2032 1344 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH d(47:32)
            WIRE 1408 1344 1472 1344
            WIRE 1472 1344 1536 1344
            BEGIN DISPLAY 1472 1344 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_3 1536 1952 R0
        BEGIN BRANCH q(31:16)
            WIRE 1920 1696 2032 1696
            WIRE 2032 1696 2064 1696
            BEGIN DISPLAY 2032 1696 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH d(31:16)
            WIRE 1408 1696 1472 1696
            WIRE 1472 1696 1536 1696
            BEGIN DISPLAY 1472 1696 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_4 1536 2304 R0
        BEGIN BRANCH q(15:0)
            WIRE 1920 2048 2032 2048
            WIRE 2032 2048 2064 2048
            BEGIN DISPLAY 2032 2048 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH d(15:0)
            WIRE 1408 2048 1472 2048
            WIRE 1472 2048 1536 2048
            BEGIN DISPLAY 1472 2048 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_5 1536 896 R0
        BEGIN BRANCH q(71:64)
            WIRE 1920 640 1984 640
            WIRE 1984 640 2064 640
            BEGIN DISPLAY 1984 640 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH d(71:64)
            WIRE 1408 640 1456 640
            WIRE 1456 640 1536 640
            BEGIN DISPLAY 1456 640 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ce
            WIRE 1200 704 1312 704
            WIRE 1312 704 1536 704
            WIRE 1312 704 1312 1056
            WIRE 1312 1056 1536 1056
            WIRE 1312 1056 1312 1408
            WIRE 1312 1408 1536 1408
            WIRE 1312 1408 1312 1760
            WIRE 1312 1760 1536 1760
            WIRE 1312 1760 1312 2112
            WIRE 1312 2112 1536 2112
        END BRANCH
        BEGIN BRANCH clk
            WIRE 1040 768 1216 768
            WIRE 1216 768 1536 768
            WIRE 1216 768 1216 1120
            WIRE 1216 1120 1536 1120
            WIRE 1216 1120 1216 1472
            WIRE 1216 1472 1536 1472
            WIRE 1216 1472 1216 1824
            WIRE 1216 1824 1536 1824
            WIRE 1216 1824 1216 2176
            WIRE 1216 2176 1536 2176
        END BRANCH
        BEGIN BRANCH clr
            WIRE 944 864 1120 864
            WIRE 1120 864 1536 864
            WIRE 1120 864 1120 1216
            WIRE 1120 1216 1520 1216
            WIRE 1520 1216 1536 1216
            WIRE 1120 1216 1120 1568
            WIRE 1120 1568 1536 1568
            WIRE 1120 1568 1120 1920
            WIRE 1120 1920 1536 1920
            WIRE 1120 1920 1120 2272
            WIRE 1120 2272 1536 2272
        END BRANCH
        IOMARKER 560 384 d(71:0) R180 28
        BEGIN BRANCH d(71:0)
            WIRE 560 384 768 384
        END BRANCH
        BEGIN BRANCH q(71:0)
            WIRE 2432 400 2752 400
        END BRANCH
        IOMARKER 2752 400 q(71:0) R0 28
        IOMARKER 1200 704 ce R180 28
        IOMARKER 1040 768 clk R180 28
        IOMARKER 944 864 clr R180 28
    END SHEET
END SCHEMATIC
