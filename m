From: Boyd Waters <bwaters+moz@nrao.edu>
Subject: Re: A bold idea (Re: Carrying Attributes too Far)
Date: Mon, 08 Dec 2003 13:54:37 -0700
Message-ID: <3FD4E50D.6070805@nrao.edu>
References: <1065247084.3f7e616c94ec9@webmail.st-andrews.ac.uk>	 <3FCE3716.8000509@namesys.com>	 <1070584227.3fcfd1a3d67f4@webmail.st-andrews.ac.uk>	 <3FD00272.7040607@ninja.dynup.net> <1070617453.5605.13.camel@schlappix.schnulli.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16292-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1070617453.5605.13.camel@schlappix.schnulli.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Heinz-Josef Claes <hjclaes@web.de>
Cc: David Masover <jedi@ninja.dynup.net>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Heinz-Josef Claes wrote:

| I think hard linking directories is a very good idea. The should be a
| count for the number of hard links and it should be handled like with
| normal files. I directly have an application with would have a great
| benefit of this kind of hard linked directories, but up to now they are
| not available in linux :-(

I use

mount -o bind path/to/subdirectory path/to/mountpoint

as a sort-of "hard-link" directories...

But it is not the same thing as a "real" hard-link of a directory.
(I am not familiar with the kernel internals, beyond a quick read of
this month's Linux Journal article on dentry cache.)

~ - boyd

Boyd Waters
National Radio Astronomy Observatory
http://www.aoc.nrao.edu/~bwaters
Socorro, New Mexico
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQE/1OUN0is8k1r0QeURAitsAKCF7X2D7L8TvoLl/kexksP/K/qvVQCfWnPu
aq2IyX+aPYFpFXWNxkK0xCY=
=hwEx
-----END PGP SIGNATURE-----

