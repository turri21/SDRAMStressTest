# DECA board

**Now compatible with [Deca Retro Cape 2](https://github.com/somhi/DECA_retro_cape_2)** (new location for 3 pins of old SDRAM modules). Otherwise see pinout below to connect everything through GPIOs.

## Features

* HDMI video output
* VGA 444 video output is available through GPIO (see pinout below)

## Additional hardware required

- SDRAM module  (see pinout below)
  - Tested with a dual memory module v1.3 with 3 pins ([see connections](https://github.com/SoCFPGA-learning/DECA/tree/main/Projects/sdram_mister_deca) + [3pins](https://github.com/DECAfpga/DECA_board/blob/main/Sdram_mister_deca/README_3pins.md) in case you do not have a Deca Retro cape you should change pin locations)
  - Tested with 32 MB SDRAM board for MiSTer (extra slim) XS_2.2 ([see connections](https://github.com/SoCFPGA-learning/DECA/tree/main/Projects/sdram_mister_deca)).

## Instructions to compile the project

(Note that sof/svf files are already included in /deca/output_files/)

```sh
git clone https://github.com/DECAfpga/SDRAMStressTest
cd SDRAMStressTest
#Do a first make (will finish in error). It will download missing submodules 
make
#In case does submodules are not downloaded
git submodule update --init --recursive  
#Create file site.mk in DeMiSTify folder 
cd DeMiSTify
cp site.template site.mk
#Edit site.mk and add your own PATHs to Quartus (Q18)
gedit site.mk
#Go back to root folder and do a make with board target (deca, neptuno, ...). If not specified it will compile for all targets.
cd ..
make BOARD=deca
#when asked just accept default settings with Enter key
```

After that you can:

* Flash bitstream directly from [command line](https://github.com/DECAfpga/DECA_binaries#flash-bitstream-to-fgpa-with-quartus)
* Load project in Quartus from /deca/SDRAMStressTest_deca.qpf

## Pinout connections

![pinout_deca](pinout_deca.png)

This core just makes use of SDRAM pinout.  If not used HDMI could be used VGA output also.

For 444 video DAC use all VGA pins. For 333 video DAC connect MSB from addon to MSB of location assignment (e.g. connect pin VGAR2 from Waveshare addon to VGA_R[3] Deca pin).

## STATUS

* Working fine

* HDMI video outputs special resolution so will not work on all monitors. 

## OSD Controls

* F12 show/hide OSD 

  
