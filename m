From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: Reiser4 DOS
Date: Mon, 3 May 2004 15:59:46 +0400
Message-ID: <16534.13362.386363.34148@laputa.namesys.com>
References: <200405021539.05907.mbuesch@freenet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18383-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200405021539.05907.mbuesch@freenet.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Buesch <mbuesch@freenet.de>
Cc: reiserfs-list@namesys.com

Michael Buesch writes:
 > -----BEGIN PGP SIGNED MESSAGE-----
 > Hash: SHA1
 > 
 > Hi,
 > 
 > I'm running linux-2.6.5 with latest reiser4 snapshot patch.
 > The following script makes my system completely
 > unresponsive in a short time.
 > 
 > #!/bin/sh
 > mount -treiser4 /dev/hdX /mnt/reiser4
 > cd /mnt/reiser4
 > while `/bin/true`; do
 > 	cd metas
 > done

One can DoS any Linux file-system by

$ while : ;do mkdir x && cd x ;done

Due to some shell peculiarities (like doing getcwd() on each cd), it may
be necessary to re-write this in C. Problem is less grave on SMP system,
but it's only matter of running enough instances of this in parallel. :)

Nikita.

 > 
 > - -- 
 > Regards Michael Buesch  [ http://www.tuxsoft.de.vu ]
 > 
 > -----BEGIN PGP SIGNATURE-----
 > Version: GnuPG v1.2.4 (GNU/Linux)
 > 
 > iD8DBQFAlPn4FGK1OIvVOP4RApOgAJ9JRZIll4hLLIL2Ml0ve7Xb3qagYQCeP9xp
 > puYCi/4tQPJfrffz0VatWck=
 > =6bBp
 > -----END PGP SIGNATURE-----
