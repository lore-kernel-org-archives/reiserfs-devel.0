From: "Fong Vang" <fvang@corp.zantaz.com>
Subject: RE: File system corruption!
Date: Tue, 24 Feb 2004 16:40:58 -0800
Message-ID: <2A0946C0CB543B4EA5E41C21D97D256E1663AD@zorg.corp.zantaz.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16914-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com

This is a new problem the file system isn't empty in this case but files =
are indeed missing (same setup.  RedHat Linux 7.1, Linux 2.4.20 kernel =
from RedHat, and ReiserFS 3.6.25.  SMP system with 4 GB of RAM, ~1 TB =
storage in RAID-10 configuration).  Although the file system isn't empty =
this time, we are loosing file (our application transaction log says =
file write completed fro last 7 files, but only four files show up in =
the ReiserFS file system).

At the time of the problem, this was logged to the messages file:

Feb 23 19:24:57 sc19-172-15 kernel: 3w-xxxx: scsi0: PCI Abort: clearing.
Feb 23 19:26:02 sc19-172-15 kernel: 3w-xxxx: scsi0: Unit #0: Command =
(f73bd800) timed out, resetting card.
Feb 23 19:26:04 sc19-172-15 kernel: 3w-xxxx: PCI Abort: clearing.
Feb 23 19:27:03 sc19-172-15 kernel: 3w-xxxx: scsi0: Unit #0: Command =
(f73bd800) timed out, resetting card.
Feb 23 19:27:05 sc19-172-15 kernel: 3w-xxxx: PCI Abort: clearing.
Feb 23 19:28:04 sc19-172-15 kernel: 3w-xxxx: scsi0: Unit #0: Command =
(f73b8a00) timed out, resetting card.
Feb 23 19:28:06 sc19-172-15 kernel: 3w-xxxx: PCI Abort: clearing.
Feb 23 19:29:05 sc19-172-15 kernel: 3w-xxxx: scsi0: Unit #0: Command =
(f73c5e00) timed out, resetting card.
Feb 23 19:29:07 sc19-172-15 kernel: 3w-xxxx: PCI Abort: clearing.
Feb 23 19:30:06 sc19-172-15 kernel: 3w-xxxx: scsi0: Unit #0: Command =
(f73c1000) timed out, resetting card.
Feb 23 19:30:38 sc19-172-15 kernel: 3w-xxxx: scsi0: AEN drain failed, =
retrying.
Feb 23 19:30:49 sc19-172-15 kernel: 3w-xxxx: PCI Abort: clearing.
Feb 23 19:31:49 sc19-172-15 kernel: 3w-xxxx: scsi0: Unit #0: Command =
(f73aaa00) timed out, resetting card.
Feb 23 19:32:21 sc19-172-15 kernel: 3w-xxxx: scsi0: AEN drain failed, =
retrying.
Feb 23 19:32:21 sc19-172-15 kernel: 3w-xxxx: PCI Abort: clearing.
Feb 23 19:33:21 sc19-172-15 kernel: 3w-xxxx: scsi0: Unit #0: Command =
(f73aac00) timed out, resetting card.
Feb 23 19:33:53 sc19-172-15 kernel: 3w-xxxx: scsi0: AEN drain failed, =
retrying.
Feb 23 19:34:03 sc19-172-15 kernel: 3w-xxxx: PCI Abort: clearing.
Feb 23 19:35:03 sc19-172-15 kernel: 3w-xxxx: scsi0: Unit #0: Command =
(f73adc00) timed out, resetting card.
Feb 23 19:35:35 sc19-172-15 kernel: 3w-xxxx: scsi0: AEN drain failed, =
retrying.
Feb 23 19:35:36 sc19-172-15 kernel: 3w-xxxx: PCI Abort: clearing.
Feb 23 19:36:35 sc19-172-15 kernel: 3w-xxxx: scsi0: Unit #0: Command =
(f73b4800) timed out, resetting card.
Feb 23 19:36:36 sc19-172-15 kernel: 3w-xxxx: PCI Abort: clearing.
Feb 23 19:37:36 sc19-172-15 kernel: 3w-xxxx: scsi0: Unit #0: Command =
(f73c7a00) timed out, resetting card.
Feb 23 19:38:08 sc19-172-15 kernel: 3w-xxxx: scsi0: AEN drain failed, =
retrying.
Feb 23 19:38:19 sc19-172-15 kernel: 3w-xxxx: PCI Abort: clearing.
Feb 23 19:38:20 sc19-172-15 kernel: 3w-xxxx: PCI Abort: clearing.
Feb 23 19:38:22 sc19-172-15 kernel: 3w-xxxx: scsi0: Reset succeeded.
Feb 23 19:39:31 sc19-172-15 kernel: 3w-xxxx: scsi0: Unit #0: Command =
(f73b8a00) timed out, resetting card.
Feb 23 19:40:00 sc19-172-15 kernel: 3w-xxxx: PCI Abort: clearing.
Feb 23 19:40:00 sc19-172-15 kernel: scsi: device set offline - not ready =
or command retry failed after host reset: host 0 channel 0 id 0 lun 0
Feb 23 19:41:00 sc19-172-15 kernel: 3w-xxxx: scsi0: Unit #0: Command =
(f73c5e00) timed out, resetting card.
Feb 23 19:41:03 sc19-172-15 kernel: 3w-xxxx: PCI Abort: clearing.
Feb 23 19:41:03 sc19-172-15 kernel: scsi: device set offline - not ready =
or command retry failed after host reset: host 0 channel 0 id 0 lun 0
Feb 23 19:42:02 sc19-172-15 kernel: 3w-xxxx: scsi0: Unit #0: Command =
(f73c1000) timed out, resetting card.
Feb 23 19:42:34 sc19-172-15 kernel: 3w-xxxx: scsi0: AEN drain failed, =
retrying.
Feb 23 19:42:34 sc19-172-15 kernel: 3w-xxxx: PCI Abort: clearing.
Feb 23 19:42:34 sc19-172-15 kernel: scsi: device set offline - not ready =
or command retry failed after host reset: host 0 channel 0 id 0 lun 0
Feb 23 19:43:34 sc19-172-15 kernel: 3w-xxxx: scsi0: Unit #0: Command =
(f73aaa00) timed out, resetting card.
Feb 23 19:44:06 sc19-172-15 kernel: 3w-xxxx: scsi0: AEN drain failed, =
retrying.
Feb 23 19:44:16 sc19-172-15 kernel: 3w-xxxx: PCI Abort: clearing.
Feb 23 19:44:16 sc19-172-15 kernel: scsi: device set offline - not ready =
or command retry failed after host reset: host 0 channel 0 id 0 lun 0
Feb 23 19:45:16 sc19-172-15 kernel: 3w-xxxx: scsi0: Unit #0: Command =
(f73aac00) timed out, resetting card.
Feb 23 19:45:59 sc19-172-15 kernel: 3w-xxxx: scsi0: AEN drain failed, =
retrying.
Feb 23 19:45:59 sc19-172-15 kernel: 3w-xxxx: PCI Abort: clearing.
Feb 23 19:45:59 sc19-172-15 kernel: scsi: device set offline - not ready =
or command retry failed after host reset: host 0 channel 0 id 0 lun 0
Feb 23 19:46:59 sc19-172-15 kernel: 3w-xxxx: scsi0: Unit #0: Command =
(f73adc00) timed out, resetting card.
Feb 23 19:47:31 sc19-172-15 kernel: 3w-xxxx: scsi0: AEN drain failed, =
retrying.
Feb 23 19:47:42 sc19-172-15 kernel: 3w-xxxx: PCI Abort: clearing.
Feb 23 19:47:42 sc19-172-15 kernel: scsi: device set offline - not ready =
or command retry failed after host reset: host 0 channel 0 id 0 lun 0
Feb 23 19:48:42 sc19-172-15 kernel: 3w-xxxx: scsi0: Unit #0: Command =
(f73b4800) timed out, resetting card.
Feb 23 19:49:14 sc19-172-15 kernel: 3w-xxxx: scsi0: AEN drain failed, =
retrying.
Feb 23 19:49:14 sc19-172-15 kernel: 3w-xxxx: PCI Abort: clearing.
Feb 23 19:49:14 sc19-172-15 kernel: scsi: device set offline - not ready =
or command retry failed after host reset: host 0 channel 0 id 0 lun 0
Feb 23 19:50:14 sc19-172-15 kernel: 3w-xxxx: scsi0: Unit #0: Command =
(f73c7a00) timed out, resetting card.
Feb 23 19:50:24 sc19-172-15 kernel: 3w-xxxx: PCI Abort: clearing.
Feb 23 19:50:23 sc19-172-15 kernel: scsi: device set offline - not ready =
or command retry failed after host reset: host 0 channel 0 id 0 lun 0
Feb 23 19:50:22 sc19-172-15 kernel:  I/O error: dev 08:01, sector =
61386880
Feb 23 19:50:22 sc19-172-15 kernel:  I/O error: dev 08:01, sector =
61388608
Feb 23 19:50:22 sc19-172-15 kernel:  I/O error: dev 08:01, sector =
61388024
Feb 23 19:50:22 sc19-172-15 kernel:  I/O error: dev 08:01, sector =
61388432
Feb 23 19:50:22 sc19-172-15 kernel:  I/O error: dev 08:01, sector =
61388864
Feb 23 19:50:22 sc19-172-15 kernel:  I/O error: dev 08:01, sector =
61390544
Feb 23 19:50:22 sc19-172-15 kernel:  I/O error: dev 08:01, sector =
61389904
Feb 23 19:50:22 sc19-172-15 kernel:  I/O error: dev 08:01, sector =
61390832
Feb 23 19:50:22 sc19-172-15 kernel:  I/O error: dev 08:01, sector 65656
Feb 23 19:50:22 sc19-172-15 kernel: journal-615: buffer write failed
Feb 23 19:50:23 sc19-172-15 kernel: ------------[ cut here ]------------
Feb 23 19:50:23 sc19-172-15 kernel: kernel BUG at prints.c:334!
Feb 23 19:50:23 sc19-172-15 kernel: invalid operand: 0000
Feb 23 19:50:23 sc19-172-15 kernel: eepro100 mii ipchains reiserfs =
3w-xxxx sd_mod scsi_mod =20
Feb 23 19:50:23 sc19-172-15 kernel: CPU:    2
Feb 23 19:50:23 sc19-172-15 kernel: EIP:    =
0010:[eepro100:__insmod_eepro100_O/lib/modules/2.4.20-20.7smp/kernel/driv=
e+-4188935/96]    Not tainted
Feb 23 19:50:23 sc19-172-15 kernel: EIP:    0010:[<f88cd4f9>]    Not =
tainted
Feb 23 19:50:23 sc19-172-15 kernel: EFLAGS: 00010292
Feb 23 19:50:23 sc19-172-15 kernel:=20
Feb 23 19:50:23 sc19-172-15 kernel: EIP is at reiserfs_panic [reiserfs] =
0x29 (2.4.20-20.7smp)
Feb 23 19:50:23 sc19-172-15 kernel: eax: 00000024   ebx: f88e2520   ecx: =
00000096   edx: 00000001
Feb 23 19:50:23 sc19-172-15 kernel: esi: c48f5400   edi: d10975e0   ebp: =
c48f5400   esp: c60dbe2c
Feb 23 19:50:23 sc19-172-15 kernel: ds: 0018   es: 0018   ss: 0018
Feb 23 19:50:23 sc19-172-15 kernel: Process kupdated (pid: 10, =
stackpage=3Dc60db000)
Feb 23 19:50:23 sc19-172-15 kernel: Stack: f88e5076 f88e5e40 f88e2520 =
c60dbe50 f8bc2378 0000002b f88d7dae c48f5400=20
Feb 23 19:50:23 sc19-172-15 kernel:        f88e2520 c60da000 0000002c =
00000000 00000040 d10975e0 c60dbe64 c60dbe64=20
Feb 23 19:50:23 sc19-172-15 kernel:        ef6a17c0 c48f5400 ef6a17c0 =
00000001 c60dbf60 c48f5400 ef5ab9a0 ef6a17c0=20
Feb 23 19:50:23 sc19-172-15 kernel: Call Trace:   =
[eepro100:__insmod_eepro100_O/lib/modules/2.4.20-20.7smp/kernel/drive+-40=
91786/96] .rodata.str1.1 [reiserfs] 0x5b6 (0xc60dbe2c))
Feb 23 19:50:23 sc19-172-15 kernel: Call Trace:   [<f88e5076>] =
rodata.str1.1 [reiserfs] 0x5b6 (0xc60dbe2c))
Feb 23 19:50:23 sc19-172-15 kernel: =
[eepro100:__insmod_eepro100_O/lib/modules/2.4.20-20.7smp/kernel/drive+-40=
88256/96] error_buf [reiserfs] 0x0 (0xc60dbe30))
Feb 23 19:50:23 sc19-172-15 kernel: [<f88e5e40>] error_buf [reiserfs] =
0x0 (0xc60dbe30))
Feb 23 19:50:23 sc19-172-15 kernel: =
[eepro100:__insmod_eepro100_O/lib/modules/2.4.20-20.7smp/kernel/drive+-41=
02880/96] .rodata.str1.32 [reiserfs] 0x4000 (0xc60dbe34))
Feb 23 19:50:23 sc19-172-15 kernel: [<f88e2520>] .rodata.str1.32 =
[reiserfs] 0x4000 (0xc60dbe34))
Feb 23 19:50:23 sc19-172-15 kernel: =
[eepro100:__insmod_eepro100_O/lib/modules/2.4.20-20.7smp/kernel/drive+-41=
45746/96] flush_commit_list [reiserfs] 0x38e (0xc60dbe44))
Feb 23 19:50:23 sc19-172-15 kernel: [<f88d7dae>] flush_commit_list =
[reiserfs] 0x38e (0xc60dbe44))
Feb 23 19:50:23 sc19-172-15 kernel: =
[eepro100:__insmod_eepro100_O/lib/modules/2.4.20-20.7smp/kernel/drive+-41=
02880/96] .rodata.str1.32 [reiserfs] 0x4000 (0xc60dbe4c))
Feb 23 19:50:23 sc19-172-15 kernel: [<f88e2520>] .rodata.str1.32 =
[reiserfs] 0x4000 (0xc60dbe4c))
Feb 23 19:50:23 sc19-172-15 kernel: [getblk+56/128] getblk [kernel] 0x38 =
(0xc60dbea0))
Feb 23 19:50:23 sc19-172-15 kernel: [<c0148558>] getblk [kernel] 0x38 =
(0xc60dbea0))
Feb 23 19:50:23 sc19-172-15 kernel: [getblk+73/128] getblk [kernel] 0x49 =
(0xc60dbeac))
Feb 23 19:50:23 sc19-172-15 kernel: [<c0148569>] getblk [kernel] 0x49 =
(0xc60dbeac))
Feb 23 19:50:23 sc19-172-15 kernel: =
[eepro100:__insmod_eepro100_O/lib/modules/2.4.20-20.7smp/kernel/drive+-41=
30397/96] do_journal_end [reiserfs] 0x843 (0xc60dbec4))
Feb 23 19:50:23 sc19-172-15 kernel: [<f88db9a3>] do_journal_end =
[reiserfs] 0x843 (0xc60dbec4))
Feb 23 19:50:23 sc19-172-15 kernel: [__ide_do_rw_disk+952/1488] =
__ide_do_rw_disk [kernel] 0x3b8 (0xc60dbf10))
Feb 23 19:50:23 sc19-172-15 kernel: [<c01c0518>] __ide_do_rw_disk =
[kernel] 0x3b8 (0xc60dbf10))
Feb 23 19:50:23 sc19-172-15 kernel: =
[eepro100:__insmod_eepro100_O/lib/modules/2.4.20-20.7smp/kernel/drive+-41=
34110/96] flush_old_commits [reiserfs] 0x142 (0xc60dbf34))
Feb 23 19:50:23 sc19-172-15 kernel: [<f88dab22>] flush_old_commits =
[reiserfs] 0x142 (0xc60dbf34))
Feb 23 19:50:23 sc19-172-15 kernel: =
[eepro100:__insmod_eepro100_O/lib/modules/2.4.20-20.7smp/kernel/drive+-41=
34096/96] flush_old_commits [reiserfs] 0x150 (0xc60dbf48))
Feb 23 19:50:23 sc19-172-15 kernel: [<f88dab30>] flush_old_commits =
[reiserfs] 0x150 (0xc60dbf48))
Feb 23 19:50:23 sc19-172-15 kernel: =
[eepro100:__insmod_eepro100_O/lib/modules/2.4.20-20.7smp/kernel/drive+-40=
90894/96] .LC36 [reiserfs] 0x22 (0xc60dbf60))
Feb 23 19:50:23 sc19-172-15 kernel: [<f88e53f2>] .LC36 [reiserfs] 0x22 =
(0xc60dbf60))
Feb 23 19:50:23 sc19-172-15 kernel: =
[eepro100:__insmod_eepro100_O/lib/modules/2.4.20-20.7smp/kernel/drive+-41=
99883/96] reiserfs_write_super [reiserfs] 0x35 (0xc60dbf90))
Feb 23 19:50:23 sc19-172-15 kernel: [<f88caa35>] reiserfs_write_super =
[reiserfs] 0x35 (0xc60dbf90))
Feb 23 19:50:23 sc19-172-15 kernel: [sync_supers+232/320] sync_supers =
[kernel] 0xe8 (0xc60dbfa4))
Feb 23 19:50:23 sc19-172-15 kernel: [<c014bd38>] sync_supers [kernel] =
0xe8 (0xc60dbfa4))
Feb 23 19:50:23 sc19-172-15 kernel: [sync_old_buffers+49/160] =
sync_old_buffers [kernel] 0x31 (0xc60dbfb4))
Feb 23 19:50:23 sc19-172-15 kernel: [<c014ad31>] sync_old_buffers =
[kernel] 0x31 (0xc60dbfb4))
Feb 23 19:50:23 sc19-172-15 kernel: [kupdate+264/304] kupdate [kernel] =
0x108 (0xc60dbfc8))
Feb 23 19:50:23 sc19-172-15 kernel: [<c014b0c8>] kupdate [kernel] 0x108 =
(0xc60dbfc8))
Feb 23 19:50:23 sc19-172-15 kernel: [_stext+0/80] stext [kernel] 0x0 =
(0xc60dbfd4))
Feb 23 19:50:23 sc19-172-15 kernel: [<c0105000>] stext [kernel] 0x0 =
(0xc60dbfd4))
Feb 23 19:50:23 sc19-172-15 kernel: [_stext+0/80] stext [kernel] 0x0 =
(0xc60dbfe8))
Feb 23 19:50:23 sc19-172-15 kernel: [<c0105000>] stext [kernel] 0x0 =
(0xc60dbfe8))
Feb 23 19:50:23 sc19-172-15 kernel: [arch_kernel_thread+38/48] =
arch_kernel_thread [kernel] 0x26 (0xc60dbff0))
Feb 23 19:50:23 sc19-172-15 kernel: [<c0107266>] arch_kernel_thread =
[kernel] 0x26 (0xc60dbff0))
Feb 23 19:50:23 sc19-172-15 kernel: [kupdate+0/304] kupdate [kernel] 0x0 =
(0xc60dbff8))
Feb 23 19:50:23 sc19-172-15 kernel: [<c014afc0>] kupdate [kernel] 0x0 =
(0xc60dbff8))
Feb 23 19:50:23 sc19-172-15 kernel:=20
Feb 23 19:50:23 sc19-172-15 kernel:=20
Feb 23 19:50:23 sc19-172-15 kernel: Code: 0f 0b 4e 01 7c 50 8e f8 68 40 =
5e 8e f8 85 f6 74 0d 0f b7 46=20
Feb 23 19:55:42 sc19-172-15 -- MARK --
..
..
..
Feb 23 23:34:28 sc19-172-15 kernel:   I/O error: dev 08:01, sector =
61392784
Feb 23 23:34:28 sc19-172-15 kernel:  I/O error: dev 08:01, sector =
61392888
Feb 23 23:34:28 sc19-172-15 kernel:  I/O error: dev 08:01, sector =
61393128
Feb 23 23:34:28 sc19-172-15 kernel:  I/O error: dev 08:01, sector =
61393264
Feb 23 23:34:28 sc19-172-15 kernel:  I/O error: dev 08:01, sector =
61393272
Feb 23 23:34:28 sc19-172-15 kernel:  I/O error: dev 08:01, sector =
61393528
Feb 23 23:34:28 sc19-172-15 kernel:  I/O error: dev 08:01, sector =
61393768
Feb 23 23:34:28 sc19-172-15 kernel:  I/O error: dev 08:01, sector =
61393776
Feb 23 23:34:28 sc19-172-15 kernel:  I/O error: dev 08:01, sector =
61394032
..
..
..

