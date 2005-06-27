From: Prakash Punnoor <lists@punnoor.de>
Subject: Re: reiser4 plugins
Date: Tue, 28 Jun 2005 01:06:54 +0200
Message-ID: <42C0868E.4080003@punnoor.de>
References: <42BB7B32.4010100@slaphack.com> <200506240334.j5O3YowB008100@laptop11.inf.utfsm.cl> <20050627092138.GD11013@nysv.org> <20050627124255.GB6280@thunk.org> <42C0578F.7030608@namesys.com> <42C05F16.5000804@xfs.org> <20050627202841.GA27805@thunk.org> <42C06873.7020102@xfs.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig74B8E31CDC1CD22755FBC7DA"
Return-path: <reiserfs-list-return-24726-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42C06873.7020102@xfs.org>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Steve Lord <lord@xfs.org>
Cc: Theodore Ts'o <tytso@mit.edu>, Hans Reiser <reiser@namesys.com>, Markus T?rnqvist <mjt@nysv.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, David Masover <ninja@slaphack.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

--------------enig74B8E31CDC1CD22755FBC7DA
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Steve Lord schrieb:

> I see no way short of hardware fixes of avoiding the general problem of
> a system failing in an ugly manner like this. Unless you write everything
> to disk twice (i.e. journal all data), you can still end up with a
> legitimate set of metadata, and the master copy of your employee
> database full of nasty little bits of corruption.

If I as a user may add my own little experience with different fs on my
computer, where I tend to use kernels or features that cause my machine to
(hard) lock up:

2.4.2x kernel and reiserfs (V3): This was the only one which really managed to
smoke my partition...

2.6.x-test-y till 2.6.x stable kernel and reiserfs (V3): I did a short
intermezzo with xfs but at that time it felt too slow to bear, so I gave
reiserfs another chance. And here it was very robust. No lock-up did serious
damage to the data. Only currently accessed files were partly overwritten with
@^@^@^ and so on...

After a year or so of heavy usage the formerly fast reiserfs partition became
more and more slow till I got sick of it. So I tried JFS and forced a hard
lock. Data was OK, but (probably error in gentoo scripts) fsck wasn't
automatically called (or failed, I don't remember) and I had to do it by hand,
which was a major annoyance - I thought then.

So I gave ext3 a try. Very robust, but at the same time slooow. I couldn't
bear it after some months. So I gave xfs another try. Yes, now it felt much
better. Still not that fast as reiserfs, IIRC, but better than the first time
I tried. I am still having xfs on / and it works pretty well, and is rather
robust against hard locks with about the same amount of data losing as
reiserfs. But what annoys me very much, is that I have to run xfs_repair by
hand and by booting from another partition. Even after a hard lock, the
partition mounts w/o problems and everything seems OK, but it only seems like
that. In fact after some hours/days of use, you'll notice oddities, like files
or directories which cannot be removed and things like that. After running
xfs_repair everything is back in order.

In between I gave an alpha (or rather several alphas) of reiser4 a try - but
not on /, just on /usr. Well, I wouldn't say it was extraordinary fast. In
fact it felt slower than reiserfs V3, but much more space efficient. And to my
surprise it was very robust as well. Hard-locks were no problem. Only annoying
then was, that unmounting regularly produced oops but later versions corrected
that. But nevertheless it didn't survive, as like V3, with time V4 became
slower and slower. In this case no year was needed, but just one month or
alike. So end of test...but in fact I'll give V4 another go in the near future.


All in all I can say that every fs I tested was able to not smoke all of my
data, even using an instable machine - but only ext3, reiser v3 and v4 were
non-annoying. But xfs is majorly annoying in that respect. I hope that new
versions will be able to keep consistency w/o having to run xfs_repair every
time after a lock-up...

But what I don't understand is, that sometimes even files, which were only
opened for reading, got overwritten with @^@^@ after a lock-up. I don't
understand the logics here, how this could happen.

Thx for your time,

Prakash

--------------enig74B8E31CDC1CD22755FBC7DA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFCwIaOxU2n/+9+t5gRAq6nAJ93a7h9a9OXiuJe+LUSE+W5xC5AcgCgr7XH
Xk0YijxdUurGBFZjNpL72RQ=
=Dt62
-----END PGP SIGNATURE-----

--------------enig74B8E31CDC1CD22755FBC7DA--
