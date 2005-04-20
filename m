From: "Simon \"Sturmflut\" Raffeiner" <sturmflut@lieberbiber.de>
Subject: Re: file system curruption
Date: Wed, 20 Apr 2005 16:12:52 +0200
Message-ID: <200504201612.55925.sturmflut@lieberbiber.de>
References: <425FB56E.7060801@cpc.wmin.ac.uk> <1113817744.3975.58.camel@tribesman.namesys.com> <4266538A.3060803@cpc.wmin.ac.uk>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1325373.uNQi37PbFa";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23900-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4266538A.3060803@cpc.wmin.ac.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--nextPart1325373.uNQi37PbFa
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

My teacher gave me a harddisk once, the first 8MB (containing the FAT) were=
=20
completely unreadable. According to SMART, the disk was good. So much for t=
he=20
accuracy of SMART data...

Am Mittwoch, 20. April 2005 15:05 schrieb Szabolcs Illes:
> Vladimir Saveliev wrote:
> >Hello
> >
> >On Fri, 2005-04-15 at 16:37, Szabolcs Illes wrote:
> >>Hi,
> >>
> >>I have found these entries in my system log: (maybe it's a reiserfs4 bu=
g)
> >>
> >>Mar 14 20:06:15 sunset reiser4[umount(8489)]: reiser4_handle_error
> >> (fs/reiser4/vfs_ops.c:1432)[foobar-42]: Mar 14 20:06:15 sunset reiser4
> >> panicked cowardly: Filesystem error occured Mar 14 20:06:15 sunset
> >
> >This indicates that reiser4 were not able to write block to a disk. It
> >is very likely that disk has problems.
>
> According to the smart data the disk is all right: (As far as I remember
> once when I wannted to restart my laptop, it crashed when it was remount
> the / or the /home partition. I had to press the reset button. )
>
> smartctl version 5.33 [i686-pc-linux-gnu] Copyright (C) 2002-4 Bruce Allen
> Home page is http://smartmontools.sourceforge.net/
>
> =3D=3D=3D START OF INFORMATION SECTION =3D=3D=3D
> Device Model:     HTS548040M9AT00
> Serial Number:    MRL252L2G21V2G
> Firmware Version: MG2OA53A
> User Capacity:    40,007,761,920 bytes
> Device is:        In smartctl database [for details use: -P show]
> ATA Version is:   6
> ATA Standard is:  ATA/ATAPI-6 T13 1410D revision 3a
> Local Time is:    Tue Apr 19 19:29:14 2005 UTC
> SMART support is: Available - device has SMART capability.
> SMART support is: Enabled
>
> =3D=3D=3D START OF READ SMART DATA SECTION =3D=3D=3D
> SMART overall-health self-assessment test result: PASSED
>
> General SMART Values:
> Offline data collection status:  (0x82)	Offline data collection activity
> 					was completed without error.
> 					Auto Offline Data Collection: Enabled.
> Self-test execution status:      (   0)	The previous self-test routine
> completed without error or no self-test has ever
> 					been run.
> Total time to complete Offline
> data collection: 		 ( 645) seconds.
> Offline data collection
> capabilities: 			 (0x5b) SMART execute Offline immediate.
> 					Auto Offline data collection on/off support.
> 					Suspend Offline collection upon new
> 					command.
> 					Offline surface scan supported.
> 					Self-test supported.
> 					No Conveyance Self-test supported.
> 					Selective Self-test supported.
> SMART capabilities:            (0x0003)	Saves SMART data before entering
> 					power-saving mode.
> 					Supports SMART auto save timer.
> Error logging capability:        (0x01)	Error logging supported.
> 					General Purpose Logging supported.
> Short self-test routine
> recommended polling time: 	 (   2) minutes.
> Extended self-test routine
> recommended polling time: 	 (  30) minutes.
>
> SMART Attributes Data Structure revision number: 16
> Vendor Specific SMART Attributes with Thresholds:
> ID# ATTRIBUTE_NAME          FLAG     VALUE WORST THRESH TYPE      UPDATED=
=20
> WHEN_FAILED RAW_VALUE 1 Raw_Read_Error_Rate     0x000b   100   100   062 =
 =20
