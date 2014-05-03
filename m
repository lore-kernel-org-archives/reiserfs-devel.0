From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: reiser4: discard support
Date: Sat, 03 May 2014 22:48:50 +0400
Message-ID: <1461643.AZxFf0Q2dH@intelfx-laptop>
References: <1496741.djsd6PJ1Ae@intelfx-laptop> <4594794.KsdUPSo0Ac@intelfx-laptop> <5363DF88.7060904@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1574509.diK2h7srIU"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=6SXfeCgLeE33c3J7l2zk8f4LXJs7t+U+Sp9yv01vk00=;
        b=rUypDXftIxxGy41ocqNnMXNiSewTLomDYJzQ3a1h84s0ct98cSwHp+f28vgVLdAuse
         9PMHsp4JBUARNf9ZF58sEDkQW4jYM+ignGfVmyh6Eh7fOTBxf/49WuOlW/SSkyZspx06
         aSBGzJLeWeFPk3sIRYD/xr4LxfnnR40jjfbNdowmwQq1ktbi+vCJs4mirpteJ2nSNa5n
         FcOWRCn3DNr7cpxSCrhr3q1gzmQVmvXVaQpQbwWtU9n79yog59bGY3wUqhjDmlO+m1rN
         eIUcA40V1kKimjRSGsg/gPdFUgrXARvZ+uAt+taHYB9P7LvlMDh3FU5HF7IKAD0Far+A
         jCKQ==
In-Reply-To: <5363DF88.7060904@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--nextPart1574509.diK2h7srIU
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Friday 02 May 2014 at 20:10:16, Edward Shishkin wrote:=09
> On 05/02/2014 04:32 PM, Ivan Shapovalov wrote:
> > On Friday 02 May 2014 at 16:07:21, Edward Shishkin wrote:
> >> On 05/02/2014 03:36 PM, Ivan Shapovalov wrote:
> >>> On Friday 02 May 2014 at 13:48:28, Edward Shishkin wrote:
> >>> [...]
> >>=20
> >> We can perfectly populate different "discard trees" in parallel on=

> >> different CPUs.
> >> As to sorting the list: I don't know how to perform it in parallel=
 :)
> >> Default assumptions, that everything is serialized, usually lead t=
o
> >> various
> >> bad-scalable solutions...
> >=20
> > Ah, now I understand what do you mean. If that's about doing less w=
ork
> > under the tmgr mutex,
>=20
> No. This is about minimizing real time.
> We don't know about mutexes. We want to decide, what is preferable:
> populating trees, or sorting the list. There is a chance that the fir=
st will
> be faster in systems with many CPUs, so I suggest to use trees.
> That's all!

OK.. well, I've started with lists anyway. The data structure is (of co=
urse)=20
under an abstraction layer, so we can change it.

>=20
> >   then yes, trees are better than lists.
> >=20
> > BTW, I've seen that reiser4 releases atom lock before allocating an=
other
> > node for a blocknr_set, and that leads to a "do { } while (ret =3D=3D=

> > -E_REPEAT)" loop around the blocknr_set_add_extent() calls. Is this=
 the
> > preferred way of attaching a dynamic data structure to an atom?
>=20
> TBH, I have never looked at the deallocation paths in reiser4: everyt=
hing
> worked fine there.. BTW, why not to use atom's delete_set to discard =
things?
> Could you please take a look?

Blocks used for the journal (wander.c) are deallocated without BA_DEFER=
 set=20
and thus they never hit delete_set. However, we want to discard these.

>=20
> >>> [...]
> >>=20
> >> what explanation do you mean?
> >>=20
> >> Edward.
> >=20
> > A general explanation of how does it work :)
>=20
> I think this is because of historical reasons.
> Such good explanation costs a lot of time and efforts.
> Namesys was a small company, we couldn't afford to have a technical w=
riter.
> Hans insisted on good comments in the source code..

But there aren't much comments there. ;)

I'm now coding the last part - bitmap querying - and I've got a questio=
n: how=20
do we pass reiser4_block_nr parameters?
Many places use pointers, but I do not really understand why (to optimi=
ze for=20
stack frame size on 32-bit archs?) and there is a place=20
(reiser4_dealloc_blocks_bitmap()) where this convention is apparently b=
roken.

And this is tedious, because public interfaces seem to pass start+len, =
but in=20
some places it's more convenient to use start+end...

=2D-=20
Ivan Shapovalov / intelfx /
--nextPart1574509.diK2h7srIU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iF4EABEIAAYFAlNlOhcACgkQxUKljSIMAnDmaAD/ZURFLqWHHkL5dGzFjNQsowW8
nvH97aQs40C4HjnMsWwBAM3QbM00t6gUICSUNmqqMzCQcBjSkOf5Pv6Vmkn+hCby
=SP6g
-----END PGP SIGNATURE-----

--nextPart1574509.diK2h7srIU--

