From: Valdis.Kletnieks@vt.edu
Subject: Re: What Filesystem?
Date: Wed, 29 Jan 2003 15:09:38 -0500
Message-ID: <200301292009.h0TK9c4K008318@turing-police.cc.vt.edu>
References: <3E38378A.8030406@jtmstudio.fsbusiness.co.uk> <200301291816.h0TIGJ4K006262@turing-police.cc.vt.edu>
            <200301292043.38367.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1544063254P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12549-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Wed, 29 Jan 2003 20:43:38 +0100."
             <200301292043.38367.Dieter.Nuetzel@hamburg.de> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: james@jtmstudio.fsbusiness.co.uk, reiserfs-list@namesys.com

--==_Exmh_1544063254P
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, 29 Jan 2003 20:43:38 +0100, Dieter =3D?iso-8859-1?q?N=3DFCtzel?=3D=
 said:

> All low latency and pre-emption tests have showed _improved_ throughput=
 (Yes)
 =

> and much better "multi media" (video/audio) "experience" ;-)
> No measurable overhead an single and SMP systems (both Athlon).
> That's why it is in 2.5/2.6.

Yes, but my *point* was that if the box is busy doing a 5-hour rendering
job, the low-latency *wont make a difference*.  If you're doing audio wor=
k
or video captures, yes the low-latency/preempt stuff will help.  If you'r=
e
in a single thread that's CPU-bound, there's no need to go installing 2.5=

to get it.

> But you want to have the much better "task switching behavior" together=
 with =

> the "brand new" O(1) scheduler.

You want that *if* the actual load will benefit from it.  See my comment
above about rendering...

> You mean single vs 2-/4-/8-/etc. (NUMA) SMP systems or even clusters? ;=
-)

Some things are doable with a single CPU, some things need the NUMA stuff=
,
other things can use a Beowulf.  Thus the need to quantify what the actua=
l
requirements are.  Video editing will bottleneck on different things than=

photorealistic rendering of graphics.

-- =

				Valdis Kletnieks
				Computer Systems Senior Engineer
				Virginia Tech


--==_Exmh_1544063254P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE+ODUCcC3lWbTT17ARAqNFAKChPmLgKzByNFJPq2VMpTejNopssgCg/yaO
UOcfivM+PSeD/liYC0pd+Po=
=5NI5
-----END PGP SIGNATURE-----

--==_Exmh_1544063254P--
