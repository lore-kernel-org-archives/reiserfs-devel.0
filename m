From: Julia Wolf <julia@virtadpt.net>
Subject: Re: making reiser4/AMD64 hardlock
Date: Sat, 20 Nov 2004 00:35:09 -0500 (EST)
Message-ID: <Pine.LNX.4.51.0411200018160.5646@leandra.the-lab.virtadpt.net>
References: <1099472359.8158.36.camel@localhost>  <20041103201825.GY30438@hvs.envisage.co.za>
 <1099561964.1492.20.camel@tribesman.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22444-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1099561964.1492.20.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vladimir Saveliev <vs@namesys.com>
Cc: Jake Maciejewski <maciejej@msoe.edu>, reiserfs-list@namesys.com


On Thu, 4 Nov 2004, Vladimir Saveliev wrote:
> Please try to get as much debugging information as you can.
> sysrq+t's output may help to understand the problem. Do you have "File
> systems" -> "Reiser4" -> "Enable reiser4 debug options" -> "Assertions"
> turned on? If no, please turn it, it may also help. Try to catch its
> output, via serial console if it will not be stored in logs.

  With 2.6.10-rc2-mm2 I'm still getting hardlocks on my Athlon XP (a
32-bit K7). I finnaly hooked up a serial console, and the output of a
Sysrq+T is below. Sysrq+T was hit just before the machine locked up.. ata2
is the SATA drive that was being written to at the time. Assertions were
turned on in Reiser4 (as well as all of the other debug option) but
Reiser4 said nothing in the log/console at the time of the lock-up. (It
spews lots of other stuff in normal usage though.)

  I also tried mounting the filesystem syncronously ( -o sync) and with
the filesystem always sync'ing it does *not* lock up.

  I was running mkisofs to make a cd image, reading from /dev/sdd
(reiserfs3) and writing to /dev/sdb (reiser4) it locks up consistantly
after about 400M. But any large write to disk will cause this crash.

SysRq : Show State

                                               sibling
  task             PC      pid father child younger older
init          S C06C7200  4888     1      0     2               (NOTLB)
dff31e74 00000046 dff31e88 c06c7200 dff31e74 00000246 00000000 dff31e50
       c0116236 c06c939c dff31e94 0000238c a67004ad 00000060 dff08a50 dff08bf4
       00013b2f dff31e88 0000000b dff31ed0 c05e094c 00000000 000000d0 de2c5e48
Call Trace:
 [<c05e094c>] schedule_timeout+0x8c/0xe0
 [<c018a802>] do_select+0x232/0x3d0
 [<c018ac63>] sys_select+0x293/0x510
 [<c01039e7>] syscall_call+0x7/0xb
ksoftirqd/0   S 00000000  7292     2      1             3       (L-TLB)
dff33fbc 00000046 c013546e 00000000 c06c8620 00000000 c07bb4e8 0000000a
       dff33f9c c0123b83 00000001 0000024c cff839d5 00000060 dff0ba50 dff0bbf4
       dff32000 dff31f4c 00000000 dff33fc8 c0123d12 dff32000 dff33fec c013a985
Call Trace:
 [<c0123d12>] ksoftirqd+0x72/0x90
 [<c013a985>] kthread+0x95/0xa0
 [<c0101291>] kernel_thread_helper+0x5/0x14
events/0      R running  6912     3      1             4     2 (L-TLB)
khelper       S DFF20F88  7072     4      1             9     3 (L-TLB)
dff63f38 00000046 00000003 dff20f88 00000001 00000003 dff63f38 00000086
       00000246 00000000 00000000 00000862 575eaf6a 0000003b dff21a50 dff21bf4
       dff63f9c dff20f38 dff20f64 dff63fc8 c0133d5b 00000000 00000082 00000000
Call Trace:
 [<c0133d5b>] worker_thread+0x3eb/0x410
 [<c013a985>] kthread+0x95/0xa0
 [<c0101291>] kernel_thread_helper+0x5/0x14
kthread       S DFEBAF88  7148     9      1    17     148     4 (L-TLB)
dff75f38 00000046 00000003 dfebaf88 00000001 00000003 dff75f38 00000086
       00000246 00000000 00000000 00000073 35cc2d61 00000050 dff4ca50 dff4cbf4
       dff75f9c dfebaf38 dfebaf64 dff75fc8 c0133d5b 00000000 00000082 00000000
