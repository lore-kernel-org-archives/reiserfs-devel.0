From: Valdis.Kletnieks@vt.edu
Subject: Re: Re[2]: reiser4.1
Date: Fri, 04 Mar 2005 02:55:52 -0500
Message-ID: <200503040755.j247tsK0001173@turing-police.cc.vt.edu>
References: <4461b4b458db80949fe1830f90501153@hotmail.com> <1109776277.3504.469.camel@tribesman.namesys.com> <42263473.7050900@namesys.com>
            <37288019.20050303095520@wp.pl>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1109922952_6800P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Thu, 03 Mar 2005 09:55:20 +0100."
             <37288019.20050303095520@wp.pl> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Pysiak Satriani <pysiak.satriani@wp.pl>
Cc: reiserfs-list@namesys.com

--==_Exmh_1109922952_6800P
Content-Type: text/plain; charset=us-ascii

On Thu, 03 Mar 2005 09:55:20 +0100, Pysiak Satriani said:

> I remember Hans saying that nowadays CPUs are so fast, they compress
> faster than HDDs move the heads around and do the writes. So compression,
> if done properly, can be with no negative impact to speed.
> 
> Can you say what level of compression with which processors would handle
> it without speedloss?

IBM's AIX 4.3 and later support LZ compression on their JFS file system.
I was able to measure a 10-15% speed-up by converting /usr to compressed
even on a 133MZ Power604e chip because even back then, it was faster to
read half as many blocks off a SCSI disk and decompress.

So it's been at least a potential win for a decade or so, assuming your
filesystem is able to deal well with fragments (you can't really win unless
you take a 4K or so logical block, compress it to some number of 512-byte
chunks, and then store the resulting chunks cheaply - JFS does the
blocks-and-frags efficiently, so it's easy to win.  On the other hand,
it would be dreadful for Reiser3 - imagine having to do tail packing
for *every block* (which is what you end up doing, sort of...)

--==_Exmh_1109922952_6800P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFCKBSHcC3lWbTT17ARApFLAKC/Vn6wolM5+WxTaFPxOEn1O3tCfgCfb1dW
LY3Udg9wjR0v8qneUqrchAY=
=Ke0m
-----END PGP SIGNATURE-----

--==_Exmh_1109922952_6800P--
