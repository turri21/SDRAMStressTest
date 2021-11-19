# SDRAM Stress Test

This is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

SDRAMStressTest is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with the SDRAMStressTest.  If not, see <https://www.gnu.org/licenses/>.

## What does it do?
The SDRAM Stress Test is designed to give an SDRAM chip a heavy workout, using the multi-port SDRAM controller from the TurboGrafx16 core.
The tester performs a pseudo-random series of writes to RAM on each port simultaneously, then reads back the same series of addresses from each port, comparing the data received.

## Why?
Because the existing memory tester on MiSTer - which has been ported to other platforms - only takes the SDRAM for a gentle stroll, with no bank interleaving and thus any problems with crosstalk or power delivery to the module don't manifest.  This test makes use of bank interleaving, meaning addresses are crossing the bus at the same time as data, banks are being precharged at the same time as data is being sent or received, and the chip is generally working a lot harder.

## Limitations
The MiSTer memory modules in common use share the DQM pins with the upper two address bits.  This prevents taking full advantage of bank interleaving - and in fact the memory controller used in this core will only work with such modules in CL2 mode.  Since most chips can't do CL at more than 100MHz, that's the realistic maximum speed for this tester on MiSTer or other boards using the same modules.
On boards which don't have this limitation, the tester can run in CL3 mode, as fast as the chips will allow.
In order to have some compatibility with both types of memory, this tester doesn't make use of burst mode.

## Test results

Video output will result in a green screen if no errors are detected. Each error will show a red strip in the screen.

To show numeric results you should execute this script meanwhile the core is running:

```sh
#git clone https://github.com/DECAfpga/SDRAMStressTest
#cd SDRAMStressTest
git  submodule update --init --recursive 
/path/a/quartus/bin/quartus_stp -t jtagbridge.tcl
```

NOTE: Between different tests it is better to power cycle the board.

## DECA board

**Features:**

* HDMI video output
* VGA 444 video output is available through GPIO (see pinout below)

**Additional hardware required**:

- SDRAM module  (see pinout below)
  - Tested with a dual memory module v1.3 with 3 pins ([see connections](https://github.com/SoCFPGA-learning/DECA/tree/main/Projects/sdram_mister_deca) + [3pins](https://github.com/DECAfpga/DECA_board/blob/main/Sdram_mister_deca/README_3pins.md))
  - Tested with 32 MB SDRAM board for MiSTer (extra slim) XS_2.2 ([see connections](https://github.com/SoCFPGA-learning/DECA/tree/main/Projects/sdram_mister_deca)).

**Instructions to compile the project:**

(Note that sof/svf files are already included in /deca/output_files/)

```sh
git clone https://github.com/DECAfpga/SDRAMStressTest
cd SDRAMStressTest
git submodule update --init --recursive
#Do a first make (will finish in error). It will download missing submodules 
make
#when asked just accept default settings with Enter key
#Create file site.mk in DeMiSTify folder 
cd DeMiSTify
cp site.template site.mk
#Edit site.mk and add your own PATHs to Quartus (Q19)
gedit site.mk
#[Recommended step only needed if main branch is outdated]
git checkout somhic
#[DECA ONLY]Copy mofified deca_pins.tcl file to Demistify folder (MODIFICATION FOR 3 PINS SDRAM. THIS IS A TEMPORARY FIX)
cd ../deca
cp deca_pins.tcl_copy_to_demistify_board_deca ../DeMiSTify/Board/deca/deca_pins.tcl 
#Go back to root folder and do a make with board target (deca, neptuno, ...). If not specified it will compile for all targets.
cd ..
make BOARD=deca
```

After that you can:

* Flash bitstream directly from [command line](https://github.com/DECAfpga/DECA_binaries#flash-bitstream-to-fgpa-with-quartus)
* Load project in Quartus from /deca/nes_deca.qpf

**Pinout connections:**

![pinout_deca](pinout_deca.png)

This core just makes use of SDRAM pinout.  If not used HDMI could be uses VGA output also.

For 444 video DAC use all VGA pins. For 333 video DAC connect MSB from addon to MSB of location assignment (e.g. connect pin VGAR2 from Waveshare addon to VGA_R[3] Deca pin).

**STATUS:**

* Working fine

* HDMI video outputs special resolution so will not work on all monitors. 

**OSD Controls:**

* F12 show/hide OSD 

  