Call Trace:
 [<c0133d5b>] worker_thread+0x3eb/0x410
 [<c013a985>] kthread+0x95/0xa0
 [<c0101291>] kernel_thread_helper+0x5/0x14
kacpid        S DFED3A50  7836    17      9           135       (L-TLB)
dfef7f38 00000046 dfef6000 dfed3a50 dfef7f38 c012f533 dfed3a50 00000296
       00000246 00000296 c01168c7 000002f8 0b543e50 0000000a dfed3a50 dfed3bf4
       dfef7f9c c1728f38 c1728f64 dfef7fc8 c0133d5b dfef7f74 00000082 00000000
Call Trace:
 [<c0133d5b>] worker_thread+0x3eb/0x410
 [<c013a985>] kthread+0x95/0xa0
 [<c0101291>] kernel_thread_helper+0x5/0x14
kblockd/0     S DF99CF88  7004   135      9           269    17 (L-TLB)
c1769f38 00000046 00000003 df99cf88 00000001 00000003 c1769f38 00000086
       00000246 00000000 0000005e 00000dc4 e04dadde 00000060 c1746a50 c1746bf4
       c1769f9c df99cf38 df99cf64 c1769fc8 c0133d5b 00000000 00000082 00000000
Call Trace:
 [<c0133d5b>] worker_thread+0x3eb/0x410
 [<c013a985>] kthread+0x95/0xa0
 [<c0101291>] kernel_thread_helper+0x5/0x14
khubd         S C048806E  6220   148      1           270     9 (L-TLB)
dfa8bf90 00000046 dfa8bf90 c048806e 00000000 00000000 00000246 00000283
       c011eb85 dfa8bf78 c011e971 000068c6 bf8cf91e 0000000c dfa5ca50 dfa5cbf4
       dfa8bfc0 ffffe000 dfa8a000 dfa8bfec c04884de c067b46c dfa8a000 00000000
Call Trace:
 [<c04884de>] hub_thread+0xbe/0x110
 [<c0101291>] kernel_thread_helper+0x5/0x14
pdflush       S 0000000F  5488   269      9           271   135 (L-TLB)
df44ff70 00000046 c07b60a0 0000000f c07b60a0 c7f60a50 df44ff70 00000282
       df44ff44 35cc3278 00000050 000000b2 35cc345e 00000050 df421a50 df421bf4
       df44ffa8 df44ffb4 df44e000 df44ffa0 c014ffb3 00000000 df44ffc8 c05df659
Call Trace:
 [<c014ffb3>] __pdflush+0x133/0x5f0
 [<c015048e>] pdflush+0x1e/0x20
 [<c013a985>] kthread+0x95/0xa0
 [<c0101291>] kernel_thread_helper+0x5/0x14
aio/0         S DF432A50  7836   271      9           922   269 (L-TLB)
df463f38 00000046 df462000 df432a50 df463f38 c012f533 df432a50 00000296
       00000246 0e6a2e7a 0000000b 000001c8 0e6a2e7a 0000000b df432a50 df432bf4
       df463f9c df431f38 df431f64 df463fc8 c0133d5b df463f74 00000082 00000000
Call Trace:
 [<c0133d5b>] worker_thread+0x3eb/0x410
 [<c013a985>] kthread+0x95/0xa0
 [<c0101291>] kernel_thread_helper+0x5/0x14
kswapd0       D DF451B5C  6444   270      1           867   148 (L-TLB)
df451b60 00000046 00000000 df451b5c 00000096 a26da156 df451b44 c01169da
       c07b60a0 00000000 c1012760 0003651a a301d3bb 00000060 df424a50 df424bf4
       df451c2c df451c34 00000246 df451bbc c05deca2 0000001d d2009edc d2009fcc
Call Trace:
 [<c05deca2>] __down+0x122/0x320
 [<c05df212>] __down_failed+0xa/0x10
 [<c02638fd>] .text.lock.entd+0x15/0x58
 [<c0242dd7>] reiser4_writepage+0x597/0x5e0
 [<c0156e26>] pageout+0x96/0xe0
 [<c0157060>] shrink_list+0x1f0/0x420
 [<c01574a5>] shrink_cache+0x215/0x750
 [<c01585fa>] shrink_zone+0xba/0xe0
 [<c0158a20>] balance_pgdat+0x220/0x2c0
 [<c0158ba1>] kswapd+0xe1/0x100
 [<c0101291>] kernel_thread_helper+0x5/0x14
