From: "daniel.poelzleithner" <poelzi@poelzi.org>
Subject: Re: can't find a reiserfs file ssytem! 2
Date: Wed, 17 Mar 2004 23:29:35 +0100
Message-ID: <4058D14F.4060800@poelzi.org>
References: <20040317140309.ABECF3982E7@ws5-1.us4.outblaze.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17289-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040317140309.ABECF3982E7@ws5-1.us4.outblaze.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

mite pascoff wrote:

| my problem partition is 15GB large and dd stoped after copying 2GB of
data with a messige like:
| File size limit exceeded
| So I began testing this part/image of the problem partition

Looks for me like a dd without large file support. Try a new version
that support 64 bit file sizes or another too.


regards
~ Daniel

- --
nihil me cirumdat

.. . .. ... . . .. . ... . .. . ... . . .
pgp key @ http://files.poelzi.org/pgp.txt
ED80 E53D 5269 4BB1 1E73 3A53 CBF9 A421 0A7B 003D
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Debian - http://enigmail.mozdev.org

iD8DBQFAWNFOy/mkIQp7AD0RArv1AJ0YutkLleaLPwN8QwWL0cvt2D5g2gCdEIyX
h+1MLLHm96PwpctrRMYo6Ak=
=lqMp
-----END PGP SIGNATURE-----
