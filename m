From: Ryan Underwood <nemesis-lists@icequake.net>
Subject: Re: Reiserfs Data Recovery
Date: Mon, 8 Mar 2004 15:59:19 -0600
Message-ID: <20040308215919.GB11093@dbz.icequake.net>
References: <404C81B9.4050504@nsanity.com> <20040308184124.GE5817@dbz.icequake.net> <404CC8AA.9020405@nsanity.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eJnRUKwClWJh1Khz"
Return-path: <reiserfs-list-return-17128-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <404CC8AA.9020405@nsanity.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Nick Vahalik <nick@nsanity.com>
Cc: reiserfs-list@namesys.com

--eJnRUKwClWJh1Khz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 08, 2004 at 01:25:30PM -0600, Nick Vahalik wrote:
> >
> >Note: whatever you do, do _not_ touch the second drive of your array
> >with reiserfsck.  Assuming it is still in the state where it was before
> >...
> >
> I thought I mentioned that this was a Raid 0.  There is no mirroring. =20
> It's a stripe.
> I know.  Just tell me what I already assumed:  I'm screwed.=20

Whoops.  In your initial post:
----------------
Hello,

System: Slackware 9.1
Dual P3 1Ghz/133Mhz FSB
1 GB Ram PC133 Ram
Running Hardware Raid1 on top of a highpoint 37x2 raid controller
2x80 GB Drives
----------------

:-(
Yeah, if it's raid 0, you don't have much of a chance besides giving the
filesystem as it is to someone who knows exactly what they are doing wrt
ReiserFS.

I'm having trouble figuring out how exactly a system crash would have
wiped out your super-block...

> Well, I was thinking more of forensics analysis tools... (Network=20
> Security Major at ***********) and we have some neat=20
> equipment/software over there... but I'm not sure how much of it will=20
> work with ReiserFS...

Without something that understands the logical structures of the
specific filesystem in question (Reiser), it will be difficult to get
anything done.  I can't really offer any help myself because I was in
the same boat you were a few weeks ago.  Fortunately, it was just /usr,
not my life work.  Plus, it was apparently a conspiracy on my part to
destroy my data, judging from the steps I took (wiping out 2 perfectly
good backups in the process of trashing it); it wasn't my system
randomly borking itself like yours seems to have.

I wish I could offer more help, but my advice based on my own experience
is to not do anymore damage than has already been done and to get expert
help.  In the end I could barely retrieve anything from my filesystem
and in the process messed up any chances anyone else would have had to
help me out.  Doh! :)

--=20
Ryan Underwood, <nemesis@icequake.net>

--eJnRUKwClWJh1Khz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFATOy2IonHnh+67jkRAtUhAJ9AwyR4I1PaK3yKqCv++MgqmRsmvwCghKtl
t+eQDu7voWw7ytpHLA8EPW0=
=YFFe
-----END PGP SIGNATURE-----

--eJnRUKwClWJh1Khz--
