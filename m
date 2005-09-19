From: Ritesh Raj Sarraf <riteshsarraf@users.sourceforge.net>
Subject: reiser4 mount options
Date: Mon, 19 Sep 2005 05:42:46 +0530
Message-ID: <dgkvq7$5lo$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <reiserfs-list-return-26049-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hello People,

Despite the fact said that reiser4 is not stable so isn't included in
mainline kernel, I trusted Hans Reiser's statement that they've not been
able to crash the fs in the labs.

I just migrated my laptop from plain partitions with ext3 to Reiser4 on LVM.
Till now, I'm pretty happy with the performance.
2.2 gigs of files in ext3 show 1.9 gigs in Reiser4. Thanks to all your work.
Disk access is almost doubled. I haven't measured it, I just feel it.

Thanks to all of you.

Some questions,
What mount options should one use for laptops ? (Right now I'm using
"defaults")
When can we have the reiser4 version of filesystem resize utility ?

Regards,
rrs
- -- 
Ritesh Raj Sarraf
RESEARCHUT -- http://www.researchut.com
Gnupg Key ID: 04F130BC
"Stealing logic from one person is plagiarism, stealing from many is
research."
"Necessity is the mother of invention."
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFDLgKD4Rhi6gTxMLwRAiYJAJ4yFlOCFC3K3vJaafIgSqASW0T/dgCggts4
TGWhaSnYT99Hfigts8au5MY=
=mxiM
-----END PGP SIGNATURE-----

