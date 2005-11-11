From: John Gilmore <jgilmore@glycou.com>
Subject: Crash with 2.6.14-mm1 (and slow...)
Date: Fri, 11 Nov 2005 12:54:44 +0000
Message-ID: <200511111254.44704.jgilmore@glycou.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26866-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

It seems that when my HD approached 90% full, access (write) time went up 
dramatically, with some programs seeming to stop entirely. I especially 
notice it when starting vim. The problem hasn't gone away after I got the use 
percentage back down around 85%. It's getting really annoying.

And then I got this while trying to "apt-get install cvs"

This is actually the second time it's locked while doing this, but the 
previous time I was in X and didn't see the bug message. I captured this with 
a digital camera and typed it back in, so there may be minor errors, though I 
doubt it.

I haven't tried "apt-get install" on anything else yet.

Debian GNU/Linux testing/unstable herb tty2

herb login: root
Password: BUG: soft lockup detected on CPU#0!

Pid: 3492, comm:              apt-get
EIP: 0060:[<f8a6129c>] CPU: 0
EIP is at writepages_unix_file+0x11c/0x280 [reiser4]
EFLAGS: 00000202     not tainted  (2.6.14-mm1)
EAX: f6188b60 EBX: ffffffff ECX: 0000003f EDX: ffffffff
ESI: 000003fd EDI: 00000000 EBP: f646c9ec DS: 007b ES: 007b
CR0: 8005003b CR2: bf9c3000 CR3: 35d79000 CR4: 000006d0
[<c013cfeb>] __filemap_fdatawrite_range+0x6b/0x80\
[<c013d030>] filemap_fdatawrite+0x30/0x40
[<c015114f>] msync_interval+0x6f/0xe0
[<c015132f>] sys_msync+0x16f/0x182
[<c01030d5>] syscall_call+0x7/0xb
_