kseriod       S 00000292  7924   867      1           924   270 (L-TLB)
df609f90 00000046 c01293cd 00000292 df608000 00000000 00000246 df609f90
       c011eb85 df609f78 c011e971 00001187 2b936863 0000000b df54ba50 df54bbf4
       df609fc0 ffffe000 df608000 df609fec c041816e c0676be5 df608000 00000000
Call Trace:
 [<c041816e>] serio_thread+0xbe/0x110
 [<c0101291>] kernel_thread_helper+0x5/0x14
ata/0         S DEBC1F88  7672   922      9          6016   271 (L-TLB)
dea1bf38 00000046 00000003 debc1f88 00000001 00000003 dea1bf38 00000086
       00000246 00000000 dea1bf28 0000a946 7e8d2d2c 0000000c de9cda50 de9cdbf4
       dea1bf9c debc1f38 debc1f64 dea1bfc8 c0133d5b 00000000 00000082 00000000
Call Trace:
 [<c0133d5b>] worker_thread+0x3eb/0x410
 [<c013a985>] kthread+0x95/0xa0
 [<c0101291>] kernel_thread_helper+0x5/0x14
scsi_eh_0     S DFF08A50  7800   924      1           925   867 (L-TLB)
deb9df14 00000046 00000000 dff08a50 dff08a50 21001342 deb9def8 c01169da
       c07b60a0 00000003 c07b60a0 0000056b 210018f3 0000000c debc5a50 debc5bf4
       deb9dfb0 deb9c000 00000246 deb9df70 c05defda 00000086 dff31dc0 00000001
Call Trace:
 [<c05defda>] __down_interruptible+0x13a/0x368
 [<c05df222>] __down_failed_interruptible+0xa/0x10
 [<c04687de>] .text.lock.scsi_error+0x39/0x5b
 [<c0101291>] kernel_thread_helper+0x5/0x14
scsi_eh_1     S DFF08A50  7800   925      1           932   924 (L-TLB)
debfff14 00000046 00000000 dff08a50 dff08a50 21717534 debffef8 c01169da
       c07b60a0 00000003 c07b60a0 0000037c 21717731 0000000c debcfa50 debcfbf4
       debfffb0 debfe000 00000246 debfff70 c05defda 00000086 dff31dc0 00000001
Call Trace:
 [<c05defda>] __down_interruptible+0x13a/0x368
 [<c05df222>] __down_failed_interruptible+0xa/0x10
 [<c04687de>] .text.lock.scsi_error+0x39/0x5b
 [<c0101291>] kernel_thread_helper+0x5/0x14
scsi_eh_2     S DFF08A50  7800   932      1           933   925 (L-TLB)
de411f14 00000046 00000000 dff08a50 dff08a50 51943c0b de411ef8 c01169da
       c07b60a0 00000003 c07b60a0 0000047e 51943f6a 0000000c debdea50 debdebf4
       de411fb0 de410000 00000246 de411f70 c05defda 00000086 dff31dc0 00000001
Call Trace:
 [<c05defda>] __down_interruptible+0x13a/0x368
 [<c05df222>] __down_failed_interruptible+0xa/0x10
 [<c04687de>] .text.lock.scsi_error+0x39/0x5b
 [<c0101291>] kernel_thread_helper+0x5/0x14
scsi_eh_3     S DFF08A50  7800   933      1           983   932 (L-TLB)
de463f14 00000046 00000000 dff08a50 dff08a50 5207e30f de463ef8 c01169da
       c07b60a0 00000003 c07b60a0 0000037e 5207e503 0000000c de436a50 de436bf4
       de463fb0 de462000 00000246 de463f70 c05defda 00000086 dff31dc0 00000001
Call Trace:
 [<c05defda>] __down_interruptible+0x13a/0x368
 [<c05df222>] __down_failed_interruptible+0xa/0x10
 [<c04687de>] .text.lock.scsi_error+0x39/0x5b
 [<c0101291>] kernel_thread_helper+0x5/0x14
