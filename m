From: Mike Waychison <Michael.Waychison@Sun.COM>
Subject: Re: silent semantic changes in reiser4 (brief attempt to document the
 idea of what reiser4 wants to do with metafiles and why
Date: Tue, 31 Aug 2004 10:09:52 -0400
Message-ID: <413486B0.4050101@sun.com>
References: <41323AD8.7040103@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21158-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <41323AD8.7040103@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Andrew Morton <akpm@digeo.com>, Linux Kernel <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@osdl.org>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hans Reiser wrote:

>
> Why Openat Sucks:
>
> because you can't go cat filenameA/metas/permissions >
> filenameB/permissions
>
> If cat doesn't work, then we are suffering exactly the problem with
> namespace fragmentation that this whole scheme was invented to avoid.
>

Sure you can.  All you need to do is fix your shell.

- --
Mike Waychison
Sun Microsystems, Inc.
1 (650) 352-5299 voice
1 (416) 202-8336 voice
http://www.sun.com

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
NOTICE:  The opinions expressed in this email are held by me,
and may not represent the views of Sun Microsystems, Inc.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFBNIavdQs4kOxk3/MRAmvAAJ9sZfEgIOfINZsT23pa+Y3nQ4lfMACgmN3q
sdgPzBUg9i/c+roWDrXq5BI=
=poSJ
-----END PGP SIGNATURE-----
