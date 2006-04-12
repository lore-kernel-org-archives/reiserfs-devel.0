From: "Roy Lanek" <lanek@novenine.com>
Subject: =?iso-8859-1?B?Indhcm5pbmcoInZzLTQ0IiwgIm91dA==?= of
  =?iso-8859-1?B?bWVtb3J5PyIpOyI=?= --[Saveliev]--
Date: Wed, 12 Apr 2006 07:42:43 +0000
Message-ID: <20060412074243.73274.qmail@mail.httpdnet.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=_0_73185_1144827763_000"; charset="iso-8859-1"
Return-path: <reiserfs-list-return-28485-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com
Cc: lanek@novenine.com

--=_0_73185_1144827763_000
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

I have managed to save a copy of my
/var/log/socklog-klog/others/current
before the next complete freezing happened. 

Here it is, included (just the part of the logs of
interest, i.e., from "--//--[ cut here ]--//--" on). 

I observe that polipo, a caching web proxy, is involved
(or mentioned, as a minimum) again ... like the last time. 

Cheers, 

/Roy Lanek 


P.S. sorry for a previous mistake [email sending]
 --
########################         bagai telur diujung tanduk
##### . slackware ######       as an egg on the tip of a horn
##### +-----linux ######  [very critical situation, as the egg will
########################           soon tip-over and fall]

--=_0_73185_1144827763_000
Content-Disposition: attachment;
  filename="current"
Content-Type: text/plain; charset="iso-8859-1";
  name="current"
Content-Transfer-Encoding: 7bit

