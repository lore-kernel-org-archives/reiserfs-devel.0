From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: REISERFS: panic... Trying to log block (prints.c:362)
Date: Tue, 14 Jun 2005 15:10:38 -0400
Message-ID: <42AF2BAE.2030706@suse.com>
References: <61572.194.72.110.12.1118736525.squirrel@luminoussheep.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24379-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <61572.194.72.110.12.1118736525.squirrel@luminoussheep.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: M <martin@luminoussheep.net>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

M wrote:
> Jun 14 07:14:36 localhost kernel: EIP:    0060:[<c01ab8b2>]    Tainted: PF
>     VLI

"Tainted: PF" is going to make this nigh impossible to debug.

The "P" means you've got at least one proprietary module loaded.
The "F" means you had to force at least one module to load.

Either of these conditions could spell memory corruption, ultimately
causing this problem.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQFCryuuLPWxlyuTD7IRAg6wAKCZMHyoPdewqv19PxhuTeVWxtkcbACgmmyB
D/WboqhlkcdxuaL8349LOKo=
=c6XZ
-----END PGP SIGNATURE-----
