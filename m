From: "daniel.poelzleithner" <poelzi@poelzi.org>
Subject: Re: reiser4 metas/bmap problem
Date: Fri, 30 Jul 2004 04:30:20 +0200
Message-ID: <4109B2BC.4040600@poelzi.org>
References: <Pine.GSO.4.44L.0407281754290.11129-100000@unix2.cc.ksu.edu> <20040729012549.GE1439@schnapps.adilger.int> <4108B029.4030008@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19863-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4108B029.4030008@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: Andreas Dilger <adilger@clusterfs.com>, Matt Stegman <matts@ksu.edu>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Vladimir V. Saveliev wrote:

| reiser4 should do the same, i agree. However, reiser4 has another
| feature we call relocation (flush may allocate another disk blocks for a
| file if it finds it more optimal) which is undesirable for bmapped files.
| We will probably have to invent some woraround for that.

Whats about a flag that can be set through metas, that will prevent the
relocation ?
That would be no workaround, that would be a feature :)

regards
~ Daniel

- --
Once the philosopher stone has fallen from the tree,
~  nonsense appeared to fix the courious fear.

.. . .. ... . . .. . ... . .. . ... . . .
pgp key @ http://files.poelzi.org/pgp.txt
ED80 E53D 5269 4BB1 1E73 3A53 CBF9 A421 0A7B 003D
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Debian - http://enigmail.mozdev.org

iD8DBQFBCbK8y/mkIQp7AD0RAtdYAJ4nvuykJ/jt22xaab8BWfnY1qSXzQCeO31N
O/J1M9fctbmDK3SiX/Ac7IE=
=wK7J
-----END PGP SIGNATURE-----
