From: Oleg Drokin <green@namesys.com>
Subject: Re: reiserfsprogs 3.6.5-pre2 release.
Date: Wed, 26 Feb 2003 15:42:30 +0300
Message-ID: <20030226154230.A19240@namesys.com>
References: <200302251650.22469.vitaly@namesys.com> <200302251712.45985.vitaly@namesys.com> <20030226015448.1efac468.philippe.gramoulle@mmania.com> <20030226102934.A2659@namesys.com> <3E5CA48C.5070807@namesys.com> <1794518093.20030226131425@tnonline.net> <20030226152441.A16073@namesys.com> <865715375.20030226133422@tnonline.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12935-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <865715375.20030226133422@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anders Widman <andewid@tnonline.net>
Cc: reiserfs-list@namesys.com

Hello!

On Wed, Feb 26, 2003 at 01:34:22PM +0100, Anders Widman wrote:
> >> Would it be possible to lower the time it takes to mount a filesystem?
> >> Currently it takes about 48s to mount my fs:
> > Unfortunatelly there is no easy way.
> > Seems that most of the time is spent reading bitmaps (one bitmap after each 128M of data),
> > and reiserfs reads in all the bitmaps at once during mount.
> I  only  posted  this  because it is discussed how to lower the bootup
> time. The fsck might take a few seconds when optimised, but the actual
> mount of the FS takes much longer.

But this is not good reason to make it even longer, what do you think?
(and blockdev cache is flushed on last device close, so mount won't get
these bitmap blocks from cache).

> How  big  is  each  block  of bitmaps that is being read during mount?

it's of blocksize size (4k for now).

> Would  it  be  possible  to make the reads more efficient? I mean, now

You still need to seek to every of them.
(Other possibility is to read bitmap blocks on 1st access, but this is not very
easy task, I'd say).

> there  would  be 6400 reads on a 800GB FS. From the sound of the disks
> it does not seem as they work at 100% during mount?

Hm. Disk cannot do anything while it is seeking. Also since the seeks are
in one direction, you won't hear any unusual noises, I believe.

Bye,
    Oleg
