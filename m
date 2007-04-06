From: Valdis.Kletnieks@vt.edu
Subject: Re: Reiser4. BEST FILESYSTEM EVER.
Date: Thu, 05 Apr 2007 23:12:07 -0400
Message-ID: <19029.1175829127@turing-police.cc.vt.edu>
References: <46157B5B.5000602@gmail.com> <1175817921.18400.1183285196@webmail.messagingengine.com> <461592FB.5060507@zytor.com> <1175819681.20754.1183287946@webmail.messagingengine.com> <461596DE.2020802@zytor.com>
            <1175823288.25662.1183293506@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1175829127_4670P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1767532AbXDFEeT@vger.kernel.org>
In-Reply-To: Your message of "Thu, 05 Apr 2007 18:34:48 PDT."
             <1175823288.25662.1183293506@webmail.messagingengine.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: johnrobertbanks@fastmail.fm
Cc: "H. Peter Anvin" <hpa@zytor.com>, Ignatich <ignatich@gmail.com>, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

--==_Exmh_1175829127_4670P
Content-Type: text/plain; charset=us-ascii

On Thu, 05 Apr 2007 18:34:48 PDT, johnrobertbanks@fastmail.fm said:

> If they are accurate,.... THEN they are obviously very relevant.

Erm. No. They're not "obviously" very relevant.

I could hypothetically create a benchmark, that's accurate and repeatable,
that shows that reiser4 is able to wash a herd of elephants exactly 11.458%
faster than ext3.  And you would, of course, say "But elephants have nothing to
do with file systems", Because they aren't relevant to file systems.

Similarly, we've seen benchmarks that show some patch improves NUMA performance
by 5% - and those aren't relevant on my laptop because my laptop doesn't do
NUMA.  And a benchmark of file system performance is only as relevant as it
reflects *your* application's use of the filesystem - how fast it can create
and remove tiny files isn't relevant if your use of the filesystem is to store
large files with long sequential read/write patterns.  And the level of
compression isn't very relevant if you're using the partition to store
already-compressed audio or video.

I know somebody who defines a "relevance index" for things, and the measure
is "how many cubicles do I have to go to find somebody who actually cares
about ABC?" - and for him, that's itself a relevant index, because if it's
0, *he* cares, and if it's 1, his immediate neighbors care and will cause him
grief if ABC is a problem.   People who are 5 or 6 cubicles away are less
likely to give him a hard time, and the people who are 15 to 20 cubicles away
are in an entirely separate building. :)

--==_Exmh_1175829127_4670P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFGFbqHcC3lWbTT17ARAiOgAKCYQva9/FsF9T61cswC5dzGg3oAnwCeLUb2
wBTWiHWqKZPaI2PjwewF28A=
=L73D
-----END PGP SIGNATURE-----

--==_Exmh_1175829127_4670P--
