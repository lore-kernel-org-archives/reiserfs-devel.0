From: Todd Lyons <todd@mrball.net>
Subject: Re: ReiserFS v3 + millions of files?
Date: Wed, 29 Oct 2003 22:04:40 -0800
Message-ID: <20031030060440.GA20504@mrball.net>
References: <200310262146.28850.d.oglesby@insightbb.com> <20031029060345.GA21398@mrball.net> <3F9F7DE0.7040000@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15938-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3F9F7DE0.7040000@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; x-action="pgp-signed"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hans Reiser wanted us to know:

>>For my tests, I compared EXT3, XFS, reiser(tails), and reiser(notail).
>>The results are at http://www.mrball.net/file%20creation%20tests.html
>Is ext3 using htree?

You know, I don't know the answer to that.  I would guess that it's the
default compilation options, so if you say that it uses that by default,
I'll believe you.  I tried grepping the binary but didn't find anything
that indicated type of structure.

I found this in namei.c.  Dunno if it helps:
 *  Directory entry file type support and forward compatibility hooks
 *      for B-tree directories by Theodore Ts'o (tytso@mit.edu), 1998

To me that doesn't really tell anything though.

Anyway, I fired off an instance of my test program that created 3
million files and it finished in about 26 minutes.  But then I found
that I had filled the partition so I shortened the file size a little
and restarted it.  It was running when I left and I'll analyze the logs
tomorrow.  BTW, that was on a machine with 5400 RPM 40 GB HD and 128
Megs of RAM (trying to starve the system for resources to get rid of
effects of caching and buffering).
- -- 
Blue skies...	Todd 	  Public key: http://www.mrball.net/todd.asc
    They dont need to adjust their pricing, they just need to 
   lobby for new laws to protect their flawed business models. 
              Oh wait, they just did that.         --Dan Hollis
Linux kernel 2.4.22-10mm.2mdk   1 user,  load average: 0.02, 0.01, 0.00
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)
Comment: http://www.mrball.net/todd.asc

iD8DBQE/oKn4IBT1264ScBURAgDzAJwKxhDmsx4eEsgZk5uQtT3G0yproACfVb4o
LlfB7Z4tO3cNQJo4AqOkl6g=
=zWHs
-----END PGP SIGNATURE-----
