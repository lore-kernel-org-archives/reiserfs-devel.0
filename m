From: "daniel.poelzleithner" <poelzi@poelzi.org>
Subject: Re: support for Reiserfs 3.6 failed on ~1Tb lvm2 lv on 2.6.6?
Date: Tue, 08 Jun 2004 23:38:05 +0200
Message-ID: <40C631BD.2050706@poelzi.org>
References: <3DF9165145FACB4C96977FF650C1E9040C46A03F@its-mail1.its.corp.gwl.com> <40C627B7.9000803@dgreaves.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19105-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40C627B7.9000803@dgreaves.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Greaves <david@dgreaves.com>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

David Greaves wrote:

| Thanks - I'll try both :)
|
| I'm talking to namesys too.
|
| I am wondering if the resync corrupted the data.
|
| I'm pretty happy that I didn't do anything 'wrong' - something is either
| broken in hw (mem) or buggy.

cat /proc/mdstats looks good ?

I had problems with my home server, too. He carries 11 ide harddisks.
Many problems come from bad connections. Look that the power is stable,
not to many harddisks on one power string. Controll your ide cable. I
always use elektrical contact spray to make sure the contacts are good.
I haven't experienced any Problems since then.

The rsync can not corrupt any data as long no device are removed by the
raid system i think.


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

iD8DBQFAxjG9y/mkIQp7AD0RAtqFAJ0elPirndm7GwWMEAc5VZCSk+o2SwCgnusw
bLO4XJ8urlP5MJywyFwQQtk=
=bFIK
-----END PGP SIGNATURE-----
