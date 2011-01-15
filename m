From: Serkan Kaba <serkan@gentoo.org>
Subject: Re: Reiser4 and mount times
Date: Sat, 15 Jan 2011 07:58:07 +0200
Message-ID: <4D31376F.1080903@gentoo.org>
References: <4D2BE02E.6040207@gentoo.org> <4D2C3143.7050008@gmail.com> <4D2D28D1.5010306@gentoo.org> <4D2E12AD.6030508@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4D2E12AD.6030508@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

After switching to dont_load_bitmap I started having freezes when
starting pidgin (not always). Here's what I could find from dmesg.

Process java (pid: 6853, threadinfo ffff88014862c000, task ffff88017fc8c090)
Stack:
 ffff880100000020 ffffffff00000001 000000017ef577f0 0000000000008000
<0> 0000000000000020 ffff880147249004 ffff88017ef577f0 ffff88014862dae8
<0> 0000000000007fe0 ffff88014862da84 0000000000000001 ffff88014862dae0
Call Trace:
 [<ffffffff81120153>] T.635+0x7b/0xc2
 [<ffffffff81120305>] reiser4_alloc_blocks_bitmap+0x16b/0x1ca
 [<ffffffff810ee15f>] ? item_utmost_child_real_block+0x46/0x4d
 [<ffffffff810ee47e>] ? coord_prev_unit+0x64/0xa9
 [<ffffffff810ef334>] reiser4_alloc_blocks+0x8f/0x22b
 [<ffffffff810f4305>] allocate_znode_update+0xfc/0x249
 [<ffffffff810e59d1>] ? jload_gfp+0x3e/0x1b9
 [<ffffffff810f4577>] allocate_znode+0x125/0x169
 [<ffffffff810f584a>] alloc_pos_and_ancestors+0xfb/0x137
 [<ffffffff810f6326>] flush_current_atom+0x66c/0x7ea
 [<ffffffff810f0186>] ? txnh_get_atom+0x2a/0xa3
 [<ffffffff810f1e62>] reiser4_txn_end+0x283/0x57b
 [<ffffffff810f216b>] reiser4_txn_restart+0x11/0x22
 [<ffffffff810f270d>] reiser4_txn_restart_current+0x19/0x1b
 [<ffffffff810f2976>] force_commit_atom+0x63/0x69
 [<ffffffff811044e7>] reiser4_sync_file_common+0x73/0x82
 [<ffffffff810b5599>] vfs_fsync_range+0x50/0x7b
 [<ffffffff810b561f>] vfs_fsync+0x17/0x19
 [<ffffffff810b564a>] do_fsync+0x29/0x3e
 [<ffffffff810b567c>] sys_fsync+0xb/0xf
 [<ffffffff81001eab>] system_call_fastpath+0x16/0x1b
Code: 00 00 00 48 8b 80 70 02 00 00 48 8b 40 18 48 03 18 48 89 df e8 07
f5 ff ff 89 45 c4 85 c0 0f 85 5c 01 00 00 48 8b 43 20 41 8b 17 <48> 8b
40 40 31 c9 48 83 c0 04 48 89 45 c8 8b 43 30 39 d0 72 04
RIP  [<ffffffff8111ff71>] T.637+0x5d/0x1c4
 RSP <ffff88014862d9f8>
CR2: 0000000000000040
- ---[ end trace d23b92e9c7b9d378 ]---

- --
Sincerely,
Serkan KABA
- -- 
Sincerely,
Serkan KABA
Gentoo Developer
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk0xN28ACgkQRh6X64ivZaI8xQCfZnjRWl2ythyBRGZbmbqF0URl
Gp8Anje7TN9QVy2TAZ+jDYHQrIRy1QW6
=OJ63
-----END PGP SIGNATURE-----
