From: Valdis.Kletnieks@vt.edu
Subject: Re: ext3 -> reiserfs conversion utility?
Date: Sat, 19 Jun 2004 00:19:55 -0400
Message-ID: <200406190419.i5J4JtJ2017583@turing-police.cc.vt.edu>
References: <57818.192.168.1.12.1087599726.squirrel@192.168.1.12>
            <40D3BA63.70307@slaphack.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-378902989P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19265-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Fri, 18 Jun 2004 23:00:35 CDT."
             <40D3BA63.70307@slaphack.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: David Masover <ninja@slaphack.com>
Cc: Nick Bartos <spam99@2thebatcave.com>, reiserfs-list@namesys.com

--==_Exmh_-378902989P
Content-Type: text/plain; charset=us-ascii

On Fri, 18 Jun 2004 23:00:35 CDT, David Masover said:

> Do backups.  Now.  You are an idiot and/or a cheapskate if you don't
> have backups, because one day something will happen -- probably
> something ridiculously stupid -- and you will need them.  I mean, go
> build a backup server and, if you can afford it, give it something like
> a terabyte raid5 hotplug array.  Do it now.

And if possible, don't rely on the fact that raid5 is redundant.  I know
somebody who worked at a dot-com, and a PHB bought a large 2-terabyte RAID5 in
the days when 2T was still "pretty big".  Said PHB refused to buy a separate
backup, since it was hot-swap RAID5.  Friend voiced objections, and PHB gloated
the first 2 times a single disk died and the system automagically rebuilt onto
a hot spare.

Then poetic justice arrived - a plumbing problem on a floor above caused
multiple thousands of gallons to decide the fastest way to ground level was
through the RAID5. Everybody immediately started updating their resumes,
because they *knew* the company was doomed when all their data went away.
Except for the PHB - his resume used to be on the RAID5...;)


--==_Exmh_-378902989P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFA077rcC3lWbTT17ARAlV3AKDlJF6P1JQDrY5KMVw71FWOVIotBQCg6TRx
9CQ153e13hOd3uTjx5kahW8=
=hJpf
-----END PGP SIGNATURE-----

--==_Exmh_-378902989P--
