From: Christian Trefzer <ctrefzer@gmx.de>
Subject: Re: Ebuild/rpm/deb repo's (was Re: reiser4 can now bear with filled fs, looks stable to me...)
Date: Wed, 9 Aug 2006 09:22:16 +0200
Message-ID: <20060809072216.GB13915@hermes.uziel.local>
References: <11910177823.20060731232849@wp.pl> <44CE7A3A.2010503@slaphack.com> <1256888283.20060801132818@wp.pl> <1154455834.10745.21.camel@localhost> <1692247736.20060801231255@wp.pl> <916440956.20060806162316@wp.pl> <20060807092435.GA11596@zeus.uziel.local> <44D773D6.4020504@slaphack.com> <20060808095658.GA6834@hermes.uziel.local> <44D95E26.8040309@slaphack.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qtZFehHsKgwS5rPz"
Return-path: <reiserfs-list-return-29547-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <44D95E26.8040309@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: David Masover <ninja@slaphack.com>
Cc: Maciej =?utf-8?Q?So=C5=82tysiak?= <pysiak.satriani@wp.pl>, reiserfs-list@namesys.com

--qtZFehHsKgwS5rPz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline

On Wed, Aug 09, 2006 at 12:01:42AM -0400, David Masover wrote:
> A warning isn't good?  Would you rather it be an error?
Of course not. It merely appears inconsistent to offer a root fs choice
that may cause severe problems at bootup time.

When I went to install my first SuSE (brand-new 6.1 at that time) I
looked up the huge printed manual: what are my options? OK there weren't
many at the time ; ) But there was the >1023cyl problem, being a careful
guy I opted for a separate /boot at the start of the disk, for example.
Better safe than sorry. And if there had been a choice in terms of file
systems (ext2 was the only way afair) there would have been a decision
as well. Now say I carefully weigh different aspects of different
solutions, only to find out that my decision was "not so good" and will
possibly cause problems _unless_ I play around with strange mount
options that _disable_ some of the features supporting my decision.

Knowing trouble lies ahead of course is better than just running into it
: )

> Some people would like to test Grub's XFS support...
Sure thing. But those might not want to do this on their production
machine, anyway, and test something more bleeding-edge than what distros
ship at the time. Presuming there is ongoing development, that is.


> It's not necessarily broken, just potentially unreliable, and
> difficult to work with (you have to set arcane mount options or
> somesuch).  Same for ReiserFS3, by the way.
All that, especially "unreliable", is not something your average user is
likely to accept. People have been cursing the whole x86-pc hardware for
the mess that mainstream software (M$ mainly, but no need to copy their
mistakes) has been for the past two decades. I've been asked by folks
more than once if switching to a mac will ease their pain. So what a
distro installer wants to do is remove all the options from anything but
"expert mode" that might cause the slightest hickup.

> Really, while Grub is useful, it's a rather large duplication-of-code
> effort.  XOSL is even moreso, especially considering it doesn't
> support Linux or multiboot natively -- it must boot Grub or Lilo in
> order to run Linux or HURD.  Why aren't we using kexec for this
> already?
This is way beyond my knowledge, sorry. But I like kexec a lot, just
wonder how to get to the point where kexec can be used _without_ linux
up and running already...


> It's called "backup and restore."  Or did you have a different idea
> for how to convert an existing installation to another root FS, or do
> a fresh installation without nuking your partitions anyway?
Well, there is convertfs, fsconvert (which i.e. _is_ backup&restore),
parted, etc. There are ways, some are safe, most are not. But I am
afraid we have gone way OT by now.

What I had in mind all the way basically was the distro user / end user
experience which should be as uncomplicated as possible, while still
leaving choices. But when it comes to "advanced" file systems, these
choices come at the price of a more sophisticated setup or lack of
reliability, as you already pointed out. But how do you explain to a
linux newbie: use ext2|3 for / due to bootloader issues _or_ something
funky, yet with funkyness partly turned off for bootloader
compatibility, _or_ use a tiny ext2 /boot and feel free to fsck&mount as
you damn please.

Most people just don't care anyway, and those who do will want to know
why. And telling them that otherwise it won't work (without extra care)
yields the question, "why not?", and you might _not_ want to try
explaining the entire situation from within the installer help text. Or
maybe that would be the way to go? Who knows how much people actually
read in the end, before they just quit - worrying, deciding, or even
installing the thing at all.

And now, go easy on me! This was never intended as a debate of colliding
opinions - call it brainstorming : )

Kind regards,
Chris

--qtZFehHsKgwS5rPz
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iQIVAwUBRNmNJqnY3eLOiwZcAQrMMA//Qe3DmYncw+QH4ruHUnUakOvaPZZO9CeN
Hk2qBLXSn2xF3oMVVUZJozFuKe+weR2R8XvsOD2UZ5glx6uoPmgLGr8eyPyqYTx5
aNbZ+wKMqHH+rpGZqt9Ab37WdVW5RMcv5MqcJ1vPTc/CEUhun2oO8IF+739PX42o
nb3QC+s5xBM26kP6NT1HKlkuyLRPkySRBWzTGa4nor81t/sQhNsV5y1DTcyUMW6I
rAK6skJ9Bz4s+uDBpnmZYZoR6dSB31JLmPdzmWycRkPGk9Z4GORkeULxl6o7x4Re
Yb8pDxH9CrKHUlmhyE2iCdhkK+49kJTkPhJ4pyEnB98BjSjHSP8ijJgdyco146tw
tnNIpcCrKVAKcIfDyveDYKQifg4lfre+dGFMNUAZm0QSnme0v/+kKol6duiOrPYG
2Q8UzzA9EDMwUDg8yo3xis9dwlqPFIjWXmi1CB1UBCG/JqVdQHBKLS2uXRSgnlFs
NSm+aISo3XDxn7/eEBlIesB4iw+xBLPsqwuh0za1GkB/WyKzBfP7XhzIIQuLQIJs
QPOFTkrbPo5RAh5WwBdS95oe4+w2SfXjTOpsZfKOs4I+Km+MtiNzvbn9MPd+W9Gd
qudmrzPGq93LK0VLSrxF5KWIJXDcpoe8iLqKPyrbItUuen7v6cZr9PR0l9EfbKI6
AtezUjOdoQc=
=H2yQ
-----END PGP SIGNATURE-----

--qtZFehHsKgwS5rPz--

