From: Valdis.Kletnieks@vt.edu
Subject: Re: Fibration questions
Date: Thu, 22 Jul 2004 17:36:43 -0400
Message-ID: <200407222136.i6MLahRF015248@turing-police.cc.vt.edu>
References: <20040721054418.1150715C23@mail03.powweb.com> <40FE0B47.3010600@slaphack.com> <40FF74BA.1050206@namesys.com> <16639.45062.695014.910604@laputa.namesys.com> <20040722143909.GE4990@nysv.org> <200407221957.i6MJvWHB028798@turing-police.cc.vt.edu>
            <20040722210515.GH4990@nysv.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-1235010220P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19756-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Fri, 23 Jul 2004 00:05:15 +0300."
             <20040722210515.GH4990@nysv.org> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Markus =?UNKNOWN?Q?T=F6rnqvist?= <mjt@nysv.org>
Cc: reiserfs-list@namesys.com

--==_Exmh_-1235010220P
Content-Type: text/plain; charset=us-ascii

On Fri, 23 Jul 2004 00:05:15 +0300, Markus =?UNKNOWN?Q?T=F6rnqvist?= said:

> Guys like Dell deploy big-ass servers, if they shipped it with a super-fast
> and advanced secure file system like Reiser4, I very much doubt anyone
> would go "Gee, let's buy this smaller model which costs less but that
> ships with a slower file system, which also happens to be less secure"

This of course explains why IE is the premier web browser on 95% of the
desktops, right? I mean, it's faster and more secure than all the alternatives,
right? ;)

And how many times has the global RAM market been put under severe strain
because the latest Windows upgrade needed more RAM, so everybody went out and
bought more RAM, and more RAM, and more RAM...

The *correct* model is "Gee, let's buy this new box, because the salesman told
us we need at least a Model 9000 to run this app, and *never* *mentioned* that
with proper tuning, we could actually get by with a Model 6000 that costs half
as much, and makes him half as much in sales commission....".

I mean.. *seriously* - think about it for a moment.  A co-worker recently
spec'ed out a Dell 6600 for a project - paid US$20k or so for that one.  I
needed another server for another project, ended up spec'ing a Dell 2650 for
about US$7k.  Now *what* motivation does Dell have to sell both of us 2650's
rather than trying to talk us both into 6600's?  (As it was, Dell got lucky I didn't
go for a box even *smaller* than a 2650... at $7K, trying to save MORE money
isn't worth it.  And I'm quite sure that Sun wasn't overjoyed when we
replaced an E10K with 2 Sunfire 2900's and a number of Sunfire 240's - they
wanted to sell us a third 2900... ;)

OK... not *all* vendors are like that - Apple likes us.  Probably has something to
do with the fact we bought 1,100+ units in one shot to make a supercomputer.
But then, there's *no* vendors that won't do whatever it takes to land a $5M
deal with lots of good PR attached to it...

But seriously - once the purchase price falls under $1M or so, vendors fast start
losing their desire to bend over backwards to help you out...

Also - in what way, exactly, is Reiser4 "more secure"? (Think carefully about
the Linux security model here, and where the LSM hooks are - almost all of it
happens at the VFS layer.  And there's the whole xattr debacle too...)

--==_Exmh_-1235010220P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFBADNqcC3lWbTT17ARAsVIAKDoeg0sf8TsvkFSrYKe7jI/3mai2ACg0vmV
3qWR/pSRB7Zr+OvDA/vETXs=
=G/Z1
-----END PGP SIGNATURE-----

--==_Exmh_-1235010220P--
