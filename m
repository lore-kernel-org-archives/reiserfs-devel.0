From: "Adam Goryachev" <mailinglists@websitemanagers.com.au>
Subject: RE: Symbol collisions in patch?
Date: Wed, 3 Apr 2002 17:33:31 +1000
Message-ID: <NDBBJPAGKLCMDEIEKOPBMEPGGNAA.mailinglists@websitemanagers.com.au>
References: <Pine.LNX.4.44.0204022130330.32751-100000@conn6m.toms.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <Pine.LNX.4.44.0204022130330.32751-100000@conn6m.toms.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> The bleeding-edge crowd may not be aware of it, but a new kernel is about
> to be released- it is now up to 2.0.40-rc4.  That's right, 2.0.40-rc4.
> And I can tell you that scsi drivers and network card drivers are still
> being updated for that.  And the ext2 sparse-super and filesystem-type
> fixes were backported to 2.0.x.

If anyone was paranoid enough to *not* move up past 2.0.x then surely they
would be paranoid enough to *not* use something so modern as a journalled
filesystem which has only just been written and simply 'back-ported'... I
mean, if the 2.2.x kernels are not tested well enough, then surely the
reiserfs code has not been tested well enough???

> So, the rest of the world is still willing to devote *some* effort to
> supporting 2.0.x, (and libc5, for that matter), and *plenty* of effort to
> supporting 2.2.x, but it seems that reiser doesn't isn't or won't...

Why spend the next 6 months/12 months (I have no idea how long) developing
support for 2.0 and 2.2 kernels with reiserfs when by that stage, even the
super paranoid will have moved to 2.2 .... OK, there might still be 2 users
left, but really, is it worth a few hundred people working on code that will
be used by only one or two people ??

> So, at the moment, I'm just going to put ext3 support in there, and put
> fixing the patch and all the symbols and backporting 3.6 support on my
> personal low-priority back burner...

Fine, but since what is supported by 2.2 that is not supported in 2.4?? ie,
why would you build a rescue disk (ie assume this is supposed to be a one size
fits all rescue disk) based on a 2.2 kernel and not use a 2.4 kernel???

Surely at the point where one is looking for a rescue disk, you are not hugely
concerned about stability, all you want is enough to mount your disks, and
fixup whatever issue is stopping you from booting your standard kernel?

Regards,
Adam

