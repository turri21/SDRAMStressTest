`define SDRAM_WINBOND 0
`define SDRAM_ROWBITS 13
`define SDRAM_COLBITS 9
`define SDRAM_tCKminCL2 10000
`define SDRAM_tRC 66000
`define SDRAM_tWR 2
`define SDRAM_tRP 15000

// Old 3 pins MiSTer modules
//`define SDRAM_DQM_SHARED
`define SDRAM_CL 3			// 2

// New MiSTer modules
//`define SDRAM_DQM_SHARED
//`define SDRAM_CL 2		

`define SDRAM_RISKCONTENTION 0     	// 0



// The following macros must be defined externally to describe the SDRAM chip:
// SDRAM_ROWBITS <13 in most cases>
// SDRAM_COLBITS <9 for 32 meg chips, 10 for 64 meg chips.>
// SDRAM_CL <2 or 3>
// SDRAM_tCKminCL2 <shortest cycle time allowed for CL2>
// SDRAM_tRC <Ref/Act to Ref/Act in ps>
// SDRAM_tWR <write recovery time in cycles>
// SDRAM_tRP <precharge time in ps>
//
// SDRAM_DQM_SHARED
// MiSTer SDRAM modules have the DQM pins shared with A[12:11], which reduces
// the required pin count but makes effective use of bank interleaving extremely
// difficult.  If this macro is defined, the SDRAM controller will send DQM signals
// to the top two address bits, but will only work in CL2 mode since in CL3 mode
// the DQMs will collide with the next address.
//
// SDRAM_tCK <cycle time in ps> must be supplied as a parameter
// (Because it's project-specific, not board-specific.)
// If the core has a variable clock, specify the fastest rate.

// SDRAM_RISKCONTENTION <set to 1 to leave less space between reads and subsequent writes in CL3 mode.>

//128 MB module: has to be CL2 and no more than 100MHz. 128 definitely won't work with CL3, because the DQMs for a Read command happen one cycle after the Read in CL3 mode, which means they clash with the address of the next Active command.

//3 pins module: has to be CL3 and comment out //`define SDRAM_DQM_SHARED

//OK ignore those two green stripes - two of the ports in the SDRAM controller are only 8 bits wide (the ones that show error bits of 0xff rather than 0xffff) - so it's currently failing completely.
