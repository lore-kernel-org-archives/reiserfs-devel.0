From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: umount bug?
Date: Thu, 24 Mar 2005 19:36:11 +0300
Message-ID: <1111682170.3084.22.camel@tribesman.namesys.com>
References: <4241B21B.9070404@cpc.wmin.ac.uk>
	 <1111603872.11275.7.camel@gentoo>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-gl0jdw6mp0LpdAQMXzhO"
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1111603872.11275.7.camel@gentoo>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Jake Maciejewski <maciejej@msoe.edu>
Cc: reiserfs-list@namesys.com

--=-gl0jdw6mp0LpdAQMXzhO
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello

On Wed, 2005-03-23 at 21:51, Jake Maciejewski wrote:
> I also have umount problems with the new 2.6.11 patch. I applied it to
> 2.6.11.4, and would get oopses umounting:
> 

The attached should help against umount problem on 2.6.11 +
ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.11/reiser4-for-2.6.11-1.gz



> Unable to handle kernel paging request at 0000000000100108 RIP:
> <ffffffff8017eb1b>{invalidate_inodes+187}
> PGD 1bfbe067 PUD 1b951067 PMD 0
> Oops: 0002 [1]
> CPU 0
> Modules linked in: ipv6 i2c_dev it87 i2c_sensor i2c_isa i2c_core ipt_state ip_co nntrack iptable_filter ip_tables 3c59x mii e1000 ehci_hcd ohci_hcd
> Pid: 10528, comm: umount Not tainted 2.6.11.4
> RIP: 0010:[<ffffffff8017eb1b>] <ffffffff8017eb1b>{invalidate_inodes+187}
> RSP: 0018:ffff81001cb4be28  EFLAGS: 00010206
> RAX: 0000000000100100 RBX: ffff81001d29aa68 RCX: ffff81001d29aa68
> RDX: ffff81001f7c90c8 RSI: 0000000000000005 RDI: ffff81001d29aa48
> RBP: ffff81001d29aa48 R08: 0000000000000018 R09: 0000000001000000
> R10: 0000000000000040 R11: ffff81001bd15318 R12: 0000000000100100
> R13: ffff81001cb4be38 R14: 0000000000000005 R15: ffff81001f7c90c8
> FS:  00002aaaaaff16d0(0000) GS:ffffffff80410700(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
> CR2: 0000000000100108 CR3: 000000001c7cc000 CR4: 00000000000006e0
> Process umount (pid: 10528, threadinfo ffff81001cb4a000, task ffff81001e486fd0)
> Stack: 0000000000000000 000000001e989600 ffff81001d29ad98 ffff81001bd2dc98
>        ffff81001cb4bee8 ffff81001f7c9000 ffff81001f7c9090 ffff81001f1522c8
>        ffff81001cb4bee8 ffff81001f7c9000
> Call Trace:<ffffffff8016c92a>{generic_shutdown_super+106} <ffffffff8016d50d>{kil l_block_super+45}
>        <ffffffff8016c88b>{deactivate_super+59} <ffffffff801813b8>{sys_umount+520 }
>        <ffffffff8010dab5>{error_exit+0} <ffffffff8010d1ea>{system_call+126}
> 
> 
> Code: 48 89 50 08 48 89 02 48 8d 55 10 48 c7 41 08 00 02 20 00 48
> RIP <ffffffff8017eb1b>{invalidate_inodes+187} RSP <ffff81001cb4be28>
> CR2: 0000000000100108
> 
> 
> 
> The same filesystem I tried to umount above came up dirty when I fscked
> it. After --fix, however, it was clean. See attached logs. The following
> messages are from a filesystem that remained clean despite the umount
> oops.
> 
> 
> 
> Unable to handle kernel paging request at 0000000000100108 RIP:
> <ffffffff8017eb1b>{invalidate_inodes+187}
> PGD 1be52067 PUD 1bd73067 PMD 0
> Oops: 0002 [1]
> CPU 0
> Modules linked in: ipv6 i2c_dev it87 i2c_sensor i2c_isa i2c_core ipt_state ip_conntrack iptable_filter ip_tables 3c59x mii e1000 ehci_hcd ohci_hcd
> Pid: 10925, comm: umount Not tainted 2.6.11.4
> RIP: 0010:[<ffffffff8017eb1b>] <ffffffff8017eb1b>{invalidate_inodes+187}
> RSP: 0018:ffff81001ce07e28  EFLAGS: 00010202
> RAX: 0000000000100100 RBX: ffff81001ec50c68 RCX: ffff81001ec50c68
> RDX: 0000000000200200 RSI: ffff81001ec504c0 RDI: ffff81001ec50c48
> RBP: ffff81001ec50c48 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000006 R11: ffffffff801b3540 R12: 0000000000100100
> R13: ffff81001ce07e38 R14: 0000000000000002 R15: ffff81001fcec4c8
> FS:  00002aaaaaff16d0(0000) GS:ffffffff80410700(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
> CR2: 0000000000100108 CR3: 000000001c8ea000 CR4: 00000000000006e0
> Process umount (pid: 10925, threadinfo ffff81001ce06000, task ffff81001f314ac0)
> Stack: 0000000000000000 000000001ce07d88 ffff81001ec50c58 ffff81001ec50c58
>        0000000000000000 ffff81001fcec400 ffff81001fcec490 ffff81001f32a2c8
>        ffff81001ce07ee8 ffff81001fcec400
> Call Trace:<ffffffff8016c95a>{generic_shutdown_super+154} <ffffffff8016d50d>{kill_block_super+45}
>        <ffffffff8016c88b>{deactivate_super+59} <ffffffff801813b8>{sys_umount+520}
>        <ffffffff8010dab5>{error_exit+0} <ffffffff8010d1ea>{system_call+126}
> 
> 
> Code: 48 89 50 08 48 89 02 48 8d 55 10 48 c7 41 08 00 02 20 00 48
> RIP <ffffffff8017eb1b>{invalidate_inodes+187} RSP <ffff81001ce07e28>
> CR2: 0000000000100108
> 
> 
> On Wed, 2005-03-23 at 18:14 +0000, Szabolcs Illes wrote:
> > Hi,
> > 
> > When I tried to umount my reiserfs4 partition I got this error message 
> > in the kernel log:
> > 
> > Mar 23 16:47:21 project1 kernel: Unable to handle kernel paging request 
> > at virtual address 00100104
> > Mar 23 16:47:21 project1 kernel:  printing eip:
> > Mar 23 16:47:21 project1 kernel: c016f676
> > Mar 23 16:47:21 project1 kernel: *pde = 00000000
> > Mar 23 16:47:21 project1 kernel: Oops: 0002 [#1]
> > Mar 23 16:47:21 project1 kernel: PREEMPT
> > Mar 23 16:47:21 project1 kernel: Modules linked in: snd_pcm_oss 
> > snd_mixer_oss intel_agp snd_intel8x0 snd_ac97_codec snd_pcm
> > snd_timer snd soundcore snd_page_alloc e1000 agpgart
> > Mar 23 16:47:21 project1 kernel: CPU:    0
> > Mar 23 16:47:21 project1 kernel: EIP:    0060:[<c016f676>]    Not 
> > tainted VLI
> > Mar 23 16:47:21 project1 kernel: EFLAGS: 00010246   (2.6.11)
> > Mar 23 16:47:21 project1 kernel: EIP is at invalidate_list+0x76/0xe0
> > Mar 23 16:47:21 project1 kernel: eax: 00100100   ebx: df8b1630   ecx: 
> > df8b1640   edx: 00200200
> > Mar 23 16:47:21 project1 kernel: esi: df8b1640   edi: 00100100   ebp: 
> > d5991f14   esp: d5991eec
> > Mar 23 16:47:21 project1 kernel: ds: 007b   es: 007b   ss: 0068
> > Mar 23 16:47:21 project1 kernel: Process umount (pid: 2387, 
> > threadinfo=d5990000 task=dec07020)
> > Mar 23 16:47:21 project1 kernel: Stack: df8b1630 00000001 00000000 
> > d5991f14 df2546b4 dfd201f4 d5990000 c016f720
> > Mar 23 16:47:21 project1 kernel:        df6f1c74 d5991f14 df8b1638 
> > df8b1638 df6f1c00 df2546b4 c015b256 df6f1c00
> > Mar 23 16:47:21 project1 kernel:        df6f1c00 dfe61280 00000000 
> > c015bf6e df6f1c00 00000005 df6f1c00 c034c0e0
> > Mar 23 16:47:21 project1 kernel: Call Trace:
> > Mar 23 16:47:21 project1 kernel:  [<c016f720>] invalidate_inodes+0x40/0x90
> > Mar 23 16:47:21 project1 kernel:  [<c015b256>] 
> > generic_shutdown_super+0x86/0x140
> > Mar 23 16:47:21 project1 kernel:  [<c015bf6e>] kill_block_super+0x2e/0x60
> > Mar 23 16:47:21 project1 kernel:  [<c015b0ae>] deactivate_super+0x6e/0xa0
> > Mar 23 16:47:21 project1 kernel:  [<c017295f>] sys_umount+0x3f/0xa0
> > Mar 23 16:47:21 project1 kernel:  [<c014939d>] do_munmap+0x13d/0x180
> > Mar 23 16:47:21 project1 kernel:  [<c0149424>] sys_munmap+0x44/0x70
> > Mar 23 16:47:21 project1 kernel:  [<c01729d5>] sys_oldumount+0x15/0x20
> > Mar 23 16:47:21 project1 kernel:  [<c01031cf>] syscall_call+0x7/0xb
> > Mar 23 16:47:21 project1 kernel: Code: 6a 8b 53 04 85 d2 74 1a 8b 46 f0 
> > 85 c0 89 02 74 03 89 50 04 c7 46 f0 00 00 00 00 c7 4
> > 3 04 00 00 00 00 8d 4b 10 8b 43 10 8b 51 04 <89> 50 04 89 02 8d 53 08 8b 
> > 43 08 c7 41 04 00 02 20 00 8b 4a 04
> > Mar 23 16:47:21 project1 kernel:  <6>note: umount[2387] exited with 
> > preempt_count 1
> > Mar 23 16:47:21 project1 kernel: scheduling while atomic: 
> > umount/0x10000001/2387
> > Mar 23 16:47:21 project1 kernel:  [<c02fc812>] schedule+0x522/0x530
> > Mar 23 16:47:21 project1 kernel:  [<c014477e>] unmap_page_range+0x7e/0xa0
> > Mar 23 16:47:21 project1 kernel:  [<c02fd0aa>] cond_resched+0x2a/0x50
> > Mar 23 16:47:21 project1 kernel:  [<c0144950>] unmap_vmas+0x1b0/0x210
> > Mar 23 16:47:21 project1 kernel:  [<c014974c>] exit_mmap+0x7c/0x170
> > Mar 23 16:47:21 project1 kernel:  [<c01143e7>] mmput+0x37/0xb0
> > Mar 23 16:47:21 project1 kernel:  [<c0118d53>] do_exit+0x93/0x3b0
> > Mar 23 16:47:21 project1 kernel:  [<c0103b2b>] die+0x18b/0x190
> > Mar 23 16:47:21 project1 kernel:  [<c0116b97>] printk+0x17/0x20
> > Mar 23 16:47:21 project1 kernel:  [<c011117a>] do_page_fault+0x2da/0x5d5
> > Mar 23 16:47:21 project1 kernel:  [<c01ae6e8>] 
> > reiser4_destroy_inode+0x48/0xa0
> > Mar 23 16:47:21 project1 kernel:  [<c016f2e5>] destroy_inode+0x35/0x60
> > Mar 23 16:47:21 project1 kernel:  [<c018f055>] preempt_point+0x5/0x20
> > Mar 23 16:47:21 project1 kernel:  [<c01af88d>] reiser4_put_super+0x8d/0xb0
> > Mar 23 16:47:21 project1 kernel:  [<c0110ea0>] do_page_fault+0x0/0x5d5
> > Mar 23 16:47:21 project1 kernel:  [<c0103377>] error_code+0x2b/0x30
> > Mar 23 16:47:21 project1 kernel:  [<c016f676>] invalidate_list+0x76/0xe0
> > Mar 23 16:47:21 project1 kernel:  [<c016f720>] invalidate_inodes+0x40/0x90
> > Mar 23 16:47:21 project1 kernel:  [<c015b256>] 
> > generic_shutdown_super+0x86/0x140
> > Mar 23 16:47:21 project1 kernel:  [<c015bf6e>] kill_block_super+0x2e/0x60
> > Mar 23 16:47:21 project1 kernel:  [<c015b0ae>] deactivate_super+0x6e/0xa0
> > Mar 23 16:47:21 project1 kernel:  [<c017295f>] sys_umount+0x3f/0xa0
> > Mar 23 16:47:21 project1 kernel:  [<c014939d>] do_munmap+0x13d/0x180
> > Mar 23 16:47:21 project1 kernel:  [<c0149424>] sys_munmap+0x44/0x70
> > Mar 23 16:47:21 project1 kernel:  [<c01729d5>] sys_oldumount+0x15/0x20
> > Mar 23 16:47:21 project1 kernel:  [<c01031cf>] syscall_call+0x7/0xb
> > 
> > I was able to fix the problem with fsck.reiser4 :)
> > here is the output:
> > 
> > root@project1:~# fsck.reiser4 /dev/hda2
> > *******************************************************************
> > This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
> > *******************************************************************
> > 
> > Fscking the /dev/hda2 block device.
> > Will check the consistency of the Reiser4 SuperBlock.
> > Will check the consistency of the Reiser4 FileSystem.
> > Continue?
> > (Yes/No): yes
> > ***** fsck.reiser4 started at Wed Mar 23 18:02:03 2005
> > Reiser4 journal (journal40) on /dev/hda2: 0 transactions replayed of the 
> > total 0 blocks.
> > Reiser4 fs was detected on /dev/hda2.
> > Master super block (16):
> > magic:          ReIsEr4
> > blksize:        4096
> > format:         0x0 (format40)
> > uuid:           a4f5a623-b299-4619-a845-128b90df3d83
> > label:          <none>
> > 
> > Format super block (17):
> > plugin:         format40
> > description:    Disk-format for reiser4, ver. 1.0.0
> > magic:          ReIsEr40FoRmAt
> > flushes:        0
> > mkfs id:        0x1cf367de
> > blocks:         4863678
> > free blocks:    4500553
> > root block:     362992
> > tail policy:    0x2 (smart)
> > next oid:       0x116e9
> > file count:     5862
> > tree height:    3
> > key policy:     LARGE
> > 
> > 
> > CHECKING STORAGE TREE
> >         Read nodes 3820
> >         Nodes left in the tree 3820
> >                 Leaves of them 3745, Twigs of them 74
> >         Time interval: Wed Mar 23 18:02:05 2005 - Wed Mar 23 18:02:07 2005
> > CHECKING EXTENT REGIONS.
> >         Read twigs 74
> >         Time interval: Wed Mar 23 18:02:07 2005 - Wed Mar 23 18:02:07 2005
> > CHECKING SEMANTIC TREE
> > FSCK: Directory [103fa:454c5445000000:107f9] (dir40), node [275999], 
> > item [1], unit [7]: entry has wrong offset
> > [107f9:0(NAME):1417a2061746f6d:626f6d62612074f6:20f797469d643]. Should be
> > [107f9:0(NAME):1417a2061746f6d:626f6d62612074f6:206a7f4e05393].
> > FSCK: Directory [103fa:454c5445000000:107f9] (dir40), node [275999], 
> > item [1], unit [8]: entry has wrong offset
> > [107f9:0(NAME):15469737a74656c:745f4967617a6761:4ca05d10f09]. Should be
> > [107f9:0(NAME):15469737a74656c:745f4967617a6761:3fb197a3669].
> > FSCK: Directory [103fa:456c7669726100:10b1b] (dir40), node [280116], 
> > item [0], unit [2]: entry has wrong offset
> > [10b1b:0(NAME):1454c5649524120:2da02042e1746173:2ab39e259280d016]. Should be
> > [10b1b:0(NAME):1454c5649524120:2da02042e1746173:2471b96fafb04106].
> > FSCK: Directory [103fa:456c7669726100:10b1b] (dir40), node [280116], 
> > item [0], unit [3]: entry has wrong offset
> > [10b1b:0(NAME):1454c5649524120:2da02042e1746173:54fb23287ac44f20]. Should be
> > [10b1b:0(NAME):1454c5649524120:2da02042e1746173:f5b901884c766b90].
> > FSCK: Directory [103fa:456c7669726100:10b1b] (dir40), node [280116], 
> > item [0], unit [5]: entry has wrong offset
> > [10b1b:0(NAME):1454c5649524120:2da02043696bf320:41c4f00bcdbd41b]. Should be
> > [10b1b:0(NAME):1454c5649524120:2da02043696bf320:41c4eff0aa8c18b].
> > FSCK: Directory [103fa:456c7669726100:10b1b] (dir40), node [280116], 
> > item [0], unit [7]: entry has wrong offset
> > [10b1b:0(NAME):1454c5649524120:2da02043696bf320:5f2ec0d976ca69c9]. Should be
> > [10b1b:0(NAME):1454c5649524120:2da02043696bf320:5f2eb807f740e719].
> > FSCK: Directory [103fa:456c7669726100:10b1b] (dir40), node [280116], 
> > item [0], unit [8]: entry has wrong offset
> > [10b1b:0(NAME):1454c5649524120:2da020446f6d62f3:e0d24e117f9f160b]. Should be
> > [10b1b:0(NAME):1454c5649524120:2da020446f6d62f3:3540a81a3598015b].
> > FSCK: Directory [103fa:456c7669726100:10b1b] (dir40), node [280116], 
> > item [0], unit [9]: entry has wrong offset
> > [10b1b:0(NAME):1454c5649524120:2da020446f6d62f3:e56be4fe13fa3c99]. Should be
> > [10b1b:0(NAME):1454c5649524120:2da020446f6d62f3:df2a00483129ad89].
> > FSCK: Directory [103fa:456c7669726100:10b1b] (dir40), node [280116], 
> > item [0], unit [10]: entry has wrong offset
> > [10b1b:0(NAME):1454c5649524120:2da0204869646173:802a3029ffdb6af0]. Should be
> > [10b1b:0(NAME):1454c5649524120:2da0204869646173:79e84b741d0adbe0].
> > FSCK: Directory [103fa:456c7669726100:10b1b] (dir40), node [280116], 
> > item [0], unit [11]: entry has wrong offset
> > [10b1b:0(NAME):1454c5649524120:2da0204869646173:d90d4d8c3e050058]. Should be
> > [10b1b:0(NAME):1454c5649524120:2da0204869646173:2d7ba794f3fdeba8].
> > FSCK: Directory [103fa:456c7669726100:10b1b] (dir40), node [280116], 
> > item [0], unit [12]: entry has wrong offset
> > [10b1b:0(NAME):1454c5649524120:2da0204b61706f73:e0d326cd7944dbc0]. Should be
> > [10b1b:0(NAME):1454c5649524120:2da0204b61706f73:3541800742e6ee70].
> > FSCK: Directory [103fa:456c7669726100:10b1b] (dir40), node [280116], 
> > item [0], unit [13]: entry has wrong offset
> > [10b1b:0(NAME):1454c5649524120:2da0204b61706f73:e9d2be510cdd28a8]. Should be
> > [10b1b:0(NAME):1454c5649524120:2da0204b61706f73:e38ca5c4628451b8].
> >         Found 4922 objects.
> >         Time interval: Wed Mar 23 18:02:07 2005 - Wed Mar 23 18:02:08 2005
> > ***** fsck.reiser4 finished at Wed Mar 23 18:02:08 2005
> > Closing fs...done
> > 
> > 2 fatal corruptions were detected in FileSystem. Run with --build-fs 
> > option to fix them.
> > 
> > root@project1:~# fsck.reiser4 /dev/hda2 --build-fs
> > *******************************************************************
> > This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
> > *******************************************************************
> > 
> > Fscking the /dev/hda2 block device.
> > Will check the consistency of the Reiser4 SuperBlock.
> > Will build the Reiser4 FileSystem.
> > Continue?
> > (Yes/No): yes
> > ***** fsck.reiser4 started at Wed Mar 23 18:02:55 2005
> > Reiser4 journal (journal40) on /dev/hda2: 0 transactions replayed of the 
> > total 0 blocks.
> > Reiser4 fs was detected on /dev/hda2.
> > Master super block (16):
> > magic:          ReIsEr4
> > blksize:        4096
> > format:         0x0 (format40)
> > uuid:           a4f5a623-b299-4619-a845-128b90df3d83
> > label:          <none>
> > 
> > Format super block (17):
> > plugin:         format40
> > description:    Disk-format for reiser4, ver. 1.0.0
> > magic:          ReIsEr40FoRmAt
> > flushes:        0
> > mkfs id:        0x1cf367de
> > blocks:         4863678
> > free blocks:    4500553
> > root block:     362992
> > tail policy:    0x2 (smart)
> > next oid:       0x116e9
> > file count:     5862
> > tree height:    3
> > key policy:     LARGE
> > 
> > 
> > CHECKING STORAGE TREE
> >         Read nodes 3820
> >         Nodes left in the tree 3820
> >                 Leaves of them 3745, Twigs of them 74
> >         Time interval: Wed Mar 23 18:02:56 2005 - Wed Mar 23 18:02:58 2005
> > CHECKING EXTENT REGIONS.
> >         Read twigs 74
> >         Time interval: Wed Mar 23 18:02:59 2005 - Wed Mar 23 18:02:59 2005
> > LOOKING FOR UNCONNECTED NODES
> >         Read nodes 0
> >         Good nodes 0
> >                 Leaves of them 0, Twigs of them 0
> >         Time interval: Wed Mar 23 18:02:59 2005 - Wed Mar 23 18:02:59 2005
> > CHECKING EXTENT REGIONS.
> >         Read twigs 0
> >         Time interval: Wed Mar 23 18:02:59 2005 - Wed Mar 23 18:02:59 2005
> > INSERTING UNCONNECTED NODES
> > 1. Twigs: done
> > 2. Twigs by item: done
> > 3. Leaves: done
> > 4. Leaves by item: done
> >         Twigs: read 0, inserted 0, by item 0, empty 0
> >         Leaves: read 0, inserted 0, by item 0
> >         Time interval: Wed Mar 23 18:03:00 2005 - Wed Mar 23 18:03:00 2005
> > CHECKING SEMANTIC TREE
> > FSCK: No 'lost+found' entry found. Building a new object with the key 
> > 2a:0:ffff.
> > FSCK: Failed to recognize the plugin for the directory [2a:0:ffff].
> > FSCK: Trying to recover the directory [2a:0:ffff] with the default 
> > plugin--dir40.
> > FSCK: The file [2a:0:ffff] does not have a StatData item. Creating a new 
> > one. Plugin dir40.
> > FSCK: Directory [2a:0:ffff]: The entry "." is not found. Insert a new 
> > one. Plugin (dir40).
> > FSCK: Node (270538), item (2), [2a:0:ffff] (stat40): wrong size (0), 
> > Fixed to (1).
> > FSCK: Node (270538), item (2), [2a:0:ffff] (stat40): wrong bytes (0), 
> > Fixed to (50).
> > FSCK: Directory [103fa:454c5445000000:107f9] (dir40), node [275999], 
> > item [1], unit [7]: entry has wrong offset
> > [107f9:0(NAME):1417a2061746f6d:626f6d62612074f6:20f797469d643]. Should be
> > [107f9:0(NAME):1417a2061746f6d:626f6d62612074f6:206a7f4e05393]. Removed.
> > FSCK: Directory [103fa:454c5445000000:107f9] (dir40), node [275999], 
> > item [1], unit [7]: entry has wrong offset
> > [107f9:0(NAME):15469737a74656c:745f4967617a6761:4ca05d10f09]. Should be
> > [107f9:0(NAME):15469737a74656c:745f4967617a6761:3fb197a3669]. Removed.
> > FSCK: Node (270533), item (7), [103fa:454c5445000000:107f9] (stat40): 
> > wrong size (9), Fixed to (7).
> > FSCK: Node (270533), item (7), [103fa:454c5445000000:107f9] (stat40): 
> > wrong bytes (502), Fixed to (350).
> > FSCK: Directory [107fc:73747566660000:10a65] (dir40), node [277478], 
> > item [1], unit [9]: entry has wrong offset
> > [10a65:0(NAME):154656368202d20:4f6c6373f320737a:807e897176601221]. Should be
> > [10a65:0(NAME):154656368202d20:4f6c6373f320737a:7c532801bc71f7b1]. Removed.
> > FSCK: Directory [107fc:73747566660000:10a65] (dir40), node [277478], 
> > item [1], unit [9]: entry has wrong offset
> > [10a65:0(NAME):154656368202d20:4f6c6373f320737a:bbcef6a47f1ffb8f]. Should be
> > [10a65:0(NAME):154656368202d20:4f6c6373f320737a:c34de8d59d957c9f]. Removed.
> > FSCK: Node (276045), item (12), [107fc:73747566660000:10a65] (stat40): 
> > wrong size (12), Fixed to (10).
> > FSCK: Node (276045), item (12), [107fc:73747566660000:10a65] (stat40): 
> > wrong bytes (737), Fixed to (531).
> > FSCK: Directory [103fa:456c7669726100:10b1b] (dir40), node [280116], 
> > item [0], unit [2]: entry has wrong offset
> > [10b1b:0(NAME):1454c5649524120:2da02042e1746173:2ab39e259280d016]. Should be
> > [10b1b:0(NAME):1454c5649524120:2da02042e1746173:2471b96fafb04106]. Removed.
> > FSCK: Directory [103fa:456c7669726100:10b1b] (dir40), node [280116], 
> > item [0], unit [2]: entry has wrong offset
> > [10b1b:0(NAME):1454c5649524120:2da02042e1746173:54fb23287ac44f20]. Should be
> > [10b1b:0(NAME):1454c5649524120:2da02042e1746173:f5b901884c766b90]. Removed.
> > FSCK: Directory [103fa:456c7669726100:10b1b] (dir40), node [280116], 
> > item [0], unit [3]: entry has wrong offset
> > [10b1b:0(NAME):1454c5649524120:2da02043696bf320:41c4f00bcdbd41b]. Should be
> > [10b1b:0(NAME):1454c5649524120:2da02043696bf320:41c4eff0aa8c18b]. Removed.
> > FSCK: Directory [103fa:456c7669726100:10b1b] (dir40), node [280116], 
> > item [0], unit [4]: entry has wrong offset
> > [10b1b:0(NAME):1454c5649524120:2da02043696bf320:5f2ec0d976ca69c9]. Should be
> > [10b1b:0(NAME):1454c5649524120:2da02043696bf320:5f2eb807f740e719]. Removed.
> > FSCK: Directory [103fa:456c7669726100:10b1b] (dir40), node [280116], 
> > item [0], unit [4]: entry has wrong offset
> > [10b1b:0(NAME):1454c5649524120:2da020446f6d62f3:e0d24e117f9f160b]. Should be
> > [10b1b:0(NAME):1454c5649524120:2da020446f6d62f3:3540a81a3598015b]. Removed.
> > FSCK: Directory [103fa:456c7669726100:10b1b] (dir40), node [280116], 
> > item [0], unit [4]: entry has wrong offset
> > [10b1b:0(NAME):1454c5649524120:2da020446f6d62f3:e56be4fe13fa3c99]. Should be
> > [10b1b:0(NAME):1454c5649524120:2da020446f6d62f3:df2a00483129ad89]. Removed.
> > FSCK: Directory [103fa:456c7669726100:10b1b] (dir40), node [280116], 
> > item [0], unit [4]: entry has wrong offset
> > [10b1b:0(NAME):1454c5649524120:2da0204869646173:802a3029ffdb6af0]. Should be
> > [10b1b:0(NAME):1454c5649524120:2da0204869646173:79e84b741d0adbe0]. Removed.
> > FSCK: Directory [103fa:456c7669726100:10b1b] (dir40), node [280116], 
> > item [0], unit [4]: entry has wrong offset
> > [10b1b:0(NAME):1454c5649524120:2da0204869646173:d90d4d8c3e050058]. Should be
> > [10b1b:0(NAME):1454c5649524120:2da0204869646173:2d7ba794f3fdeba8]. Removed.
> > FSCK: Directory [103fa:456c7669726100:10b1b] (dir40), node [280116], 
> > item [0], unit [4]: entry has wrong offset
> > [10b1b:0(NAME):1454c5649524120:2da0204b61706f73:e0d326cd7944dbc0]. Should be
> > [10b1b:0(NAME):1454c5649524120:2da0204b61706f73:3541800742e6ee70]. Removed.
> > FSCK: Directory [103fa:456c7669726100:10b1b] (dir40), node [280116], 
> > item [0], unit [4]: entry has wrong offset
> > [10b1b:0(NAME):1454c5649524120:2da0204b61706f73:e9d2be510cdd28a8]. Should be
> > [10b1b:0(NAME):1454c5649524120:2da0204b61706f73:e38ca5c4628451b8]. Removed.
> > FSCK: Node (270533), item (8), [103fa:456c7669726100:10b1b] (stat40): 
> > wrong size (15), Fixed to (5).
> > FSCK: Node (270533), item (8), [103fa:456c7669726100:10b1b] (stat40): 
> > wrong bytes (1208), Fixed to (350).
> >         Found 5864 objects.
> >         Time interval: Wed Mar 23 18:03:00 2005 - Wed Mar 23 18:03:01 2005
> > CLEANUPING STORAGE TREE
> >         Removed items 0
> >         Time interval: Wed Mar 23 18:03:01 2005 - Wed Mar 23 18:03:01 2005
> > ***** fsck.reiser4 finished at Wed Mar 23 18:03:01 2005
> > Closing fs...done
> > 
> > FS is consistent.
> > 
> > root@project1:~# fsck.reiser4 /dev/hda2
> > *******************************************************************
> > This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
> > *******************************************************************
> > 
> > Fscking the /dev/hda2 block device.
> > Will check the consistency of the Reiser4 SuperBlock.
> > Will check the consistency of the Reiser4 FileSystem.
> > Continue?
> > (Yes/No): yes
> > ***** fsck.reiser4 started at Wed Mar 23 18:03:12 2005
> > Reiser4 journal (journal40) on /dev/hda2: 0 transactions replayed of the 
> > total 0 blocks.
> > Reiser4 fs was detected on /dev/hda2.
> > Master super block (16):
> > magic:          ReIsEr4
> > blksize:        4096
> > format:         0x0 (format40)
> > uuid:           a4f5a623-b299-4619-a845-128b90df3d83
> > label:          <none>
> > 
> > Format super block (17):
> > plugin:         format40
> > description:    Disk-format for reiser4, ver. 1.0.0
> > magic:          ReIsEr40FoRmAt
> > flushes:        0
> > mkfs id:        0x1cf367de
> > blocks:         4863678
> > free blocks:    4500553
> > root block:     362992
> > tail policy:    0x2 (smart)
> > next oid:       0x116e9
> > file count:     5862
> > tree height:    3
> > key policy:     LARGE
> > 
> > 
> > CHECKING STORAGE TREE
> >         Read nodes 3820
> >         Nodes left in the tree 3820
> >                 Leaves of them 3745, Twigs of them 74
> >         Time interval: Wed Mar 23 18:03:13 2005 - Wed Mar 23 18:03:16 2005
> > CHECKING EXTENT REGIONS.
> >         Read twigs 74
> >         Time interval: Wed Mar 23 18:03:16 2005 - Wed Mar 23 18:03:16 2005
> > CHECKING SEMANTIC TREE
> >         Found 5864 objects.
> >         Time interval: Wed Mar 23 18:03:16 2005 - Wed Mar 23 18:03:16 2005
> > ***** fsck.reiser4 finished at Wed Mar 23 18:03:16 2005
> > Closing fs...done
> > 
> > FS is consistent.
> > 
> > root@project1:~#
> > 
> > I am using the latest kernel 2.6.11 with the patch available from 
> > ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.11/reiser4-for-2.6.11-1.gz
> > What is strange I rarely use this partition. The bug happend after I had 
> > updated my kernel from 2.6.10 to 2.6.11. I did not copy anything from/to 
> > that partition, just tried to umount it.
> > 
> > Cheers,
> > Szabolcs

--=-gl0jdw6mp0LpdAQMXzhO
Content-Disposition: attachment; filename=reiser4-2.6.11-fix.patch
Content-Type: text/plain; name=reiser4-2.6.11-fix.patch; charset=koi8-r
Content-Transfer-Encoding: 7bit

--- object.c~	2005-03-23 12:30:52.000000000 +0300
+++ object.c	2005-03-23 13:31:39.000000000 +0300
@@ -976,6 +976,7 @@
 	 * FIXME: this resembles generic_delete_inode
 	 */
 	list_del_init(&object->i_list);
+	list_del_init(&object->i_sb_list);
 	object->i_state |= I_FREEING;
 	inodes_stat.nr_inodes--;
 	spin_unlock(&inode_lock);

--=-gl0jdw6mp0LpdAQMXzhO--

