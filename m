From: Paul Wagland <paul@kungfoocoder.org>
Subject: Re: snapshot, checkpoints
Date: Sat, 5 Jun 2004 17:57:38 +0200
Message-ID: <116CD3CA-B709-11D8-A933-000A95CD704C@kungfoocoder.org>
References: <20040527065259.99429.qmail@web51306.mail.yahoo.com> <1085641393.1915.199.camel@tribesman.namesys.com> <20040527092727.GO4990@nysv.org> <20040604131005.hmvps8wcw4sccgcs@www.wagland.net> <200406041925.i54JPZgp025255@turing-police.cc.vt.edu> <40C14E9C.4000706@slaphack.com>
Mime-Version: 1.0 (Apple Message framework v618)
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha1; boundary="Apple-Mail-18-769676326"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19040-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40C14E9C.4000706@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: David Masover <ninja@slaphack.com>
Cc: reiserfs-list@namesys.com, tdwebste2@yahoo.com, Vladimir Saveliev <vs@namesys.com>, Markus TXrnqvist <mjt@nysv.org>, Valdis.Kletnieks@vt.edu

--Apple-Mail-18-769676326
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII; format=flowed


On Jun 5, 2004, at 6:39, David Masover wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
>
>
> Valdis.Kletnieks@vt.edu wrote:
> | On Fri, 04 Jun 2004 13:10:05 +0200, Paul Wagland said:
> |
> |
> |>Can't the same functionality be created with device mapper though? At
> least
> |>under linux anyway?
>
> [...]
>
> | 2) You also need a suitable write-barrier interlock to the 
> filesystem, to
> | basically force a flush-to-disk of all the incore data buffers, etc
> (basically,
> | you need to ensure that at the instant the snapshot is taken, the
> on-disk copy
> | is "clean" by fsck standards).
>
>
> My main problem with this is that it seems to literally be a snapshot 
> --
> that is, a complete backup to another partition.  I think we should 
> have
> something like a version control system -- blocks (or files, or
> clusters, or whatever granularity is best/easiest) which change after
> the snapshot must be rewritten to somewhere else in the same partition.

At least with LVM, and therefore I assume with device mapper, the 
"snapshot" only stores changed blocks. From what I understand, this 
means that when you take a snapshot, if you change a block in the 
original, it first copies it to the snapshot, and then writes the new 
block to the original system. Of course, you will run into a problem if 
more changes are made than the snapshot partition size, but AFAIK it 
then just disables the snapshot.

Cheers,
Paul

--Apple-Mail-18-769676326
content-type: application/pgp-signature; x-mac-type=70674453;
	name=PGP.sig
content-description: This is a digitally signed message part
content-disposition: inline; filename=PGP.sig
content-transfer-encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (Darwin)

iD8DBQFAwe13tch0EvEFvxURArhXAJ4hOm5cnMhc2yAOkUaDVQe4jf5mgACgnm5k
xRt3kkpvJwwCZy+QfKm184g=
=PS+K
-----END PGP SIGNATURE-----

--Apple-Mail-18-769676326--

