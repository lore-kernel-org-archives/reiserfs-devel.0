From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: raid0 and rfs4
Date: Tue, 13 Jan 2004 13:37:23 +0300
Message-ID: <16387.51811.609993.908345@laputa.namesys.com>
References: <1073970028.20855.18.camel@www.vox.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16471-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1073970028.20855.18.camel@www.vox.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bret Towe <btowe@gbis.com>
Cc: reiserfs-list@namesys.com

Bret Towe writes:
 > i recently tried reiser4 on a raid0 setup and well it didnt go so well
 > :\
 > 
 > what i got from dmesg was the following
 > dmesg was full up when i finally looked of the raid_make_request
 > all of those lines looked about the same cept the last 2 numbers
 > 
 > raid0_make_request bug: can't convert block across chunks or bigger than
 > 512k 356200 124
 > raid0_make_request bug: can't convert block across chunks or bigger than 512k 357352 124
 > raid0_make_request bug: can't convert block across chunks or bigger than 512k 358344 60

Hmm, probably raid is not happy that reiser4 sends so large bios to it.

 > Unable to handle kernel NULL pointer dereference at virtual address 00000004
 >  printing eip:
 > c021706f
 > *pde = 00000000
 > Oops: 0000 [#1]
 > CPU:    0
 > EIP:    0060:[<c021706f>]    Not tainted
 > EFLAGS: 00010246
 > EIP is at reiser4_status_write+0xef/0x250

Can you please send us the output of

$ gdb vmlinux # kernel that produces oops
(gdb) disass reiser4_status_write

?

Nikita.
