From: "Marti Raudsepp" <marti@juffo.org>
Subject: reiser4 BUG in 2.6.22: reiser4_txn_end
Date: Sun, 4 Nov 2007 16:38:12 +0200
Message-ID: <2a12af650711040638v314a6261u6c6b4f09bc8fbbb5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:sender:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition:x-google-sender-auth;
        bh=JwtW3AfpCQn8X24QTmIrTO/sQRqlGOdCETe0jEk9irs=;
        b=Z09hYSGCK5JzAeH6gIN7SiZZZvE1CWhwx0BremHonhMiOFfe9z/YglIoXUKft4/Q7yWxW/0NwNQhBPngHm2cdwb/yMRM3dBuUagAMZAstMNs6hKw5tOGrMipnXmXzkrtf53GuTpWn1bO3bncUWI14+/naxkAfdsmwjD3UOu9Nqg=
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

One morning I happened to find this BUG traceback in my dmesg output.
I have no clue what caused it, and it didn't seem to have any effect
on the stability of the system.

uname:
Linux non 2.6.22-gentoo-r8 #1 Fri Sep 28 19:11:19 EEST 2007 x86_64 AMD
Athlon(tm) 64 Processor 3000+ AuthenticAMD GNU/Linux

dmesg:
[16184.832157] reiser4[ktxnmgrd:dm-3:r(1209)]: disable_write_barrier
(fs/reiser4/wander.c:234)[zam-1055]:
[16184.832160] NOTICE: dm-3 does not support write barriers, using
synchronous write instead.
...
[451329.064221] reiser4[cat(13038)]: extent2tail
(fs/reiser4/plugin/file/tail_conversion.c:662)[]:
[451329.064224] WARNING: reiser4_write_tail failed
[451329.064232] reiser4[cat(13038)]: release_unix_file
(fs/reiser4/plugin/file/file.c:2376)[nikita-3233]:
[451329.064234] WARNING: Failed (-28) to convert in release_unix_file (4099340)
[451329.067453] reiser4[cat(13039)]: extent2tail
(fs/reiser4/plugin/file/tail_conversion.c:715)[nikita-2282]:
[451329.067457] WARNING: Partial conversion of 4099340: 3 of 4: -22
[451329.067464] reiser4[cat(13039)]: release_unix_file
(fs/reiser4/plugin/file/file.c:2376)[nikita-3233]:
[451329.067466] WARNING: Failed (-22) to convert in release_unix_file (4099340)
[451329.071333] reiser4[cat(13040)]: extent2tail
(fs/reiser4/plugin/file/tail_conversion.c:715)[nikita-2282]:
[451329.071336] WARNING: Partial conversion of 4099340: 3 of 4: -22
[451329.071343] reiser4[cat(13040)]: release_unix_file
(fs/reiser4/plugin/file/file.c:2376)[nikita-3233]:
[451329.071345] WARNING: Failed (-22) to convert in release_unix_file (4099340)
[451329.074360] reiser4[cat(13041)]: extent2tail
(fs/reiser4/plugin/file/tail_conversion.c:715)[nikita-2282]:
[451329.074363] WARNING: Partial conversion of 4099340: 3 of 4: -22
[451329.074370] reiser4[cat(13041)]: release_unix_file
(fs/reiser4/plugin/file/file.c:2376)[nikita-3233]:
[451329.074372] WARNING: Failed (-22) to convert in release_unix_file (4099340)
[451329.078370] reiser4[cat(13042)]: extent2tail
(fs/reiser4/plugin/file/tail_conversion.c:715)[nikita-2282]:
[451329.078373] WARNING: Partial conversion of 4099340: 3 of 4: -22
[451329.078380] reiser4[cat(13042)]: release_unix_file
(fs/reiser4/plugin/file/file.c:2376)[nikita-3233]:
[451329.078382] WARNING: Failed (-22) to convert in release_unix_file (4099340)
[451329.089818] reiser4[cat(13045)]: extent2tail
(fs/reiser4/plugin/file/tail_conversion.c:662)[]:
[451329.089821] WARNING: reiser4_write_tail failed
[451329.089829] reiser4[cat(13045)]: release_unix_file
(fs/reiser4/plugin/file/file.c:2376)[nikita-3233]:
[451329.089831] WARNING: Failed (-28) to convert in release_unix_file (4099340)
[451329.124570] reiser4[sed(13055)]: extent2tail
(fs/reiser4/plugin/file/tail_conversion.c:662)[]:
[451329.124574] WARNING: reiser4_write_tail failed
[451329.124581] reiser4[sed(13055)]: release_unix_file
(fs/reiser4/plugin/file/file.c:2376)[nikita-3233]:
[451329.124583] WARNING: Failed (-28) to convert in release_unix_file (4099340)
[451329.125273] ------------[ cut here ]------------
[451329.125278] kernel BUG at fs/reiser4/plugin/item/extent_file_ops.c:1050!
[451329.125281] invalid opcode: 0000 [1]
[451329.125284] CPU 0
[451329.125286] Modules linked in: ntfs nvidia(P) pppoe pppox
ppp_generic slhc usbhid
[451329.125293] Pid: 8533, comm: sh Tainted: P       2.6.22-gentoo-r8 #1
[451329.125297] RIP: 0010:[<ffffffff8112a1f4>]  [<ffffffff8112a1f4>]
reiser4_write_extent+0x5e4/0x5f0
[451329.125307] RSP: 0018:ffff8100708bbcf8  EFLAGS: 00010282
[451329.125311] RAX: 00000000ffffffea RBX: ffff810001b73588 RCX:
ffff810070e81c08
[451329.125316] RDX: ffff81006c6d3380 RSI: ffff810001b73588 RDI:
ffff81006c6d3380
[451329.125319] RBP: 00002b8c392c3000 R08: 0000000000000001 R09:
0000000000000015
[451329.125322] R10: 0000000000000014 R11: 0000000000000000 R12:
0000000000000ff7
[451329.125324] R13: 0000000000000001 R14: 0000000000000001 R15:
0000000000000001
[451329.125329] FS:  00002b8c391606f0(0000) GS:ffffffff8153c000(0000)
knlGS:00000000556f9c30
[451329.125332] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
[451329.125336] CR2: 00002b8c392c3000 CR3: 000000006d3aa000 CR4:
00000000000006e0
[451329.125340] Process sh (pid: 8533, threadinfo ffff8100708ba000,
task ffff81004d950200)
[451329.125342] Stack:  ffff8100708bbf50 0000000000000001
ffff810038a67780 00000000811139dd
[451329.125348]  0000000000000001 ffff81001ee35228 ffffffea70e81b00
ffff8100708bbd38
[451329.125354]  ffff81006daaef40 ffff81001ee351b0 0000000000000001
ffff81001ee35228
[451329.125359] Call Trace:
[451329.125365]  [<ffffffff810faba8>] reiser4_txn_end+0x288/0x4c0
[451329.125370]  [<ffffffff810f9980>] reiser4_txn_begin+0x20/0x40
[451329.125374]  [<ffffffff81129c10>] reiser4_write_extent+0x0/0x5f0
[451329.125380]  [<ffffffff8111152b>] write_unix_file+0x24b/0x570
[451329.125386]  [<ffffffff81078438>] vfs_write+0xc8/0x170
[451329.125390]  [<ffffffff81078a33>] sys_write+0x53/0x90
[451329.125395]  [<ffffffff81009efe>] system_call+0x7e/0x83
[451329.125397]
[451329.125398]
[451329.125399] Code: 0f 0b eb fe 90 90 90 90 90 90 90 90 e9 8b 51 fe
ff 66 66 2e
[451329.125408] RIP  [<ffffffff8112a1f4>] reiser4_write_extent+0x5e4/0x5f0
[451329.125413]  RSP <ffff8100708bbcf8>
[451329.126273] reiser4[sh(8533)]: release_unix_file
(fs/reiser4/plugin/file/file.c:2409)[vs-44]:
[451329.126275] WARNING: out of memory?
[451329.126347] reiser4[sh(8533)]: release_unix_file
(fs/reiser4/plugin/file/file.c:2409)[vs-44]:
[451329.126349] WARNING: out of memory?
[451329.126409] reiser4[sh(8533)]: release_unix_file
(fs/reiser4/plugin/file/file.c:2409)[vs-44]:
[451329.126412] WARNING: out of memory?


Any other information that would be useful?

Regards,
Marti Raudsepp
