From: Mihai RUSU <dizzy@roedu.net>
Subject: Re: reiserfs v3 vs v4 bonnie++ benchmarks
Date: Tue, 9 Mar 2004 19:32:16 +0200 (EET)
Message-ID: <Pine.LNX.4.58L0.0403091929530.9967@ahriman.bucharest.roedu.net>
References: <Pine.LNX.4.58L0.0403091811140.5982@ahriman.bucharest.roedu.net>
 <404DFACE.4090008@namesys.com> <Pine.LNX.4.58L0.0403091914240.8537@ahriman.bucharest.roedu.net>
 <404DFDBA.8040006@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17145-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <404DFDBA.8040006@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Tue, 9 Mar 2004, Hans Reiser wrote:

> >This one:
> >62922 for v3 and 52469 for v4
> >  
> >
> what is the amount of ram vs. the amount written?  If you write 10x the 
> ram, does the performance loss go away?

bonnie++ writes by default in the "block" tests double of memory (so it 
makes sure the cache has a small impact). I have 512 mb of ram and the 
ammount of data written was 1gb. I can force it to write 10x ... 
considering what I said here do you still want that ?

- -- 
Mihai RUSU                                    Email: dizzy@roedu.net
GPG : http://dizzy.roedu.net/dizzy-gpg.txt    WWW: http://dizzy.roedu.net
                       "Linux is obsolete" -- AST
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFATf+iPZzOzrZY/1QRAhIQAJ0W4Y7gvIMp0TnpXXXE9kubMgrr/wCePHCM
LBpuALzT+Mun64EcyAMd4bc=
=wQqP
-----END PGP SIGNATURE-----
