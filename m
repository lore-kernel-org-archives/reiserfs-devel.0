From: Matthias Andree <matthias.andree@gmx.de>
Subject: 2.4.24 Oops in find (maybe reiserfs related)
Date: Tue, 20 Jan 2004 16:32:43 +0100
Message-ID: <20040120153242.GA19858@merlin.emma.line.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16588-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-Kernel mailing list <linux-kernel@vger.kernel.org>, reiserfs-list@namesys.com

This happened during the nightly updatedb, which calls find. The hex
string is "resi", "locate resi" finds a file in a reiserfs file system,
/usr.

reiserfsck 3.6.11 afterwards fixed some
vpf-10680: The file [103048 103049] has the wrong block count in the
StatData (2) - corrected to (1)

But I doubt these are related. Are they?

Unable to handle kernel paging request at virtual address 72657369
 printing eip:
72657369
*pde = 00000000
Oops: 0000
CPU:    0
EIP:    0010:[<72657369>]    Not tainted
EFLAGS: 00010206
eax: f8bce0a0   ebx: 72657369   ecx: c1c1f13c   edx: f117dec0
esi: ec837f98   edi: 08060828   ebp: bffff258   esp: ec837f8c
ds: 0018   es: 0018   ss: 0018
Process find (pid: 7765, stackpage=ec837000)
Stack: c014ebf1 f117dec0 bffff530 f117dec0 f7edae80 00001000 ebcc0be0 00000001
       00000008 00000001 00001000 ec836000 bffff530 c01090eb 08060831 bffff530
       080541cc bffff530 08060828 bffff258 000000c4 0000002b 0000002b 000000c4
Call Trace:    [sys_lstat64+129/144] [system_call+51/56]
Call Trace:    [<c014ebf1>] [<c01090eb>]
Code:  Bad EIP value.

-- 
Matthias Andree

Encrypt your mail: my GnuPG key ID is 0x052E7D95