> Pre-fail  Always       -       65536 2 Throughput_Performance  0x0005   1=
06
>   106   040    Pre-fail  Offline      -       4553 3 Spin_Up_Time        =
 =20
>  0x0007   204   204   033    Pre-fail  Always       -       1 4
> Start_Stop_Count        0x0012   100   100   000    Old_age   Always     =
=20
> -       414 5 Reallocated_Sector_Ct   0x0033   100   100   005    Pre-fai=
l=20
> Always       -       0 7 Seek_Error_Rate         0x000b   100   100   067=
 =20
>  Pre-fail  Always       -       0 8 Seek_Time_Performance   0x0005   134 =
=20
> 134   040    Pre-fail  Offline      -       33 9 Power_On_Hours        =20
> 0x0012   098   098   000    Old_age   Always       -       1237 10
> Spin_Retry_Count        0x0013   100   100   060    Pre-fail  Always     =
=20
> -       0 12 Power_Cycle_Count       0x0032   100   100   000    Old_age =
=20
> Always       -       404 191 G-Sense_Error_Rate      0x000a   100   100 =
=20
> 000    Old_age   Always       -       1 192 Power-Off_Retract_Count 0x003=
2=20
>  100   100   000    Old_age   Always       -       15 193 Load_Cycle_Coun=
t=20
>       0x0012   087   087   000    Old_age   Always       -       139498 1=
94
> Temperature_Celsius     0x0002   130   130   000    Old_age   Always     =
=20
> -       42 (Lifetime Min/Max 17/51) 196 Reallocated_Event_Count 0x0032 =20
> 100   100   000    Old_age   Always       -       0 197
> Current_Pending_Sector  0x0022   100   100   000    Old_age   Always     =
=20
> -       0 198 Offline_Uncorrectable   0x0008   100   100   000    Old_age=
 =20
> Offline      -       0 199 UDMA_CRC_Error_Count    0x000a   200   200   0=
00
>    Old_age   Always       -       0
>
> SMART Error Log Version: 1
> No Errors Logged
>
> SMART Self-test log structure revision number 1
> Num  Test_Description    Status                  Remaining  LifeTime(hour=
s)
>  LBA_of_first_error # 1  Extended offline    Completed without error     =
=20
> 00%      1237         - # 2  Short offline       Completed without error =
 =20
>    00%       952         - # 3  Short offline       Completed without err=
or
>       00%       862         - # 4  Short offline       Completed without
> error       00%       270         - # 5  Extended offline    Completed
> without error       00%       246         - # 6  Short offline     =20
> Completed without error       00%       243         - # 7  Short offline =
 =20
>    Completed without error       00%        20         - # 8  Short offli=
ne
>       Completed without error       00%        20         - # 9  Short
> offline       Completed without error       00%        20         - #10=20
> Short offline       Completed without error       00%         2         -
> #11  Short offline       Completed without error       00%         1     =
 =20
>  - #12  Short offline       Completed without error       00%         0  =
 =20
>     -
>
> Warning! SMART Selective Self-Test Log Structure error: invalid SMART
> checksum. SMART Selective self-test log data structure revision number 1
>  SPAN  MIN_LBA  MAX_LBA  CURRENT_TEST_STATUS
>     1        0        0  Not_testing
>     2        0        0  Not_testing
>     3        0        0  Not_testing
>     4        0        0  Not_testing
>     5        0        0  Not_testing
> Selective self-test flags (0x0):
>   After scanning selected spans, do NOT read-scan remainder of disk.
> If Selective self-test is pending on power-up, resume after 0 minute dela=
y.
>
>
> Szabolcs
>

--nextPart1325373.uNQi37PbFa
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBCZmNnd2q78rIgT6ARAlsrAJ42ox0fXtUlfZw+gnWxz0ih3ehtiQCZAf+E
tOA7HCXnAtk5vuw5/4v6BAM=
=4LuI
-----END PGP SIGNATURE-----

--nextPart1325373.uNQi37PbFa--
