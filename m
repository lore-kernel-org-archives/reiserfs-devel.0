From: Valdis.Kletnieks@vt.edu
Subject: Re: On a free repacker
Date: Mon, 24 May 2004 17:54:38 -0400
Message-ID: <200405242154.i4OLsc5P006953@turing-police.cc.vt.edu>
References: <20040519192831.GL24604@nysv.org> <200405201028.13184.reiser@namesys.com> <20040520184054.GR24604@nysv.org> <40AEBBA0.6060606@namesys.com> <20040521184451.GS24604@nysv.org> <200405211902.i4LJ25RI016978@turing-police.cc.vt.edu>
            <20040524203016.GA4990@nysv.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_462512P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18835-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Mon, 24 May 2004 23:30:16 +0300."
             <20040524203016.GA4990@nysv.org> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Markus =?UNKNOWN?Q?T=F6rnqvist?= <mjt@nysv.org>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

--==_Exmh_462512P
Content-Type: text/plain; charset=us-ascii

On Mon, 24 May 2004 23:30:16 +0300, Markus =?UNKNOWN?Q?T=F6rnqvist?= said:
> On Fri, May 21, 2004 at 03:02:05PM -0400, Valdis.Kletnieks@vt.edu wrote:
> 
> >Larry McVoy's BitKeeper licensing might be an interesting model to follow.
> >Not sure if you can make it work for a repacker thought....
> 
> I must look into this. (Note, you can also enlighten me on this, since
> I don't think I'll look into it yet).

BitKeeper is a licensed package that companies have to shell out
money to use - but Larry has a "no-cost for open-source development" license:

http://www.bitkeeper.com/Sales.Licensing.Overview.html

Basically, if you use it for free, you have to participate in their OpenLogging
project, which basically forces open-sourcing the package being maintained via BitKeeper...

Intel has a similar restricted no-cost license for their C/C++ compiler
suite: http://www.intel.com/software/products/compilers/clin/noncom.htm
(basically, you may not get the same instant liveware support that paying
customers do, and you can't use it to build binaries for resale or commercial
use)....

QT's dual license is interesting too - "Pay us the bucks for a license, unless
your package is GPL'ed".

You might want to see if a "free for personal-use, academic, and non-profit
organization use, but use on any machines in a for-profit requires a paid license"
works for you....


--==_Exmh_462512P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFAsm8dcC3lWbTT17ARAmSKAKChmu95uwwiA25OrBSWj9QP6B4l6wCfXE0t
PAQuQTUa7Sh+oYklNhazMpE=
=7+Og
-----END PGP SIGNATURE-----

--==_Exmh_462512P--
