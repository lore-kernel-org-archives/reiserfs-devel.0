From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: corrupted disk
Date: Tue, 11 Oct 2005 17:53:24 +0400
Message-ID: <434BC3D4.4090505@namesys.com>
References: <200510111602.24857.listuser@peternixon.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26481-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200510111602.24857.listuser@peternixon.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Peter Nixon <listuser@peternixon.net>
Cc: reiserfs-list@namesys.com

Hello

Peter Nixon wrote:
> Hi List
> 
> I have an interesting problem at a customer which I hope someone can shed some 
> light on.
> 
> The server is an IBM server with an multipath SCSI controller connected to a 
> SAN with multiple 2 TB disks configured. The Operating System is SLES 8. 
> Among other things the server runs IBM DB2.
> A previous contractor recommended to that the filesystems be directly created 
> on the disk devices, NOT on disk partitions so the filesystem in question is 
> on /dev/sdc
> 
> At 06:15 this morning the following errors showed up in /var/log/messages
> 
> Oct 11 06:15:03 DB2MUHASEBE kernel: journal-2332: Trying to log block 359, 
> which is a log block

this is a good reason to crash

> Oct 11 06:15:03 DB2MUHASEBE kernel: kernel BUG at prints.c:334!
> Oct 11 06:15:03 DB2MUHASEBE kernel: invalid operand: 0000 2.4.21-138-smp #1 
> SMP Fri Oct 31 00:51:31 UTC 2003
> Oct 11 06:15:03 DB2MUHASEBE kernel: CPU:    1
> Oct 11 06:15:03 DB2MUHASEBE kernel: EIP:    0010:
> [st:__insmod_st_O/lib/modules/2.4.21-138-smp/kernel/drivers/scs+-317460792/96]    
> Tainted: P
> Oct 11 06:15:03 DB2MUHASEBE kernel: EIP:    0010:[<c5096ec8>]    Tainted: P
> Oct 11 06:15:03 DB2MUHASEBE kernel: EFLAGS: 00010296
> Oct 11 06:15:03 DB2MUHASEBE kernel: eax: 0000003f   ebx: f11ea000   ecx: 
> 00000046   edx: c032f8c8
> Oct 11 06:15:03 DB2MUHASEBE kernel: esi: f9596578   edi: 00000167   ebp: 
> f958a7a0   esp: ebfe9ea4
> Oct 11 06:15:03 DB2MUHASEBE kernel: ds: 0018   es: 0018   ss: 0018
> Oct 11 06:15:03 DB2MUHASEBE kernel: Process db2sysc (pid: 18866, 
> stackpage=ebfe9000)
> Oct 11 06:15:03 DB2MUHASEBE kernel: Stack: c50b4d56 c50b5800 f9596578 00002012 
> c50a8758 f11ea000 c50b3fe0 00000167
> Oct 11 06:15:03 DB2MUHASEBE kernel:        00000006 c50a65a5 c50b5051 03882f46 
> ef8d48d8 00000000 d7c8e7a0 00000004
> Oct 11 06:15:03 DB2MUHASEBE kernel:        00000000 00000042 00000000 e68797e0 
> e6879260 f6277000 f475b000 f9596578
> Oct 11 06:15:03 DB2MUHASEBE kernel: Call Trace:         
> [st:__insmod_st_O/lib/modules/2.4.21-138-smp/kernel/drivers/scs+-317338282/96] 
> (04) [st:__insmod_st_O/
> lib/modules/2.4.21-138-smp/kernel/drivers/scs+-317335552/96] (12) 
> [st:__insmod_st_O/lib/modules/2.4.21-138-smp/kernel/drivers/scs+-317388968/96] 
> (08)
> Oct 11 06:15:03 DB2MUHASEBE kernel: Call Trace:         [<c50b4d56>] (04) 
> [<c50b5800>] (12) [<c50a8758>] (08)
> Oct 11 06:15:03 DB2MUHASEBE kernel:   
> [st:__insmod_st_O/lib/modules/2.4.21-138-smp/kernel/drivers/scs+-317341728/96] 
> (12) [st:__insmod_st_O/lib/modules/2.4.21
> -138-smp/kernel/drivers/scs+-317397595/96] (04) 
> [st:__insmod_st_O/lib/modules/2.4.21-138-smp/kernel/drivers/scs+-317337519/96] 
> (72) [st:__insmod_st_O/lib/modu
> les/2.4.21-138-smp/kernel/drivers/scs+-317394646/96] (28)
> Oct 11 06:15:03 DB2MUHASEBE kernel:   [<c50b3fe0>] (12) [<c50a65a5>] (04) 
> [<c50b5051>] (72) [<c50a712a>] (28)
> Oct 11 06:15:03 DB2MUHASEBE kernel:   
> [st:__insmod_st_O/lib/modules/2.4.21-138-smp/kernel/drivers/scs+-317392482/96] 
> (64) [st:__insmod_st_O/lib/modules/2.4.21
> -138-smp/kernel/drivers/scs+-317392365/96] (24) 
> [st:__insmod_st_O/lib/modules/2.4.21-138-smp/kernel/drivers/scs+-317492411/96] 
> (20) [sys_fsync+152/208] (36)
> Oct 11 06:15:03 DB2MUHASEBE kernel:   [<c50a799e>] (64) [<c50a7a13>] (24) 
> [<c508f345>] (20) [<c0157688>] (36)
> Oct 11 06:15:03 DB2MUHASEBE kernel:   [system_call+51/56] (60)
> Oct 11 06:15:03 DB2MUHASEBE kernel:   [<c01096b7>] (60)
> Oct 11 06:15:03 DB2MUHASEBE kernel: Modules: 
> [(reiserfs:<c5080060>:<c50b71b4>)]
> Oct 11 06:15:03 DB2MUHASEBE kernel: Code: 0f 0b 4e 01 5c 4d 0b c5 85 db 74 0e 
> 0f b7 43 08 89 04 24 e8
> 
> 
> Dmesg shows things like:
> sh-2021: reiserfs_read_super: can not find reiserfs on sd(8,32)
> FAT: bogus logical sector size 0
> VFS: Can't find a valid FAT filesystem on dev 08:20.
> sh-2021: reiserfs_read_super: can not find reiserfs on sd(8,32)
> sh-2021: reiserfs_read_super: can not find reiserfs on sd(8,32)
> 
> And mount now shows:
> mount: wrong fs type, bad option, bad superblock on /dev/sdc,
>        or too many mounted file systems
>        (aren't you trying to mount an extended partition,
>        instead of some logical partition inside?)
> 
> I am now doing a dd_rescue copy of the disk to another disk in the SAN as a 

this is right thing to do

> backup which looks like it is going to take another 20 hours so in the 
> meantime I was hoping someone might have some ideas what caused it, and the 
> best way to recover this partition.
> 
> Any ideas?
> 

can you send us few blocks of /dev/sdc?
dd if=/dev/sdc bs=4096 count=1000 | gzip -c > sdc.head.gz

