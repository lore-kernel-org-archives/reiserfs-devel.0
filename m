From: Mihai RUSU <dizzy@roedu.net>
Subject: Re: reiserfs v3 vs v4 bonnie++ benchmarks
Date: Tue, 9 Mar 2004 19:18:51 +0200 (EET)
Message-ID: <Pine.LNX.4.58L0.0403091914240.8537@ahriman.bucharest.roedu.net>
References: <Pine.LNX.4.58L0.0403091811140.5982@ahriman.bucharest.roedu.net>
 <404DFACE.4090008@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17143-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <404DFACE.4090008@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Tue, 9 Mar 2004, Hans Reiser wrote:

> >V3:
> >Version  1.03       ------Sequential Output------ --Sequential Input- --Random-
> >                    -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --Seeks--
> >Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /sec %CP
> >dizzywork        1G 13459  71 62922  20 26061   6 15687  83 54593   8 191.0   0
> >                    ------Sequential Create------ --------Random Create--------
> >                    -Create-- --Read--- -Delete-- -Create-- --Read--- -Delete--
> >files:max:min        /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP
> >256:64000:16000/256  1287  27   165   2 11382  77  1230  25    63   1   253   2
> >
> >V4:
> >Version  1.03       ------Sequential Output------ --Sequential Input- --Random-
> >                    -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --Seeks--
> >Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /sec %CP
> >dizzywork        1G 16926  87 52469  15 26474  11 16759  85 55349   9 166.6   1
> >                    ------Sequential Create------ --------Random Create--------
> >                    -Create-- --Read--- -Delete-- -Create-- --Read--- -Delete--
> >files:max:min        /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP
> >256:64000:16000/256   863  40  1243  16  4219  47   873  46    81   1  3980  48
> >  
> >
> 
> >Interesting issues:
> >- - see that the "sequential writes" test using write with a 8192 bytes 
> >  
> >
> which of the above is this, the sequential output test?

This one:
62922 for v3 and 52469 for v4

> >buffer is lower with v4 than with v3 (and it was like that in all tests)
> >- - both reiserfs v3 and v4 have almost same number of "little" files 
> >created in both sequential or random order but... reiser4 is much slower 
> >than v3 here

> are little files = 64k?

In my oppinion yes (I consider not a small file after 256 kbytes or so). 
I dont think that "definitions" matter here, but numbers do :) Im trying 
to test a setup as close as it can be to my real setup (huge FS partitions 
with millions of files, web files with 32kbytes average size).

> I need to take the time to read through bonnie++ so that I can really 
> understand it, sigh, not today...

That would be good couse Im not sure I completly understand it myself heh.

> It does seem clear though that V4 consumes too much CPU for creates and 
> writes, and that we are CPU bound for this task.  After we release it 
> Zam will tweak it more, and I will review the write code again.  He is 
> tweaking the linux profiler to collect better statistics on parent callers.
> 
> Thanks for gathering this data.

You're welcomed.

- -- 
Mihai RUSU                                    Email: dizzy@roedu.net
GPG : http://dizzy.roedu.net/dizzy-gpg.txt    WWW: http://dizzy.roedu.net
                       "Linux is obsolete" -- AST
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFATfx9PZzOzrZY/1QRAlCqAJ9dVdk9tDbrRTmBn+oEP0NHL1RaOQCgy+ag
MHOxu6aUewDIpg1X4Jq3Y6k=
=I8Ya
-----END PGP SIGNATURE-----
