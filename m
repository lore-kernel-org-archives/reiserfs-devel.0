From: Oleg Drokin <green@namesys.com>
Subject: Re: vpf-10680, minor corruptions
Date: Fri, 27 Jun 2003 21:34:53 +0400
Message-ID: <20030627173453.GA14395@namesys.com>
References: <3EF9E939.1050501@g-house.de> <20030626092608.GA12252@namesys.com> <3EFAE933.6040206@g-house.de> <20030627092821.GA29715@namesys.com> <3EFC361A.4030009@g-house.de> <20030627122556.GA8753@namesys.com> <3EFC396A.7080808@g-house.de> <20030627123800.GA9214@namesys.com> <20030627161344.GA13908@namesys.com> <1056730986.20899.235.camel@tiny.suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14750-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1056730986.20899.235.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <mason@suse.com>
Cc: Christian Kujau <evil@g-house.de>, ReiserFS List <reiserfs-list@namesys.com>

Hello!

On Fri, Jun 27, 2003 at 12:23:07PM -0400, Chris Mason wrote:

> Most of these changes are in 2.4.21, which I've been using on an AMD64

Not the reiserfs_file_write() ones.

> bit box for a while without any problems.  The bug should be somewhere
> else, it looks to me like these spots aren't trying to send an unsigned
> long to disk.

the reiserfs_file_write() code
have an array of b_blocknr_t elements.
It then submits this array to reiserfs_paste_into_item/reiserfs_insert_item,
but b_blocknr_t is unsigned long (read - 64 bit on alpha - oops).
Funny thing is when I declare b_blocknr_t as u32, kernel basically falls apart
if cross compiled. E.g. key comparison does not work and
all kind of weird things start to happen.

In short - if you want to make sure the bug is there - compile 2.5.70+ code
on any 64 bit platform, write any file bigger than 2 blocks,
unmount and remount the fs and see what's in the file.

Bye,
    Oleg
