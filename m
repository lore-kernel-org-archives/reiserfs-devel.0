From: Fionn Behrens <fionn@spamfilter.de>
Subject: Re: Full of surprises - A reiser4 story from userland
Date: Wed, 28 Sep 2005 17:56:10 +0200
Message-ID: <1127922970.12894.134.camel@laptop>
References: <1127914812.12894.96.camel@laptop>
	 <200509281825.49873.vitaly@namesys.com>
	 <5d8b7b905092807514da5958e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-XzbSmcsvDzfTATtOW4d8"
Return-path: <reiserfs-list-return-26305-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <5d8b7b905092807514da5958e@mail.gmail.com>
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-XzbSmcsvDzfTATtOW4d8
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mi, 2005-09-28 at 17:51 +0300, Islam Amer wrote:

[FQ deleted]

> I don't like to turn LKML into another battleground,

You mean because of fullquote-flames? ;-)
Seriously, I did not post this to lkml (although I was tempted).

> but from one user to another I have to answer this.
>=20
> *You know reiser4 is development code , this is why it isn't included
> in vanilla ( yet ) in the first place.
>=20
> *reiser4 is included in mm and the separate patches from the
> broken-out package should be applied in the order listed in the
> included series file ( usually using quilt ).

Sorry, I never used mm so far. Didn't know that. My fault.

> *reiser4 is sometimes victimized due to bugs in the -mm releases. For
> example I am having problems with a 100% cpu usage of a process called
> " ent:hda7! " cured only by a reboot. The problem has eased a little
> when I replaced the " per-task-predictive-write-throttling". However I
> think the problem still exists.

Sounds very much like what I experienced. As I don't have any other mm
patch installed the code obviously could not be victimized that way.
It is just broken.

> *reiser4 is in a state of flux due to the code changes being made in
> preparation for the review leading to ( hopefully ) its inclusion in
> the kernel.

I'd just wish I had found a sentence like this and a warning on
namesys.com when I began looking for a patch. Everything would have been
so much easier.

> I hope I cleared some of the problems you complained of , and I hope I
> didn't step on someones toes or make someone upset.

Of course not. Actually I might have to apologize:

Because of my good experiences with ReiserFS in the past I had high
expectations. As you correctly and rightfully stated, reiser4 is
development code and that probably means I should not rely on anything.

I just snapped in disappointment and if anyone else thinks I overreacted
then I apologize to you all for any offense taken.
Next time, I will be more careful.

best regards,
		Fionn
--=20
 Taking away civil rights to protect a free democracy is like taking off
 the tires of a car to protect it from flats.=20

--=-XzbSmcsvDzfTATtOW4d8
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBDOr0ajkvYSI4bFywRAqHpAJ4yFqwGQxUHOiZEtWe6lnjANKKbLgCfRLtg
Jt5YG90ZGgKAbEkpA8AETCY=
=yXfY
-----END PGP SIGNATURE-----

--=-XzbSmcsvDzfTATtOW4d8--


