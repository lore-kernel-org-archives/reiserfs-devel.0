From: Adrian Phillips <a.phillips@dnmi.no>
Subject: Re: Symbol collisions in patch?
Date: 03 Apr 2002 07:54:58 +0200
Sender: "Adrian Phillips,,," <a.phillips@dnmi.no>
Message-ID: <wvadsls4wd.fsf@freeze.oslo.dnmi.no>
References: <Pine.LNX.4.44.0204022130330.32751-100000@conn6m.toms.net>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <Pine.LNX.4.44.0204022130330.32751-100000@conn6m.toms.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Oehser <tom@toms.net>
Cc: reiserfs-list@namesys.com

>>>>> "Tom" == Tom Oehser <tom@toms.net> writes:

    Tom> 1) There is a missing patch from the latest 2.2.19 patch that
    Tom> causes the kernel to oops when it is unmounted.  I have the
    Tom> patch now at least.

I suppose the point here is that people who are interested in using a
journaled filesystem and 2.2 will probably be using reiserfs already -
it was the only journaled fs for 2.2 for quite a while.

    Tom> 2) There are symbol collisions that prevent supporting reiser
    Tom> AND ext3fs, *even as a module*.  Come on, guys, symbol
    Tom> collisions between the two most popular journalling
    Tom> filesystems?  Pa-thetic...

Uh, because ext3 has been more recently been ported to 2.2 and nobody
else has the two together before ?

    Tom> 3) There is no support for version 3.6 filesystems in 2.2.x,
    Tom> so, what good is reiser support on my rescue diskette, if
    Tom> 2.4.x users can't use it?

Well documented on the web page.

    Tom> 4) There seems to be no-one concerned about any of these
    Tom> issues, or working on them, or talking about them.

Probably because most everyone in the Linux world is focussed on newer
issues, 2.4 and later. As with most OSS projects it takes individuals
who are willing to spend the time to scratch their itch.

    Tom> All of this is a problem for me.

    Tom> The bleeding-edge crowd may not be aware of it, but a new

2.2 is bleeding edge - very funny.

    Tom> kernel is about to be released- it is now up to 2.0.40-rc4.
    Tom> That's right, 2.0.40-rc4.  And I can tell you that scsi
    Tom> drivers and network card drivers are still being updated for
    Tom> that.  And the ext2 sparse-super and filesystem-type fixes
    Tom> were backported to 2.0.x.

I think that this is rather riduculous, 2.0 is *extremely* old
now. 2.2 has been damn stable for many months and people have little
excuse for sticking with 2.0, except in very exceptional circumstances
IMO. Now if people who NEED this stuff are willing to backport it then
all power to them but you can't just appear on a mailing list and
start complaining at why this project hasn't done the same; if you
don't like it then start coding, if you don't have time then by all
means ask but don't whine.

    Tom> So, the rest of the world is still willing to devote *some*
            ^^^^
a small part of

    Tom> effort to supporting 2.0.x, (and libc5, for that matter), and
    Tom> *plenty* of effort to supporting 2.2.x, but it seems that
    Tom> reiser doesn't isn't or won't...

Because nobody has had the itch to scratch.

Please, this kind of tone of email is rather unconstructive. There is
only so much time for doing projects whether personal or company
supported, the accusing tone that some people have when that which
they require has not been implemented and for something in they
haven't contributed, either in time or money, is a bit sickening to
me.

Sincerely,

Adrian Phillips

-- 
Your mouse has moved.
Windows NT must be restarted for the change to take effect.
Reboot now?  [OK]
