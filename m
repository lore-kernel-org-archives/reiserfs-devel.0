From: "daniel.poelzleithner" <poelzi@poelzi.org>
Subject: Slow stats on reiserfs 3
Date: Thu, 01 Apr 2004 15:13:18 +0200
Message-ID: <406C156E.406@poelzi.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17642-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Reiser FS Mailing List <reiserfs-list@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

There is a discussion at the BackupPC Mailinglist why the nightly
cleanup of the backup Pool takes so much more time against ext3.

Here is the thead:

http://sourceforge.net/mailarchive/forum.php?thread_id=4144370&forum_id=503

The pool directory looks like:

cpool/0/0/0/0001257ca4eff2a5c9b60797fa034275

I tested:

find /MY/CPOOL -type d -exec stat {} > /dev/null \;

and it takes around 170 minutes on my 30 gb pool with 687847 files.
I looked with debugreiserfs at the metadata and it seems that ca. every
fivest file has an hash collision, but i never saw more than on
collision per directory.

Is there anyting to speed this up on large directories ?

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

iD8DBQFAbBVty/mkIQp7AD0RApTwAJ9E61qH2LzbJ7R5xm7YAaFARt1tcwCcDk8c
e69X2MvlWGYRU1tyTdL5yds=
=Lggx
-----END PGP SIGNATURE-----
