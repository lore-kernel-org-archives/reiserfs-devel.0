From: Soeren Sonnenburg <reiserfs@nn7.de>
Subject: Re: trouble with reiserfs on ppc vs-3050:
	wait_buffer_until_released ...
Date: 25 Apr 2003 11:33:40 +0200
Message-ID: <1051263219.1642.10.camel@localhost>
References: <1051258287.5564.1.camel@fortknox>
	 <1051259723.3513.7.camel@localhost> <20030425084742.GA22827@namesys.com>
	 <1051261556.3513.31.camel@localhost>  <20030425091916.GG10802@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13811-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030425091916.GG10802@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Oleg Drokin <green@namesys.com>

On Fri, 2003-04-25 at 11:19, Oleg Drokin wrote:
> Hello!
> 
> On Fri, Apr 25, 2003 at 11:05:56AM +0200, Soeren Sonnenburg wrote:
> > > There are no known endianness issues in reiserfs code now.
> > > You di not had reboot or something like that after you copied the data over?
> > I rebooted ... it is the /home partition.
> 
> Do you start reiserfsck on boot (3.6.6 one?) ?
> Was the reboot clean?

Hmmhhh, I can now access the file (after I did --fix-fixable) ...
strange. I also rebooted and checked the fs again... it reports to be
ok.

IIRC there was no unclean reboot before that vs-3050 thing appeared.

Or could this be caused by "repartitioning but not reboot and then
mkreiserfs" ? I did not reboot as the last partition was hfs+ and all I
did was deleting+creating a linux partition instead...

Can one check whether partition sizes are the same as reiserfs thinks ?

If not then I will reformat the partition again ...

Soeren.

[11:28][root@no:/home/sonne]# debugreiserfs /dev/hda7
<--------debugreiserfs 3.6.4, 2002-------->


Filesystem state: consistency is not checked after last mounting

Reiserfs super block in block 16 on 0x10042e40 of format 3.6 with
standard journ
al
Count of blocks on the device: 5476231
Number of bitmaps: 168
Blocksize: 4096
Free blocks (count of blocks - used [journal, bitmaps, data, reserved]
blocks): 
2709134
Root block: 2866321
Filesystem is NOT cleanly umounted
Tree height: 5
Hash function used to sort names: "r5"
Objectid map size 100, max 972
Journal parameters:
	Device [0x0]
	Magic [0x6f260e58]
	Size 8193 blocks (including 1 for journal header) (first block 18)
	Max transaction length 1024 blocks
	Max batch size 900 blocks
	Max commit age 30
Blocks reserved by journal: 0
Fs state field: 0x0
sb_version: 2
inode generation number: 3796
UUID: b29c82c8-2cd9-48ac-a2f4-d4f0aecc6875
LABEL: 
Set flags in SB:
	ATTRIBUTES CLEAN
/dev/hda
        #                    type name                  length   base      ( size )  system
/dev/hda1     Apple_partition_map Apple                     63 @ 1         ( 31.5k)  Partition map
/dev/hda2         Apple_Bootstrap bootstrap               1600 @ 64        (800.0k)  NewWorld bootblock
/dev/hda3         Apple_UNIX_SVR2 swap                 2097152 @ 1664      (  1.0G)  Linux swap
/dev/hda4         Apple_UNIX_SVR2 spare                2097152 @ 2098816   (  1.0G)  Linux native
/dev/hda5         Apple_UNIX_SVR2 root                27261376 @ 4195968   ( 13.0G)  Linux native
/dev/hda6               Apple_HFS MacOS X             41943040 @ 31457344  ( 20.0G)  HFS
/dev/hda7         Apple_UNIX_SVR2 home                43809856 @ 73400384  ( 20.9G)  Linux native

Block size=512, Number of Blocks=117210240
DeviceType=0x0, DeviceId=0x0