kjournald     S DE27ECAC  6516   983      1          1092   933 (L-TLB)
de475f30 00000046 00000003 de27ecac 00000001 00000003 00000246 00000282
       00000000 00000000 d26774d8 00000e2c e1df0a05 00000054 de442a50 de442bf4
       de27ebf8 00000000 00000001 de475fec c02fd254 00000000 00000005 00000000
Call Trace:
 [<c02fd254>] kjournald+0x4b4/0x6a0
 [<c0101291>] kernel_thread_helper+0x5/0x14
devfsd        S C06D1DE8  7012  1092      1          5989   983 (NOTLB)
ddf65ed4 00000046 00000003 c06d1de8 00000001 00000003 ddf65ed4 00000282
       00000000 00000000 c0383a73 00002006 57b1a33b 0000003b ddf32a50 ddf32bf4
       ddf64000 c06d1d80 c06d1de8 ddf65f78 c0317a84 00000000 ddf65f54 ddf65f60
Call Trace:
 [<c0317a84>] devfsd_read+0xd4/0x4c0
 [<c01717cf>] vfs_read+0xbf/0x140
 [<c0171aa1>] sys_read+0x41/0x70
 [<c01039e7>] syscall_call+0x7/0xb
login         S 00000000  6216  5989      1  6007    5990  1092 (NOTLB)
de593f08 00000046 ffffffff 00000000 c011b0d6 de593ef0 ddc2bb48 d9e02f3c
       00000004 d7b4ca50 de593ef8 00001b37 a3863375 00000017 de7f2a50 de7f2bf4
       de7f2b04 00000004 fffffe00 de593f94 c01222b8 de593fc4 c0632c18 00000007
Call Trace:
 [<c01222b8>] do_wait+0x178/0x470
 [<c0122670>] sys_wait4+0x30/0x40
 [<c01226a7>] sys_waitpid+0x27/0x29
 [<c01039e7>] syscall_call+0x7/0xb
agetty        S 000A1E2C  6492  5990      1          5991  5989 (NOTLB)
dddb1e30 00000046 de268718 000a1e2c 00000003 00000001 dddb1e28 de268718
       00000002 dddb1e64 c0381f5e 000051ed 46581b01 00000011 ddc7ba50 ddc7bbf4
       d7c8a000 7fffffff 7fffffff dddb1e8c c05e0997 ddc7ba50 000a0000 00000003
Call Trace:
 [<c05e0997>] schedule_timeout+0xd7/0xe0
 [<c03f79a2>] read_chan+0xc82/0xda0
 [<c03ef448>] tty_read+0xc8/0xe0
 [<c01717cf>] vfs_read+0xbf/0x140
 [<c0171aa1>] sys_read+0x41/0x70
 [<c01039e7>] syscall_call+0x7/0xb
agetty        S 000A7E2C  6956  5991      1          5992  5990 (NOTLB)
ddfa7e30 00000046 dffdf198 000a7e2c 00000003 00000001 ddfa7e28 dffdf198
       00000002 ddfa7e64 c0381f5e 0000ee12 4666f2d4 00000011 ddf7ca50 ddf7cbf4
       d7b0d000 7fffffff 7fffffff ddfa7e8c c05e0997 ddf7ca50 000a0000 00000003
Call Trace:
 [<c05e0997>] schedule_timeout+0xd7/0xe0
 [<c03f79a2>] read_chan+0xc82/0xda0
 [<c03ef448>] tty_read+0xc8/0xe0
 [<c01717cf>] vfs_read+0xbf/0x140
 [<c0171aa1>] sys_read+0x41/0x70
 [<c01039e7>] syscall_call+0x7/0xb
agetty        S 000A1E2C  6956  5992      1          5993  5991 (NOTLB)
db521e30 00000046 dffdfad8 000a1e2c 00000003 00000001 db521e28 dffdfad8
       00000002 db521e64 c0381f5e 0000e20d 466e0342 00000011 db482a50 db482bf4
       d765f000 7fffffff 7fffffff db521e8c c05e0997 db482a50 000a0000 00000003
Call Trace:
 [<c05e0997>] schedule_timeout+0xd7/0xe0
 [<c03f79a2>] read_chan+0xc82/0xda0
 [<c03ef448>] tty_read+0xc8/0xe0
 [<c01717cf>] vfs_read+0xbf/0x140
 [<c0171aa1>] sys_read+0x41/0x70
 [<c01039e7>] syscall_call+0x7/0xb
