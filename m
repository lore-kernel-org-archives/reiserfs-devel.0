From: Valdis.Kletnieks@vt.edu
Subject: Re: back up to disk
Date: Wed, 16 Oct 2002 00:05:09 -0400
Message-ID: <200210160405.g9G459CH002638@turing-police.cc.vt.edu>
References: <20021015224213.4BBAA1AEC13E@server5.fastmail.fm>
            <3DACBDB5.9020303@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-29476938P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11708-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Wed, 16 Oct 2002 05:15:33 +0400."
             <3DACBDB5.9020303@namesys.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

--==_Exmh_-29476938P
Content-Type: text/plain; charset=us-ascii

On Wed, 16 Oct 2002 05:15:33 +0400, Hans Reiser said:

> What I had heard was that they generally slowed peformance, but maybe my 
> info is old.

Even back in the days when an IBM RS6000-220 (66mz 601 chipset) was a "new"
machine, I found it actually gave a 20-30% total throughput boost, because
even if the CPU wasn't blazing fast, it was faster to read 3-5 512 byte
blocks off the disk and decompress them to get a 4K filesystem block than
it was to actually read all 8 512-byte blocks.  Among other things, you
get back half your disk throughput, so you can sustain twice the I/Os....
-- 
				Valdis Kletnieks
				Computer Systems Senior Engineer
				Virginia Tech


--==_Exmh_-29476938P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE9rOV1cC3lWbTT17ARAp1/AJkBVZL9+IYuGV8/O9WpTMGdqXiqvQCg1wEc
FEBlMoWL8n2W6CwjJ6PbLOI=
=LvVR
-----END PGP SIGNATURE-----

--==_Exmh_-29476938P--
