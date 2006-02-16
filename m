From: Marcus Furlong <furlongm@hotmail.com>
Subject: Re: metas
Date: Thu, 16 Feb 2006 12:08:36 +0000
Message-ID: <dt1puo$651$1@sea.gmane.org>
References: <43E68E3F.8000806@namesys.com> <5c7c368b0602090958w58103871pe7cc83735c20f063@mail.gmail.com> <43EB8361.9000801@namesys.com> <43ECAC8B.8090204@namesys.com>
Reply-To: furlongm@hotmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <reiserfs-list-return-28079-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Apologies if this gets posted twice, I saw there was a list malfunction so
posting it again as my previous message never showed up.


Hi Edward,

I've just tested the newer patch against 2.6.15.4, and have found a bug when
using `cat bmap` in a directory.

$ cd testdir/....
$ cat bmap


kernel BUG at fs/reiser4/plugin/object.c:58!
invalid operand: 0000 [#1]
PREEMPT
Modules linked in: reiser4 ipw2200 ieee80211 ieee80211_crypt
CPU:    0
EIP:    0060:[<f8f84300>]    Not tainted VLI
EFLAGS: 00010246   (2.6.15.4)
EIP is at _bugop+0x0/0x10 [reiser4]
eax: edd2dd1c   ebx: edd2dc7c   ecx: 0000000c   edx: f905b8d8
esi: 00000000   edi: ea9db5c0   ebp: 00010000   esp: f792feec
ds: 007b   es: 007b   ss: 0068
Process cat (pid: 3130, threadinfo=f792f000 task=f51f7030)
Stack: f8fff833 edd2dd1c 00000000 38892067 eaa79c00 f8fff75f edd2a13c
00000001
       ea9db5c0 00000001 c0188eb8 ea9db5c0 00000001 ea44c200 00000000
c0155ade
       f7f92ac0 00000000 00000000 eaa79c00 e8a4fb40 00000000 00010000
f8f9a16f
Call Trace:
 [<f8fff833>] bmap_show+0x43/0xc0 [reiser4]
 [<f8fff75f>] bmap_start+0x1f/0x80 [reiser4]
 [<c0188eb8>] seq_read+0xe8/0x2f0
 [<c0155ade>] __handle_mm_fault+0x14e/0x290
 [<f8f9a16f>] read_pseudo+0xbf/0xd0 [reiser4]
 [<c016536c>] vfs_read+0x19c/0x1b0
 [<c01656b1>] sys_read+0x51/0x80
 [<c010316b>] sysenter_past_esp+0x54/0x75
Code: 71 b7 01 f9 89 5c 24 20 be e5 00 00 00 8d 90 a4 01 00 00 89 4c 24 1c
89 74 24 18 e9 6f ff ff ff 90 90 90 90 90 90 90 90 90 90 90 <0f> 0b 3a 00
99 b7 01 f9 31 c0 c3 90 8d 74 26 00 31 c0 c3 8d b6

--
Marcus Furlong

