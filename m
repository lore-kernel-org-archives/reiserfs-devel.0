From: Valdis.Kletnieks@vt.edu
Subject: Re: The situation at hand and in the future
Date: Mon, 07 Jun 2004 13:35:17 -0400
Message-ID: <200406071735.i57HZHnT026745@turing-police.cc.vt.edu>
References: <20040527200127.GS4990@nysv.org> <40C1510F.5020608@slaphack.com> <200406050730.i557UouE026516@turing-police.cc.vt.edu>
            <200406051207.43706.chrivers@iversen-net.dk>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-1774907290P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19068-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Sat, 05 Jun 2004 12:07:43 +0200."
             <200406051207.43706.chrivers@iversen-net.dk> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Christian Iversen <chrivers@iversen-net.dk>
Cc: reiserfs-list@namesys.com

--==_Exmh_-1774907290P
Content-Type: text/plain; charset=us-ascii

On Sat, 05 Jun 2004 12:07:43 +0200, Christian Iversen <chrivers@iversen-net.dk>  said:

> This will fix the problem of throughput, but wont it give a significant 
> latency?

Probably not - remember that the trip out to disk cost you anywhere from 6ms to
10ms or so (remember that 5ms is 200 IO/sec), and the crypto shouldn't add more
than a small fraction of a millisecond.

Ballpark math - if you can do the crypto at 20 Mbytes/sec, which is slow for a
modern cipher and CPU, you add about 0.5ms for the last 4K block (assuming you
pipelined the preceeding blocks and overlapped the cryto and I/O).  If your
system is running so close to the edge that the difference between 6ms and
6.5ms sinks it, you have BIGGER problems over in the capacity-management
area.....


--==_Exmh_-1774907290P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFAxKdUcC3lWbTT17ARAlKDAKCryaYCpuSmcZmsKcwZRbcc7z118wCggj6U
HDqN003WqeyxE7Dx5At1mvc=
=KhGa
-----END PGP SIGNATURE-----

--==_Exmh_-1774907290P--
