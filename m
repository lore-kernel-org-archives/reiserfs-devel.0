From: Tom Oehser <tom@toms.net>
Subject: RE: Symbol collisions in patch?
Date: Wed, 3 Apr 2002 06:51:23 -0500 (EST)
Message-ID: <Pine.LNX.4.44.0204030639310.647-100000@conn6m.toms.net>
References: <NDBBJPAGKLCMDEIEKOPBMEPGGNAA.mailinglists@websitemanagers.com.au>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <NDBBJPAGKLCMDEIEKOPBMEPGGNAA.mailinglists@websitemanagers.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adam Goryachev <mailinglists@websitemanagers.com.au>
Cc: reiserfs-list@namesys.com


> If anyone was paranoid enough to *not* move up past 2.0.x then surely they

Paranoia likely has nothing to do with it- think about embedded systems,
there are still situations where *1.x* kernels are in use on 2-megabyte
machines.

> Why spend the next 6 months/12 months (I have no idea how long) developing
> support for 2.0 and 2.2 kernels with reiserfs when by that stage, even the

It wouldn't take that long to fix the symbol collisions and apply the
known-missing patch.  It probably wouldn't take that long to backport the
3.6 stuff.

> left, but really, is it worth a few hundred people working on code that will
> be used by only one or two people ??

Hyperbole.  It wouldn't take hundreds of people to make the 2.2.20 patch
stable.  Fixing the symbol collisions and applying the umount locking?
Hundresds of people and 6/12 months?

> Fine, but since what is supported by 2.2 that is not supported in 2.4?? ie,
> why would you build a rescue disk (ie assume this is supposed to be a one size
> fits all rescue disk) based on a 2.2 kernel and not use a 2.4 kernel???

If the kernel wasn't bloating by hundreds of K for a feature-equivalent
build, of course I would use 2.4.  With the exact same feature set, a 2.4
kernel is much much bigger,  approaching *twice the size* of a 2.0 kernel.

Look, not backporting 3.6 support to 2.2.x, I can understand, if not agree
with.  Nor do I agree it would take "6 months/12 months" or "a few hundred
people working on code".  But not maintaining the basic usability, leaving
in the oops producing bugs, not fixing the symbol collisions- that makes
me skittish.  You should just take the 2.2.x patches completely off the
web site, not leave them up for people to oops.

-Tom

