From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Reiser4 Kernel OOPS on fs/reiser4/plugin/file/file.c:2294
	(perhaps the same as the one reported in 2006-07-03 22:24:29?)
Date: Wed, 05 Jul 2006 14:36:48 +0400
Message-ID: <1152095808.6337.32.camel@tribesman.namesys.com>
References: <20060704175657.2bf52029@Ryel.McDoom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28909-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060704175657.2bf52029@Ryel.McDoom>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Skotlex <skotlex@mailforce.net>
Cc: reiserfs-list@namesys.com

Hello

On Tue, 2006-07-04 at 17:56 -0500, Skotlex wrote:
> Hello. 
> Am new to this mailing list.. and I only joined because I can't find any other place to look up bug reports and the like.
> 
> Anyway, I have a kernel oops on Kernel 2.6.16 with the patchset -4.
> 
> Is this the same as the one from that other mail posted on the mailing archives, which I have no idea how to reference it from here... the meta-data of such email is:
> 
> List:       reiserfs
> Subject:    Re: reiser4 oops
> From:       Jake Maciejewski <maciejej () msoe ! edu>
> Date:       2006-07-03 22:24:29
> Message-ID: 1151969007.10172.23.camel () gentoo
> 
> Looking at the trace, it hang on the same file, same line. Should I try the patch provided on that email, then?
> 
> Point worth noting: The problem no longer is present when running 2.6.14, -1 patch
> 
> Oops: 0000 [#1]
> Modules linked in: sch_ingress cls_u32 usblp cdc_ether joydev nvidia usbnet evdev ehci_hcd ohci_hcd
> CPU:    0
> EIP:    0060:[<c01310f5>]    Tainted: P      VLI
> EFLAGS: 00010213   (2.6.16-reiser4-r9 #2)
> EIP is at truncate_inode_pages_range+0x38/0x275
> eax: 00000000   ebx: 00001fff   ecx: 00001fff   edx: 00000000
> esi: 00000000   edi: 00000001   ebp: 00000000   esp: eb737860
> ds: 007b   es: 007b   ss: 0068
> Process ldconfig (pid: 5748, threadinfo=eb736000 task=f66e4050)
> Stack: <0>00000000 eb7378a4 00000001 eb7378a4 eb7378a4 c1717f80 00000000 c0130df6
>        eb7378ac 00000001 00000000 00000040 00000002 00000000 00000010 0000003f
>        eb356c3c c01de9b1 eb356c3c 00000000 c1717080 00000002 00000001 c01a0f57
> Call Trace:
>  [<c0130df6>] __pagevec_release+0x18/0x23
>  [<c01de9b1>] radix_tree_gang_lookup+0x3c/0x54
>  [<c01a0f57>] invalidate_unformatted+0x41/0x65
>  [<c01a100f>] truncate_jnodes_range+0x94/0xcd
>  [<c01be47b>] kill_hook_extent+0x3f0/0x557
>  [<c01be6e5>] kill_units_extent+0x103/0x230
>  [<c01b5d35>] kill_tail+0x0/0x32
>  [<c01b5ce2>] kill_units+0x0/0x53
>  [<c01b55ed>] parse_cut+0x3e/0x694
>  [<c01b5d67>] kill_head+0x0/0x24
>  [<c01b5d2b>] kill_units+0x49/0x53
>  [<c01b5ce2>] kill_units+0x0/0x53
>  [<c01b5d84>] kill_head+0x1d/0x24
>  [<c01b6022>] prepare_for_compact+0x1ea/0x411
>  [<c01905b3>] jload_gfp+0xf3/0x105
>  [<c01b626c>] kill_node40+0x23/0x9a
>  [<c0192766>] lock_carry_node_tail+0x16/0x18
>  [<c0193f16>] carry_cut+0x3f/0x4c
>  [<c019214e>] carry_on_level+0x30/0xa0
>  [<c019204a>] carry+0x56/0x12a
>  [<c0196273>] kill_node_content+0x123/0x13b
>  [<c019673c>] cut_tree_worker_common+0x19e/0x2fe
>  [<c019659e>] cut_tree_worker_common+0x0/0x2fe
>  [<c019694c>] cut_tree_object+0xb0/0x14d
>  [<c0196a10>] cut_tree+0x27/0x37
>  [<c01ae0a2>] extent2tail+0x1d4/0x3c0
>  [<c014d75a>] link_path_walk+0xa5/0xaf
>  [<c01aad85>] find_file_item_nohint+0x2e/0x32 
>  [<c01905b3>] jload_gfp+0xf3/0x105
>  [<c0194a5f>] longterm_unlock_znode+0xac/0xde
>  [<c01ac7bc>] find_first_item+0x99/0xa4
>  [<c01ac893>] open_unix_file+0xcc/0xed
>  [<c01ac7c7>] open_unix_file+0x0/0xed
>  [<c0141991>] __dentry_open+0xb4/0x180
>  [<c0141b33>] nameidata_to_filp+0x1f/0x31
>  [<c0141a91>] do_filp_open+0x34/0x3c
>  [<c0141bd8>] get_unused_fd+0x4c/0x91
>  [<c0141cbd>] do_sys_open+0x40/0xb6
>  [<c0141d46>] sys_open+0x13/0x17
>  [<c0102397>] sysenter_past_esp+0x54/0x75
> Code: 24 68 8b 5c 24 6c 8b 74 24 70 89 c7 89 d5 81 c7 ff 0f 00 00 83 d5 00 25 ff 0f 00 00 89 04 24 8b 44 24 60 0f ac ef 0c 89 7c 24 08 <83> 78 28 00 0f 84 2b 02 00 00 89 d8 31 d2 25 ff 0f 00 00 89 c1
>  <4>reiser4[ldconfig(5748)]: release_unix_file (fs/reiser4/plugin/file/file.c:2294)[vs-44]:
> WARNING: out of memory?
> 
> It may be related, or it may not, but here goes the history of how I got it to corrupt like that:
> - I recently updated to Xorg-X11 7.0
> - While trying to get my wacom tablet working again, I noticed that metalog 0.8-rc1 locked up (this makes all processes that try to access the logger lock up badly on a kernel call, so I can't kill them. Gotta report this one to the metalog bugtracker)
> - On midst of that, I somehow accidentally killed X. But I couldn't get back to the console.
> - After failing to reboot the machine cleanly connecting through ssh, I tried the alt+printscreen + s -> u -> b method.
> - After reboot, I notice that a certain core lib file got truncated (how could /lib/libutil.so.1 get corrupted? This is a lib file, as many processes that were accessing it, none of them should had been writing to it!)
> - After hours getting a replacement file for that file and restoring glibc, I notice that the previously mentioned oops happens whenever emerge ends, when "updating the ld so cache" or something like that. After that, any changes to the filesystem are no longer saved. On reboot, the system is effectively restored to the point before that oops.
> - I can reproduce the oops whenever emerge ends, or when trying to launch a gtk2 app. The trace in both cases lead to the same file:lineno.
> 

can you install 2.6.17-mm6 and try to reproduce the problem?


> Sorry for the messy email format.. I am not used to mailing lists.. and I really was hoping to find/use a bugtracker instead.

