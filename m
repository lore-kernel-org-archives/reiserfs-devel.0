From: "Michael G. Morey" <mmorey@optivel.com>
Subject: Re: SMART Self-Test Reports UNC Errors on Dell Latitude D800
	Hitachi Travelstar DK23FB
Date: Thu, 12 Aug 2004 12:48:08 -0500
Message-ID: <1092332887.22266.4.camel@turing.optivel.com>
References: <1092327723.16346.7.camel@turing.optivel.com>
	 <200408121932.08943.bernd-schubert@web.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-EbIKr248EaL4KR4dyiyK"
Return-path: <reiserfs-list-return-20233-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200408121932.08943.bernd-schubert@web.de>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Bernd Schubert <bernd-schubert@web.de>
Cc: Reiser Filesystem User List <reiserfs-list@namesys.com>

--=-EbIKr248EaL4KR4dyiyK
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2004-08-12 at 12:32, Bernd Schubert wrote:
> > My manager suggested that I reformat the partitions (we use ReiserFS
> > 3.6), to mark the bad blocks.  Is this a viable option?  Can the drive
> > be salvaged, or should it be replaced?
> >
> 
> Whats your definition of 'reformating'? Its certainly not 
> 'mkreiserfs /dev/my_partition'. You would need a tool for a low level format 
> of the disk, I don't know if there are any for IDE disks.
> 
> Smartctl should also return the 'reallocated sector count' values, if those 
> are only a few ones, it might be worth a try to run 'badblocks 
> -n /dev/my_device', I think most drives only reallocate sectors when data are 
> written to them. After this has finished, try the badblocks and smartctl 
> command again, if there are still any errors, I would just get a new drive.
> 
> Somewhere on the namesys site you will also find an article about badblocks 
> handling with reiserfs, but I would do this only in absolut emergency if I 
> would need to rescue my data.
> 
> 
> Cheers,
> 	Bernd

Bernd,

The Reallocated Sector Count appears to be 91.  I'm not entirely sure
how to interpret thye SMART Attributes with Thresholds table.  What is
the meaning of the VALUE, WORST, and THRESH columns?  What is your
assesment of my hard drive?  I've attached the output of smartctl --all.

Thanks.

Michael
-- 
Michael G. Morey <mmorey@optivel.com>
Optivel

--=-EbIKr248EaL4KR4dyiyK
Content-Disposition: attachment; filename=smartctl-all-turing.log
Content-Type: text/plain; name=smartctl-all-turing.log
Content-Transfer-Encoding: 7bit

--- working directory: /home/mmorey/
% sudo smartctl --all /dev/hda
smartctl version 5.32 Copyright (C) 2002-4 Bruce Allen
Home page is http://smartmontools.sourceforge.net/

=== START OF INFORMATION SECTION ===
Device Model:     HITACHI_DK23FB-60
Serial Number:    1MG960
Firmware Version: 00M0A0C1
Device is:        In smartctl database [for details use: -P show]
ATA Version is:   5
ATA Standard is:  ATA/ATAPI-5 T13 1321D revision 3
Local Time is:    Thu Aug 12 12:46:43 2004 EST
SMART support is: Available - device has SMART capability.
SMART support is: Enabled

=== START OF READ SMART DATA SECTION ===
SMART overall-health self-assessment test result: PASSED

General SMART Values:
Offline data collection status:  (0x80)	Offline data collection activity
					was never started.
					Auto Offline Data Collection: Enabled.
Self-test execution status:      (   0)	The previous self-test routine completed
					without error or no self-test has ever 
					been run.
Total time to complete Offline 
data collection: 		 (2150) seconds.
Offline data collection
capabilities: 			 (0x5b) SMART execute Offline immediate.
					Auto Offline data collection on/off support.
					Suspend Offline collection upon new
					command.
					Offline surface scan supported.
					Self-test supported.
					No Conveyance Self-test supported.
					Selective Self-test supported.
SMART capabilities:            (0x0003)	Saves SMART data before entering
					power-saving mode.
					Supports SMART auto save timer.
Error logging capability:        (0x01)	Error logging supported.
					No General Purpose Logging support.
Short self-test routine 
recommended polling time: 	 (   2) minutes.
Extended self-test routine
recommended polling time: 	 (  37) minutes.

