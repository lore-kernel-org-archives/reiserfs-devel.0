From: "Dushan Tcholich" <dusanc@gmail.com>
Subject: [BUG] kernel 2.6.24 + reiser4-for-2.6.24.patch nfs bug
Date: Mon, 24 Mar 2008 13:37:00 +0100
Message-ID: <a08621850803240537t4fef7b46me8a6ffc21e6d3983@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=upC3vn+/U5hRTYNZXjOqZ5vpQf0v77MkDuays+C93xg=;
        b=hlhjSM9014bZ2L7DxDbcrK6Z5fXNBhbznUiFQnEj2TdIN3oUUPNnRFfavBAMYEvBmpf0cuEO4ZK0sCUS/jiDVWbRFlaUK8V7Myb04LOQUM69YUGUi2fjoTvl99ouFKdu/JeDtEnpeCcXVswujdmsbupNDsI4AbmmTYThVktGgBo=
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>, reiserfs-devel@vger.kernel.org

When I switched from kernel 2.6.23 to kernel 2.6.24 I got this in my dmesg:

BUG: unable to handle kernel NULL pointer dereference at virtual
address 0000005c
printing eip: c01b30e9 *pde = 00000000
Oops: 0000 [#1] SMP

Pid: 5639, comm: nfsd Not tainted (2.6.24-gentoo-r3 #1)
EIP: 0060:[<c01b30e9>] EFLAGS: 00010286 CPU: 0
EIP is at max_item_size_node40+0xc/0x16
EAX: 00000000 EBX: 00000002 ECX: f613776c EDX: c01b87ac
ESI: c04ee640 EDI: c0486b45 EBP: f5ef8b9c ESP: f5ef8b20
 DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068
Process nfsd (pid: 5639, ti=f5ef8000 task=f7cb2030 task.ti=f5ef8000)
Stack: c01b87b7 c01a1fe8 c01b2caa 00000002 c01b2636 0012be44 00000000 f5ef8c1c
       f613776c 00016708 00000000 00000008 c04ee640 00000007 c01a4dd1 00000000
       00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
Call Trace:
 [<c01b87b7>] max_name_len_cde+0xb/0xf
 [<c01a1fe8>] reiser4_max_filename_len+0x1e/0x1f
 [<c01b2caa>] is_name_acceptable_common+0x8/0x12
 [<c01b2636>] reiser4_lookup_name+0x29/0xf0
 [<c01a4dd1>] plugin_set_field+0x2b/0x389
 [<c01b2e57>] get_parent_common+0x50/0xc1
 [<c01a099b>] reiser4_get_dentry_parent+0x1b/0x1d
 [<c01fc87d>] reconnect_path+0xd2/0x1f3
 [<c01a0ccd>] oid_next+0xe/0x29
 [<c018c606>] jrelse+0xf/0x17
 [<c01a2061>] init_inode_ordering+0x53/0x6e
 [<c0190f21>] longterm_unlock_znode+0x9b/0x188
 [<c01a1f2b>] reiser4_iget+0x295/0x2ce
 [<c016791b>] d_alloc+0x15b/0x173
 [<c0167c5e>] d_alloc_anon+0x56/0xd2
 [<c01a8683>] wire_get_common+0x34/0x6b
 [<c01a009f>] reiser4_get_dentry_fsdata+0x3a/0x57
 [<c01a0a15>] reiser4_decode_fh+0x78/0x82
 [<c01a0b41>] reiser4_fh_to_dentry+0x2a/0x31
 [<c01fcaf8>] exportfs_decode_fh+0x66/0x1a2
 [<c03eb5f5>] cache_check+0x59/0x3bb
 [<c0202870>] exp_get_by_name+0x43/0x52
 [<c03ec3f9>] sunrpc_cache_lookup+0x3e/0xf4
 [<c03eb5f5>] cache_check+0x59/0x3bb
 [<c012ba1f>] set_current_groups+0x108/0x143
 [<c0204518>] nfsd_setuser+0x125/0x175
 [<c01feee7>] nfsd_setuser_and_check_port+0x4f/0x57
 [<c0202ade>] exp_find+0x5b/0x63
 [<c0202b14>] rqst_exp_find+0x2e/0xa5
 [<c01ff5ef>] fh_verify+0x1e8/0x47d
 [<c01ff34e>] nfsd_acceptable+0x0/0xb9
 [<c03e607d>] svc_sock_enqueue+0x241/0x28f
 [<c01ffad4>] nfsd_access+0x1f/0xdf
 [<c0205d37>] nfsd3_proc_access+0xa5/0xaf
 [<c01fcde8>] nfsd_dispatch+0xd3/0x1a0
 [<c03e8813>] svcauth_unix_set_client+0x133/0x160
 [<c03e54aa>] svc_process+0x3be/0x670
 [<c03e7349>] svc_recv+0x314/0x389
 [<c011e40f>] sched_move_task+0xbf/0xc5
 [<c01fd32e>] nfsd+0x171/0x27b
 [<c01fd1bd>] nfsd+0x0/0x27b
 [<c010403f>] kernel_thread_helper+0x7/0x10
 =======================
Code: eb 04 66 8b 43 fa 5b 29 d0 0f b7 c0 c3 b8 01 00 00 00 c3 b8 01
00 00 00 c3 b8 01 00 00 00 c3 64 a1 00 c0 56 c0 8b 80 ec 04 00 00 <8b>
40 5c 8b 40 0c 83 e8 42 c3 53 8b 18 0f b7 48 04 8b 5b 28 6b
EIP: [<c01b30e9>] max_item_size_node40+0xc/0x16 SS:ESP 0068:f5ef8b20
---[ end trace cbbad9b099e5b9be ]---