agetty        S 000A3E2C  6928  5993      1          5994  5992 (NOTLB)
d8b93e30 00000046 dd917bd8 000a3e2c 00000003 00000001 d8b93e28 dd917bd8
       00000002 d8b93e64 c0381f5e 0000e456 467ca467 00000011 ddf96a50 ddf96bf4
       d744d000 7fffffff 7fffffff d8b93e8c c05e0997 ddf96a50 000a0000 00000003
Call Trace:
 [<c05e0997>] schedule_timeout+0xd7/0xe0
 [<c03f79a2>] read_chan+0xc82/0xda0
 [<c03ef448>] tty_read+0xc8/0xe0
 [<c01717cf>] vfs_read+0xbf/0x140
 [<c0171aa1>] sys_read+0x41/0x70
 [<c01039e7>] syscall_call+0x7/0xb
agetty        S 000AFE2C  6892  5994      1          6013  5993 (NOTLB)
d8b9fe30 00000046 dd917d98 000afe2c 00000003 00000001 d8b9fe28 dd917d98
       00000002 d8b9fe64 c0381f5e 0000efce 467581b6 00000011 ddf19a50 ddf19bf4
       d7fc0000 7fffffff 7fffffff d8b9fe8c c05e0997 ddf19a50 000a0000 00000003
Call Trace:
 [<c05e0997>] schedule_timeout+0xd7/0xe0
 [<c03f79a2>] read_chan+0xc82/0xda0
 [<c03ef448>] tty_read+0xc8/0xe0
 [<c01717cf>] vfs_read+0xbf/0x140
 [<c0171aa1>] sys_read+0x41/0x70
 [<c01039e7>] syscall_call+0x7/0xb
bash          S 00000000  6148  6007   5989  6053               (NOTLB)
d6b2df08 00000046 ffffffff 00000000 d2631a50 d6b2df04 161cc000 d3f3b990
       00000006 ddf3e93f 00000043 00004d40 ddf41f0c 00000043 d7b4ca50 d7b4cbf4
       d7b4cb04 00000006 fffffe00 d6b2df94 c01222b8 0000007b d61ccf7c d6b2df24
Call Trace:
 [<c01222b8>] do_wait+0x178/0x470
 [<c0122670>] sys_wait4+0x30/0x40
 [<c01226a7>] sys_waitpid+0x27/0x29
 [<c01039e7>] syscall_call+0x7/0xb
ktxnmgrd:sdb: S C021A790  7620  6013      1          6014  5994 (L-TLB)
d673de6c 00000046 d673de48 c021a790 d673de80 d673de54 d673de6c c020f760
       d673de80 d658df38 d673de80 0000058a e03e6b11 00000060 d61e4a50 d61e4bf4
       d673df30 d673c000 00000246 d673dec8 c05defda 00000000 00000000 00000000
Call Trace:
 [<c05defda>] __down_interruptible+0x13a/0x368
 [<c05df222>] __down_failed_interruptible+0xa/0x10
 [<c02455ef>] .text.lock.kcond+0x22/0x73
 [<c024afd5>] ktxnmgrd+0x2f5/0x670
 [<c0101291>] kernel_thread_helper+0x5/0x14
ent:sdb!      D C042F1AD  4956  6014      1          6047  6013 (L-TLB)
d634db0c 00000046 d634dad4 c042f1ad 00000000 d634db14 c0431d98 de40de0c
       00000202 c043136c de40de0c 002931b1 a1d1faf4 00000060 ddc0ca50 ddc0cbf4
       d046f760 de40de4c 00000000 d634db14 c05e082e d634db70 c0432295 00000001
Call Trace:
 [<c05e082e>] io_schedule+0xe/0x20
 [<c0432295>] get_request_wait+0xa5/0xd0
 [<c04330d5>] __make_request+0x1c5/0x5f0
 [<c0433caa>] generic_make_request+0x21a/0x2d0
 [<c0433db9>] submit_bio+0x59/0xf0
 [<c024191f>] reiser4_submit_bio_helper+0x1f/0x30
 [<c023895a>] write_jnodes_to_disk_extent+0x33a/0x740
 [<c0238e12>] write_jnode_list+0xb2/0x130
 [<c0249d9e>] write_fq+0x13e/0x240
 [<c022c74f>] flush_current_atom+0x78f/0xe80
 [<c021e91e>] flush_some_atom+0x52e/0x9b0
 [<c0262e13>] entd_flush+0x63/0xd0
 [<c0261f24>] entd+0x384/0x870
 [<c0101291>] kernel_thread_helper+0x5/0x14