SMART Attributes Data Structure revision number: 16
Vendor Specific SMART Attributes with Thresholds:
ID# ATTRIBUTE_NAME          FLAG     VALUE WORST THRESH TYPE      UPDATED  WHEN_FAILED RAW_VALUE
  1 Raw_Read_Error_Rate     0x000d   096   095   050    Pre-fail  Offline      -       201863463061
  2 Throughput_Performance  0x0005   100   096   050    Pre-fail  Offline      -       3120
  3 Spin_Up_Time            0x0007   100   100   050    Pre-fail  Always       -       0
  4 Start_Stop_Count        0x0032   100   100   000    Old_age   Always       -       519
  5 Reallocated_Sector_Ct   0x0033   090   090   010    Pre-fail  Always       -       287
  7 Seek_Error_Rate         0x000f   100   100   050    Pre-fail  Always       -       160
  8 Seek_Time_Performance   0x0005   100   100   050    Pre-fail  Offline      -       1179
  9 Power_On_Minutes        0x0032   092   092   000    Old_age   Always       -       4114h+11m
 10 Spin_Retry_Count        0x0013   100   100   050    Pre-fail  Always       -       0
 12 Power_Cycle_Count       0x0032   100   100   000    Old_age   Always       -       505
191 G-Sense_Error_Rate      0x000a   100   093   000    Old_age   Always       -       77567
192 Power-Off_Retract_Count 0x0032   100   100   000    Old_age   Always       -       44
193 Load_Cycle_Count        0x0032   085   085   000    Old_age   Always       -       94302/94257
194 Temperature_Celsius     0x0022   078   050   000    Old_age   Always       -       51 (Lifetime Min/Max 65/15)
195 Hardware_ECC_Recovered  0x001a   090   001   000    Old_age   Always       -       7613
196 Reallocated_Event_Count 0x0032   072   072   000    Old_age   Always       -       287
197 Current_Pending_Sector  0x0032   099   098   000    Old_age   Always       -       1
198 Offline_Uncorrectable   0x0010   100   100   000    Old_age   Offline      -       0
199 UDMA_CRC_Error_Count    0x003e   200   200   000    Old_age   Always       -       0
200 Multi_Zone_Error_Rate   0x0013   100   100   050    Pre-fail  Always       -       0
201 Soft_Read_Error_Rate    0x0012   100   100   000    Old_age   Always       -       1
223 Load_Retry_Count        0x0012   100   100   000    Old_age   Always       -       0
230 Head_Amplitude          0x0032   094   094   000    Old_age   Always       -       180725
250 Read_Error_Retry_Rate   0x000a   100   001   000    Old_age   Always       -       789

SMART Error Log Version: 1
ATA Error Count: 103 (device log contains only the most recent five errors)
	CR = Command Register [HEX]
	FR = Features Register [HEX]
	SC = Sector Count Register [HEX]
	SN = Sector Number Register [HEX]
	CL = Cylinder Low Register [HEX]
	CH = Cylinder High Register [HEX]
	DH = Device/Head Register [HEX]
	DC = Device Command Register [HEX]
	ER = Error register [HEX]
	ST = Status register [HEX]
Powered_Up_Time is measured from power on, and printed as
DDd+hh:mm:SS.sss where DD=days, hh=hours, mm=minutes,
SS=sec, and sss=millisec. It "wraps" after 49.710 days.

Error 103 occurred at disk power-on lifetime: 4113 hours (171 days + 9 hours)
  When the command that caused the error occurred, the device was active or idle.

  After command completion occurred, registers were:
  ER ST SC SN CL CH DH
  -- -- -- -- -- -- --
  40 51 71 3f ce 9f e0  Error: UNC 113 sectors at LBA = 0x009fce3f = 10473023

  Commands leading to the command that caused the error were:
  CR FR SC SN CL CH DH DC   Powered_Up_Time  Command/Feature_Name
  -- -- -- -- -- -- -- --  ----------------  --------------------
  c8 00 7c 34 ce 9f e0 00   3d+02:26:03.110  READ DMA
  c8 00 7e 32 ce 9f e0 00   3d+02:26:01.250  READ DMA
  c8 00 80 30 ce 9f e0 00   3d+02:25:59.060  READ DMA
  c8 00 08 92 f4 ab e2 00   3d+02:25:59.040  READ DMA
  c8 00 80 b0 cd 9f e0 00   3d+02:25:59.040  READ DMA

Error 102 occurred at disk power-on lifetime: 4113 hours (171 days + 9 hours)
  When the command that caused the error occurred, the device was active or idle.

  After command completion occurred, registers were:
  ER ST SC SN CL CH DH
  -- -- -- -- -- -- --
  40 51 73 3d ce 9f e0  Error: UNC 115 sectors at LBA = 0x009fce3d = 10473021

  Commands leading to the command that caused the error were:
  CR FR SC SN CL CH DH DC   Powered_Up_Time  Command/Feature_Name
  -- -- -- -- -- -- -- --  ----------------  --------------------
  c8 00 7e 32 ce 9f e0 00   3d+02:26:01.250  READ DMA
  c8 00 80 30 ce 9f e0 00   3d+02:25:59.060  READ DMA
  c8 00 08 92 f4 ab e2 00   3d+02:25:59.040  READ DMA
  c8 00 80 b0 cd 9f e0 00   3d+02:25:59.040  READ DMA
  c8 00 80 30 cd 9f e0 00   3d+02:25:59.010  READ DMA

