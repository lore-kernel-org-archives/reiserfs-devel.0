From: Redeeman <redeeman@metanurb.dk>
Subject: Re: Reiser4 DOS
Date: Mon, 03 May 2004 16:29:56 +0200
Message-ID: <1083594596.10793.0.camel@redeeman.kaspersandberg.com>
References: <200405021539.05907.mbuesch@freenet.de>
Reply-To: redeeman@metanurb.dk
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18387-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200405021539.05907.mbuesch@freenet.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs Mailinglist <reiserfs-list@namesys.com>

On Sun, 2004-05-02 at 15:38, Michael Buesch wrote:
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
> 
i tried this, my system doesent lock in any form :) however, it does use
alot cpu, but still my system runs strong

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
-- 
Regards, Redeeman
()  ascii ribbon campaign - against html e-mail 
/\                        - against microsoft attachments