2006-04-12_04:02:11.84015 <0>------------[ cut here ]------------
2006-04-12_04:02:12.48787 <0>kernel BUG at fs/reiser4/plugin/file/tail_conversion.c:81!
2006-04-12_04:02:12.48818 <0>invalid opcode: 0000 [#1]
2006-04-12_04:02:12.48840 <0>CPU:    0
2006-04-12_04:02:12.48861 kern.warn: EIP:    0060:[<c01d16fc>]    Not tainted VLI
2006-04-12_04:02:12.48883 kern.warn: EFLAGS: 00010286   (2.6.16.2-grsec #4) 
2006-04-12_04:02:12.48905 <0>EIP is at get_nonexclusive_access+0x24/0x3d
2006-04-12_04:02:12.49038 <0>eax: c0478184   ebx: c0f92e34   ecx: b7d3d000   edx: b7d3d000
2006-04-12_04:02:12.49067 <0>esi: c0f92e34   edi: c0f92e8c   ebp: c1d83e9c   esp: c1d83dc0
2006-04-12_04:02:12.49090 <0>ds: 007b   es: 007b   ss: 0068
2006-04-12_04:02:12.49112 <0>Process polipo (pid: 30460, threadinfo=c1d82000 task=c1765030)
2006-04-12_04:02:12.49135 <0>Stack: <0>00000000 c01e3c85 c0f92e34 00000000 00000000 3e0127a0 00000000 c15b0600 
2006-04-12_04:02:12.49158 <0>       c10127a0 c1dab7e0 c01e3fff c0f92e8c c1d83e9c c11eab20 c11eab30 c11eab30 
2006-04-12_04:02:12.49181 <0>       00000002 00000000 c1d83e9c 00000400 00000001 c15b0600 c11f0c14 0040b88b 
2006-04-12_04:02:12.49204 <0>Call Trace:
2006-04-12_04:02:12.49225 <0> [<c01e3c85>] extent_balance_dirty_pages+0x13a/0x145
2006-04-12_04:02:12.49247 <0> [<c01e3fff>] extent_write_flow+0x36f/0x45a
2006-04-12_04:02:12.49269 <0> [<c01e4219>] write_extent+0x0/0x36
2006-04-12_04:02:12.49326 <0> [<c01d06bd>] append_and_or_overwrite+0x254/0x302
2006-04-12_04:02:12.49381 <0> [<c01d07b2>] write_flow+0x47/0x50
2006-04-12_04:02:12.49404 <0> [<c01d093c>] write_file+0x5c/0x7a
2006-04-12_04:02:12.49443 <0> [<c01d0c26>] write_unix_file+0x2cc/0x447
2006-04-12_04:02:12.49465 <0> [<c01633e3>] vfs_write+0x87/0x11a
2006-04-12_04:02:12.49488 <0> [<c0163514>] sys_write+0x3b/0x63
2006-04-12_04:02:12.49509 <0> [<c01253f9>] syscall_call+0x7/0xb
2006-04-12_04:02:12.49531 <0>Code: 85 c8 0d 00 00 c3 c3 53 8b 5c 24 08 83 7c 24 0c 00 75 20 b8 00 e0 ff ff 21 e0 8b 00 8b 80 c4 04 00 00 8b 40 40 83 78 08 00 74 08 <0f> 0b 51 00 ed de 33 c0 e8 51 29 14 00 89 d8 ff 00 0f 88 9f 0d 
2006-04-12_04:02:12.49559 kern.warn:  <4><4>reiser4[polipo(30460)]: release_unix_file (fs/reiser4/plugin/file/file.c:2674)[vs-44]:
2006-04-12_04:02:12.49583 kern.warn: WARNING: out of memory?
2006-04-12_04:02:12.49604 kern.warn: <4>reiser4[polipo(30460)]: release_unix_file (fs/reiser4/plugin/file/file.c:2674)[vs-44]:
2006-04-12_04:02:12.49628 kern.warn: WARNING: out of memory?
2006-04-12_04:02:12.49649 kern.warn: <4>reiser4[polipo(30460)]: release_unix_file (fs/reiser4/plugin/file/file.c:2674)[vs-44]:
2006-04-12_04:02:12.49676 kern.warn: WARNING: out of memory?
2006-04-12_04:02:12.49698 kern.warn: <4>reiser4[polipo(30460)]: release_unix_file (fs/reiser4/plugin/file/file.c:2674)[vs-44]:
2006-04-12_04:02:12.49722 kern.warn: WARNING: out of memory?
2006-04-12_04:02:12.49751 kern.warn: <4>reiser4[polipo(30460)]: release_unix_file (fs/reiser4/plugin/file/file.c:2674)[vs-44]:
2006-04-12_04:02:12.49775 kern.warn: WARNING: out of memory?
2006-04-12_04:02:12.49810 kern.warn: <4>reiser4[polipo(30460)]: release_unix_file (fs/reiser4/plugin/file/file.c:2674)[vs-44]:
2006-04-12_04:02:12.49834 kern.warn: WARNING: out of memory?
2006-04-12_04:02:12.49859 kern.warn: <4>reiser4[polipo(30460)]: release_unix_file (fs/reiser4/plugin/file/file.c:2674)[vs-44]:
2006-04-12_04:02:12.49882 kern.warn: WARNING: out of memory?
2006-04-12_04:02:12.49903 kern.warn: <4>reiser4[polipo(30460)]: release_unix_file (fs/reiser4/plugin/file/file.c:2674)[vs-44]:
2006-04-12_04:02:12.49927 kern.warn: WARNING: out of memory?
2006-04-12_04:02:12.49948 kern.warn: <4>reiser4[polipo(30460)]: release_unix_file (fs/reiser4/plugin/file/file.c:2674)[vs-44]:
2006-04-12_04:02:12.49971 kern.warn: WARNING: out of memory?
2006-04-12_04:02:12.49993 kern.warn: <4>reiser4[polipo(30460)]: release_unix_file (fs/reiser4/plugin/file/file.c:2674)[vs-44]:
2006-04-12_04:02:12.50095 kern.warn: WARNING: out of memory?
2006-04-12_04:02:12.50122 kern.warn: <4>reiser4[polipo(30460)]: release_unix_file (fs/reiser4/plugin/file/file.c:2674)[vs-44]:
2006-04-12_04:02:12.50157 kern.warn: WARNING: out of memory?
2006-04-12_04:02:12.50178 kern.warn: <4>reiser4[polipo(30460)]: release_unix_file (fs/reiser4/plugin/file/file.c:2674)[vs-44]:
2006-04-12_04:02:12.50202 kern.warn: WARNING: out of memory?
2006-04-12_04:02:12.50223 kern.warn: <4>reiser4[polipo(30460)]: release_unix_file (fs/reiser4/plugin/file/file.c:2674)[vs-44]:
2006-04-12_04:02:12.50262 kern.warn: WARNING: out of memory?
2006-04-12_04:02:12.50284 kern.warn: <4>reiser4[polipo(30460)]: release_unix_file (fs/reiser4/plugin/file/file.c:2674)[vs-44]:
2006-04-12_04:02:12.50308 kern.warn: <WARNING: out of memory?
2006-04-12_04:02:12.50329 kern.warn: <4>reiser4[polipo(30460)]: release_unix_file (fs/reiser4/plugin/file/file.c:2674)[vs-44]:
2006-04-12_04:02:12.50353 kern.warn: WARNING: out of memory?
2006-04-12_04:02:12.50374 kern.warn: <4>reiser4[polipo(30460)]: release_unix_file (fs/reiser4/plugin/file/file.c:2674)[vs-44]:
2006-04-12_04:02:12.50398 kern.warn: WARNING: out of memory?
2006-04-12_04:02:12.50419 kern.warn: <4>reiser4[polipo(30460)]: release_unix_file (fs/reiser4/plugin/file/file.c:2674)[vs-44]:
2006-04-12_04:02:12.50443 kern.warn: WARNING: out of memory?
2006-04-12_04:02:12.50464 kern.warn: <4>reiser4[polipo(30460)]: release_unix_file (fs/reiser4/plugin/file/file.c:2674)[vs-44]:
2006-04-12_04:02:12.50487 kern.warn: WARNING: out of memory?
2006-04-12_04:02:12.50509 kern.warn: <4>reiser4[polipo(30460)]: release_unix_file (fs/reiser4/plugin/file/file.c:2674)[vs-44]:
2006-04-12_04:02:12.50582 kern.warn: WARNING: out of memory?
2006-04-12_04:02:12.50604 kern.warn: <4>reiser4[polipo(30460)]: release_unix_file (fs/reiser4/plugin/file/file.c:2674)[vs-44]:
2006-04-12_04:02:12.50627 kern.warn: WARNING: out of memory?
2006-04-12_04:02:12.50663 kern.warn: <4>reiser4[polipo(30460)]: release_unix_file (fs/reiser4/plugin/file/file.c:2674)[vs-44]:
2006-04-12_04:02:12.50687 kern.warn: WARNING: out of memory?
2006-04-12_04:02:12.50708 kern.warn: <4>reiser4[polipo(30460)]: release_unix_file (fs/reiser4/plugin/file/file.c:2674)[vs-44]:
2006-04-12_04:02:12.50731 kern.warn: WARNING: out of memory?

--=_0_73185_1144827763_000--
