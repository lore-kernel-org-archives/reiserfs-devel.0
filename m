From: Valdis.Kletnieks@vt.edu
Subject: iosched (was Re: Full of surprises - A reiser4 story from userland)
Date: Wed, 28 Sep 2005 15:52:09 -0400
Message-ID: <200509281952.j8SJq9Uo007371@turing-police.cc.vt.edu>
References: <1127914812.12894.96.camel@laptop> <200509281825.49873.vitaly@namesys.com> <1127921286.12894.106.camel@laptop> <433ABD7B.1010903@slaphack.com> <1127932340.12894.149.camel@laptop>
            <5d8b7b90509281213c95e30c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1127937129_3988P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26317-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Wed, 28 Sep 2005 22:13:52 +0300."
             <5d8b7b90509281213c95e30c@mail.gmail.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Islam Amer <pharon@gmail.com>
Cc: Fionn Behrens <fionn@spamfilter.de>, reiserfs-list@namesys.com

--==_Exmh_1127937129_3988P
Content-Type: text/plain; charset=us-ascii

On Wed, 28 Sep 2005 22:13:52 +0300, Islam Amer said:

> BTW, Previously I had amazing performance with anticipatory
> IO-scheduler ( even more so with genetic anticipatory ) any comments
> on this io-scheduler business, as it stirred up some commotion before.
> Is the performance boost an illusion or is it not.

The performance boost for any of the provided iosched schemes can be
positive, negative, imaginary, or complex(*), depending on the actual workload of
the system, and what reference patterns it generates.

There's 4 in-tree schedulers precisely because each of them has a clear-cut
advantage for some statistic (be it throughput, or latency, or CPU overhead, or
whatever) for some identified workload type.

(*) I suspect that (benchmarks being benchmarks) the chance that the boost
be totally real, with no imaginary component, is very slim.  And everybody
knows that most benchmark results are complex to interpret.. :)

--==_Exmh_1127937129_3988P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFDOvRpcC3lWbTT17ARAvzWAJ0UTBUIsfNQ0zCh/Er5lUmmHRpZpgCg75J4
ln9CKQAGtqGYonxPvLl/+b8=
=VeXj
-----END PGP SIGNATURE-----

--==_Exmh_1127937129_3988P--
