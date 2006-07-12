From: Valdis.Kletnieks@vt.edu
Subject: Re: any way to disable fsync?
Date: Tue, 11 Jul 2006 23:14:02 -0400
Message-ID: <200607120314.k6C3E2hH009619@turing-police.cc.vt.edu>
References: <op.tcjl3meld4os1z@localhost> <200607112157.k6BLvUqk028924@turing-police.cc.vt.edu> <BAYC1-PASMTP0152E46B1E5184F223039DBF680@CEZ.ICE>
            <44B43CA8.7010505@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1152674041_8815P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28964-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Tue, 11 Jul 2006 17:04:56 PDT."
             <44B43CA8.7010505@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: Toby Thain <toby@smartgames.ca>, =?UTF-8?B?xYF1a2FzeiBNaWVyendh?= <prymitive@pcserwis.net>, "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

--==_Exmh_1152674041_8815P
Content-Type: text/plain; charset=us-ascii

On Tue, 11 Jul 2006 17:04:56 PDT, Hans Reiser said:
> There are legitimate applications where the value of data is low enough
> and the load is high enough, that losing the database upon crash is ok.
>
> I have mixed feelings about making it a mount option for reiser4 because
> many users will not know what they do.  In the end though, I should just
> sell the rope and advise but not control what people do with it.   If
> someone writes it I will take a mount option patch to disable fsync iff
> it comes with documentation that has a lot of warnings.

Two things to consider before writing code:

1) Should it be done at the VFS level instead of in the filesystem?
Architecturally, it might be better there, so it applies to ext3 and jfs
and others too... 

2) Alternatively, should it be done on a per-file basis (possibly
flagged with a chattr or similar)?  It can't be done as an open()
flag or ioctl(), because you're trying to override what the code does...
That way, you can mitigate any fsync() load caused by one file, and
still not leave yourself open to being screwed by some other application
that tries to fsync() in other directories on that filesystem.  It
would be Really Bad if /home/fred/db23.sqlite gets corrupted because
the filesystem was mounted -nofsync because of /home/george/moby.sqlite
overhead....

--==_Exmh_1152674041_8815P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.4 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFEtGj5cC3lWbTT17ARAkaEAKDHjWDAhpr26HbGe/L+zl1tT/mKcwCff3Na
piHsOTwQjApVKyCQWLlZOEU=
=qcCR
-----END PGP SIGNATURE-----

--==_Exmh_1152674041_8815P--