My people recorded the output of debugreiserfs but we made a mistake of =
not including stderr which is the output channel most info is written =
out to by debugreiserfs.  Will have that information next time.  Just =
today, we have two systems exhibiting this same problem.



-----Original Message-----
From: Vladimir Saveliev [mailto:vs@namesys.com]
Sent: Friday, February 20, 2004 5:55 AM
To: Fong Vang
Cc: 'reiserfs-list@namesys.com'
Subject: Re: File system corruption!


Hi

On Fri, 2004-02-20 at 04:33, Fong Vang wrote:
> Currently, we have a couple of hundred systems with this configuration =
(per
> server):
>=20
> * RedHat Linux 7.1
> * Linux 2.4.20 kernel (from RedHat).  ReiserFS version 3.6.25
> * Dual Xeon processors on SuperMicro motherboards
> * 4 GB of RAM
> * ~1 TB of storage allocated to ReiserFS (8 drives in RAID-10 =
configuration)
>=20
> Although most of the systems are performing without hiccups, we've had =
2-3
> systems loosing the ~1TB ReiserFS file system after a reboot.  3ware =
reports
> all drives are performing optimally.  Mounting the ~1TB ReiserFS file =
system
> is successful but the file system is blank (the actual file system is =
empty,
> not the mount point).  Anyone has any idea how this could happen?
>=20
> I'm just wondering how many places ReiserFS store the meta data =
(superinode,
> inode, etc.)?
>=20
reiserfs may store its metadata spread over whole filesystem.

> Any help is appreciated.
>=20

can you please run: debugreiserfs -m /dev/emptiedfilesystem and send us
its output?



This e-mail has been captured and archived by the ZANTAZ Digital =
Safe(tm) service. For more information, visit us at www.zantaz.com. =
IMPORTANT: This electronic mail message is intended only for the use of =
the individual or entity to which it is addressed and may contain =
information that is privileged, confidential or exempt from disclosure =
under applicable law. If the reader of this message is not the intended =
recipient, or the employee or agent responsible for delivering this =
message to the intended recipient, you are hereby notified that any =
dissemination, distribution or copying of this communication is strictly =
prohibited. If you have received this communication in error, please =
notify the sender immediately by telephone or directly reply to the =
original message(s) sent. Thank you.
