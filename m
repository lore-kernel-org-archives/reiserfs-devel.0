From: Valdis.Kletnieks@vt.edu
Subject: Re: What Filesystem?
Date: Wed, 29 Jan 2003 13:16:19 -0500
Message-ID: <200301291816.h0TIGJ4K006262@turing-police.cc.vt.edu>
References: <3E38378A.8030406@jtmstudio.fsbusiness.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1500342094P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12542-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Wed, 29 Jan 2003 15:20:26 EST."
             <3E38378A.8030406@jtmstudio.fsbusiness.co.uk> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: james@jtmstudio.fsbusiness.co.uk
Cc: reiserfs-list@namesys.com

--==_Exmh_1500342094P
Content-Type: text/plain; charset=us-ascii

On Wed, 29 Jan 2003 15:20:26 EST, James Thompson <james@jtmstudio.fsbusiness.co.uk>  said:

> ... I have done much research in the field of computer /hardware/ 
> suitable for commercial Digital Content Creation (P4 Xeon; Wildcat 
> graphics; ART's "PURE" raytracing PCI render board, etc. ...) and now

Hmm.. so we're looking at high-end rendering, which is usually a CPU hog.
 
>      1. Kernel Patches - pre-empt and low latency;

so I'm not clear on why you're worried about low latency?  Remember that
it *does* come with an overhead - the low-latency stuff is good if you're
more concerned about fast response than total system load (for instance,
on my laptop I'm willing to give up 5% of the CPU if it makes the X server
run perceivably  faster.  If I was doing a lot of rendering, I'd want that
5% for user cycles.

Could you be more specific regarding what sort of content you are making?
(i.e. single frame images suitable for monitor display (1600x1200 and smaller),
or large-format for high-resolution printing (posters, etc), or video, etc..)
The resources needed to produce a 10-minute video clip are different from the
things you'll need to produce a 4 foot x 5 foot poster at 600DPI.
-- 
				Valdis Kletnieks
				Computer Systems Senior Engineer
				Virginia Tech


--==_Exmh_1500342094P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE+OBpycC3lWbTT17ARAok1AKCa0bN9RRamn3/rJjMkCGgaT0sy1wCgjMEs
p9qKg9TTeLqPLL7QdqiPyCs=
=RkH0
-----END PGP SIGNATURE-----

--==_Exmh_1500342094P--
