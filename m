From: Valdis.Kletnieks@vt.edu
Subject: Re: snapshot, checkpoints
Date: Fri, 04 Jun 2004 15:25:35 -0400
Message-ID: <200406041925.i54JPZgp025255@turing-police.cc.vt.edu>
References: <20040527065259.99429.qmail@web51306.mail.yahoo.com> <1085641393.1915.199.camel@tribesman.namesys.com> <20040527092727.GO4990@nysv.org>
            <20040604131005.hmvps8wcw4sccgcs@www.wagland.net>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1219181512P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19016-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Fri, 04 Jun 2004 13:10:05 +0200."
             <20040604131005.hmvps8wcw4sccgcs@www.wagland.net> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Paul Wagland <paul@kungfoocoder.org>
Cc: Markus TXrnqvist <mjt@nysv.org>, Vladimir Saveliev <vs@namesys.com>, tdwebste2@yahoo.com, reiserfs-list@namesys.com

--==_Exmh_1219181512P
Content-Type: text/plain; charset=us-ascii

On Fri, 04 Jun 2004 13:10:05 +0200, Paul Wagland said:

> Can't the same functionality be created with device mapper though? At least
> under linux anyway?

You'd need 2 things:

1) *very* recent patched device mapper (I think patches for snapshot support
went by on LKML just day before yesterday or so).

2) You also need a suitable write-barrier interlock to the filesystem, to
basically force a flush-to-disk of all the incore data buffers, etc (basically,
you need to ensure that at the instant the snapshot is taken, the on-disk copy
is "clean" by fsck standards).

At that point, you can just have a utility that goes "flush; snapshot;" and go on
your way.....


--==_Exmh_1219181512P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFAwMyvcC3lWbTT17ARAvWTAKD7/M6r5vCIDO1W8PID+2mYKkqkxwCguNlO
gwV45LoTcli2xXZxrp1/vNg=
=zRVr
-----END PGP SIGNATURE-----

--==_Exmh_1219181512P--
