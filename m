From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: help recover filesystem corrupted by failing ide controller
Date: Sat, 15 Mar 2003 03:29:15 +0100
Message-ID: <3E728FFB.90905@mb.tu-ilmenau.de>
References: <200303141942.00679.phma@webjockey.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13267-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pierre Abbat <phma@webjockey.net>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 03/15/2003 01:42 AM, Pierre Abbat wrote:
> Wednesday evening, my computer started giving weird errors. ls in a busy 
> directory showed lots of garbled filenames. Within an hour it was unbootable. 
> I called a friend and we went and swapped drives around; the computer 
> wouldn't recognize either drive, and he suspected a motherboard problem. 
> Today I got a loaner and put the drives in it; it recognized them both and 
> booted right up. reiserfsck -x, however, showed lots of crosslinked files and 
> other errors I don't understand. Attempting to cat .procmailrc hung cat. So I 
> ran reiserfsck --rebuild-tree, which has worked for me before, and it made 
> the filesystem unbootable. -x claims that lots of bitmaps are wrong. I 
> haven't yet gotten the latest reiserfsck. The one I have is 3.x.0i from 
> Mandrake 8.0 or 8.1. The reiserfs version in the kernel is 3.6.25; the 
> filesystem is 3.5.x. Can I use debugreiserfs -p to dump the tree and recreate 
> the filesystem on another disk?
> 
> phma

If you already did a --rebuild-tree with that _old_ (~2years!!!) 
reiserfsck I pray you have a backup somewhere.

Try the latest -pre-release
ftp://ftp.namesys.com/pub/reiserfsprogs/pre/reiserfsprogs-3.6.5-pre2.tar.gz

that is said to have some bug fixes against the latest reiserfsprogs 
release
ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.4.tar.gz

and a plus of performance and this release link is only given in case 
you believe in release numbering itself.


If you have problems with internet downloads I can send the package by 
mail to you.

Try the prerelease reiserfsck /dev/disk/you/have and follow the 
instuctions. And, please, report back if errors remain.

Best wishes,

Manuel

