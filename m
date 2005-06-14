From: evilninja <evilninja@gmx.net>
Subject: Re: REISERFS: panic... Trying to log block (prints.c:362)
Date: Tue, 14 Jun 2005 20:21:35 +0200
Message-ID: <42AF202F.7050000@gmx.net>
References: <17210.194.72.110.12.1118754000.squirrel@luminoussheep.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24378-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <17210.194.72.110.12.1118754000.squirrel@luminoussheep.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: M <martin@luminoussheep.net>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

M schrieb:
> It dies within about 30 seconds of issuing the tar command and is
> repeatable. So the question is why is the filesytem corrupt?

hm, bad memory? bad cabling? running memtest86 overnight just to be sure
could help. and: can you reproduce the problem with an untainted kernel?

> problem? Would turning off preemntion help?

well, have you tried (to disable CONFIG_PREEMPT)?

- --
BOFH excuse #245:

The Borg tried to assimilate your system. Resistance is futile.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFCryAvC/PVm5+NVoYRAhC9AKDXDBLXU0BOOuJacxHPY8lgK6krCACg+Yy2
i3Fwy0lFricZBF0o5xllTtE=
=O0V8
-----END PGP SIGNATURE-----
