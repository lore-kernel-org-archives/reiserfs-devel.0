From: Szakacsits Szabolcs <szaka@sienet.hu>
Subject: Re: Gnu Parted error, Kernel Panic, Reiserfs
Date: Fri, 16 Apr 2004 13:30:05 +0200 (MEST)
Message-ID: <Pine.LNX.4.21.0404161253580.16938-100000@mlf.linux.rulez.org>
References: <1082109613.30899.19.camel@firefly>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17988-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1082109613.30899.19.camel@firefly>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yury Umanets <umka@namesys.com>
Cc: Alan Chu <alanchu@MIT.EDU>, Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com, bug-parted@gnu.org


On Fri, 16 Apr 2004, Yury Umanets wrote:
> 
> I'm on-like, but seems missed mentioned emails somehow.

You answered the same. I've never resized reiserfs so I don't know. I'm
just seeing the issue popping up everywhere. 
 
> But I should say that I have no any details and moreover, nobody was so
> kind to send me at least something but complains that it does not work,

Is there a test suite for resizing? Just running it against recent/latest
reiserfs could catch potential compatibility problems.

> What I need to know is the following:
> 
> (1) was reiserfs consistent before resizing or not (what last reiserfsck
> said before resizing).

Running fsck before resizing is a very good practice. But most people
don't do it so some consistent check should be done in the resizer. IMHO
at least you must check you can account for all blocks in use. If not then
you must decline to resize otherwise you will probably trash the fs.

ntfsresize had this from day 0 and caught a lot of inconsistent
filesystems (and bugs during development) and refused to resize. 
After people run chkdsk everything worked fine.

Partition Magic didn't have this or it's optional (I don't have it but
people said so) and I suspect that's one of the reasons it also trashes
filesystems occasionally.

> (2) what version of reiserfs was used.
> (3) sequence of actions or/and detailed description of what was done.
> (4) is it visible using both parted and qtparted?

I've seen it reported with both tools. E.g. here are some qtparted ones.

	http://qtparted.sourceforge.net/forums/viewtopic.php?t=62

    Szaka