Error 101 occurred at disk power-on lifetime: 4113 hours (171 days + 9 hours)
  When the command that caused the error occurred, the device was active or idle.

  After command completion occurred, registers were:
  ER ST SC SN CL CH DH
  -- -- -- -- -- -- --
  40 51 71 3f ce 9f e0  Error: UNC 113 sectors at LBA = 0x009fce3f = 10473023

  Commands leading to the command that caused the error were:
  CR FR SC SN CL CH DH DC   Powered_Up_Time  Command/Feature_Name
  -- -- -- -- -- -- -- --  ----------------  --------------------
  c8 00 80 30 ce 9f e0 00   3d+02:25:59.060  READ DMA
  c8 00 08 92 f4 ab e2 00   3d+02:25:59.040  READ DMA
  c8 00 80 b0 cd 9f e0 00   3d+02:25:59.040  READ DMA
  c8 00 80 30 cd 9f e0 00   3d+02:25:59.010  READ DMA
  c8 00 08 8a ea ab e2 00   3d+02:25:59.000  READ DMA

Error 100 occurred at disk power-on lifetime: 4113 hours (171 days + 9 hours)
  When the command that caused the error occurred, the device was active or idle.

  After command completion occurred, registers were:
  ER ST SC SN CL CH DH
  -- -- -- -- -- -- --
  40 51 75 3b 6a 9f e0  Error: UNC 117 sectors at LBA = 0x009f6a3b = 10447419

  Commands leading to the command that caused the error were:
  CR FR SC SN CL CH DH DC   Powered_Up_Time  Command/Feature_Name
  -- -- -- -- -- -- -- --  ----------------  --------------------
  c8 00 80 30 6a 9f e0 00   3d+02:25:47.570  READ DMA
  c8 00 20 2a 84 14 e3 00   3d+02:25:47.500  READ DMA
  ca 00 08 00 71 4a e4 00   3d+02:25:47.500  WRITE DMA
  ca 00 08 20 70 4e e4 00   3d+02:25:47.500  WRITE DMA
  ca 00 08 80 fb 4d e4 00   3d+02:25:47.490  WRITE DMA

Error 99 occurred at disk power-on lifetime: 4113 hours (171 days + 9 hours)
  When the command that caused the error occurred, the device was active or idle.

  After command completion occurred, registers were:
  ER ST SC SN CL CH DH
  -- -- -- -- -- -- --
  40 51 52 de 69 9f e0  Error: UNC 82 sectors at LBA = 0x009f69de = 10447326

  Commands leading to the command that caused the error were:
  CR FR SC SN CL CH DH DC   Powered_Up_Time  Command/Feature_Name
  -- -- -- -- -- -- -- --  ----------------  --------------------
  c8 00 80 b0 69 9f e0 00   3d+02:25:40.780  READ DMA
  c8 00 80 30 69 9f e0 00   3d+02:25:40.450  READ DMA
  c8 00 08 c2 25 d7 e2 00   3d+02:25:40.450  READ DMA
  ca 00 08 68 b4 4a e4 00   3d+02:25:40.450  WRITE DMA
  c8 00 80 b0 68 9f e0 00   3d+02:25:40.350  READ DMA

SMART Self-test log structure revision number 1
Num  Test_Description    Status                  Remaining  LifeTime(hours)  LBA_of_first_error
# 1  Short offline       Completed without error       00%      4103         -
# 2  Extended offline    Completed: read failure       80%      4089         8371832
# 3  Short offline       Completed without error       00%      4088         -
# 4  Short offline       Completed without error       00%         0         -

SMART Selective self-test log data structure revision number 1
 SPAN  MIN_LBA  MAX_LBA  CURRENT_TEST_STATUS
    1        0        0  Not_testing
    2        0        0  Not_testing
    3        0        0  Not_testing
    4        0        0  Not_testing
    5        0        0  Not_testing
Selective self-test flags (0x0):
  After scanning selected spans, do NOT read-scan remainder of disk.
If Selective self-test is pending on power-up, resume after 0 minute delay.


Exit 192 12:46:43

--=-EbIKr248EaL4KR4dyiyK--