reiserfs/0    S D25DDA50  7836  6016      9          6054   922 (L-TLB)
d2607f38 00000046 d2606000 d25dda50 d2607f38 c012f533 d25dda50 00000296
       00000246 00000296 c01168c7 000001cf ab2e82bc 00000038 d25dda50 d25ddbf4
       d2607f9c d25dcf38 d25dcf64 d2607fc8 c0133d5b d2607f74 00000082 00000000
Call Trace:
 [<c0133d5b>] worker_thread+0x3eb/0x410
 [<c013a985>] kthread+0x95/0xa0
 [<c0101291>] kernel_thread_helper+0x5/0x14
syslog-ng     R running  6072  6047      1                6014 (NOTLB)
mkisofs       D C042F1AD  4016  6053   6007                     (NOTLB)
d2605494 00000046 d260545c c042f1ad 00000000 d260549c c0431d98 de40de0c
       00000202 e03d81ca 00000060 00088a17 e03e33a5 00000060 d2631a50 d2631bf4
       d046f710 de40de4c 00000000 d260549c c05e082e d26054f8 c0432295 00000001
Call Trace:
 [<c05e082e>] io_schedule+0xe/0x20
 [<c0432295>] get_request_wait+0xa5/0xd0
 [<c04330d5>] __make_request+0x1c5/0x5f0
 [<c0433caa>] generic_make_request+0x21a/0x2d0
 [<c0433db9>] submit_bio+0x59/0xf0
 [<c024191f>] reiser4_submit_bio_helper+0x1f/0x30
 [<c0241d60>] page_io+0x70/0x1b0
 [<c025e2d7>] emergency_flush+0x457/0xc50
 [<c02429fd>] reiser4_writepage+0x1bd/0x5e0
 [<c0156e26>] pageout+0x96/0xe0
 [<c0157060>] shrink_list+0x1f0/0x420
 [<c01574a5>] shrink_cache+0x215/0x750
 [<c01585fa>] shrink_zone+0xba/0xe0
 [<c0158680>] shrink_caches+0x60/0x70
 [<c0158736>] try_to_free_pages+0xa6/0x170
 [<c014e1f9>] __alloc_pages+0x269/0x3a0
 [<c014e352>] __get_free_pages+0x22/0x50
 [<c015148a>] kmem_getpages+0x1a/0xc0
 [<c0152e44>] cache_grow+0x134/0x350
 [<c0153675>] cache_alloc_refill+0x245/0x3a0
 [<c0153d3f>] kmem_cache_alloc+0x6f/0x90
 [<c01eecfe>] jnew_unformatted+0xe/0xf0
 [<c01efd66>] find_get_jnode+0x16/0x120
 [<c02b1101>] extent_write_flow+0x1c1/0x10a0
 [<c02dcb4c>] append_and_or_overwrite+0x38c/0x760
 [<c02dcfad>] write_flow+0x8d/0xe0
 [<c02dd2e1>] write_file+0x91/0x100
 [<c02dd748>] write_unix_file+0x3f8/0x770
 [<c025be5d>] reiser4_write+0x14d/0x3c0
 [<c01719df>] vfs_write+0xbf/0x140
 [<c0171b11>] sys_write+0x41/0x70
 [<c01039e7>] syscall_call+0x7/0xb
pdflush       S 00000400  6444  6054      9                6016 (L-TLB)
cd245f70 00000046 00000000 00000400 00000000 00000000 00000000 00000000
       00000000 00000005 00000286 000008cc b3e50d7e 00000060 c7f60a50 c7f60bf4
       cd245fa8 cd245fb4 cd244000 cd245fa0 c014ffb3 00000000 cd245fc8 c05df659
Call Trace:
 [<c014ffb3>] __pdflush+0x133/0x5f0
 [<c015048e>] pdflush+0x1e/0x20
 [<c013a985>] kthread+0x95/0xa0
 [<c0101291>] kernel_thread_helper+0x5/0x14
ata2: command timeout
