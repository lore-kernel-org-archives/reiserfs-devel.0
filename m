From: Mihai RUSU <dizzy@roedu.net>
Subject: Re: reiserfs v3 vs v4 bonnie++ benchmarks
Date: Thu, 11 Mar 2004 10:33:39 +0200 (EET)
Message-ID: <Pine.LNX.4.58L0.0403111024270.30453@ahriman.bucharest.roedu.net>
References: <Pine.LNX.4.58L0.0403091811140.5982@ahriman.bucharest.roedu.net>
 <404DFACE.4090008@namesys.com> <Pine.LNX.4.58L0.0403091914240.8537@ahriman.bucharest.roedu.net>
 <404DFDBA.8040006@namesys.com> <Pine.LNX.4.58L0.0403091929530.9967@ahriman.bucharest.roedu.net>
 <404E0112.7080904@namesys.com> <Pine.LNX.4.58L0.0403092308420.17447@ahriman.bucharest.roedu.net>
 <404EB6C7.9000909@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17172-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <404EB6C7.9000909@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com, Yann Dupont <Yann.Dupont@univ-nantes.fr>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Wed, 10 Mar 2004, Hans Reiser wrote:

> Sure.  Thanks for repeating it.
> 
> Yann, I think you will get the same effect if you repeat with 10x larger 
> fileset.  Reiser4 is not tuned for size of ram benchmarks, and I don't 
> think it should be.

Hi again

I repeated the "many small files" test with a double ammount of files (I 
couldnt do more couse my test partition whould fill up). I have 512MB of 
memory and in this tests df reported a 20GB usage of the partition so I 
say its pretty plenty more than the memory :)


reiser v3:
Version  1.03       ------Sequential Create------ --------Random Create--------
dizzywork           -Create-- --Read--- -Delete-- -Create-- --Read--- -Delete--
files:max:min        /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP
512:64000:16000/512  1108  22   157   1 10093  67  1045  21    44   0   130   1
dizzywork,,,,,,,,,,,,,,512:64000:16000/512,1108,22,157,1,10093,67,1045,21,44,0,130,1

reiser v4:
Version  1.03       ------Sequential Create------ --------Random Create--------
dizzywork           -Create-- --Read--- -Delete-- -Create-- --Read--- -Delete--
files:max:min        /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP
512:64000:16000/512   730  35  1113  15  3882  46   767  42    45   1   821  12
dizzywork,,,,,,,,,,,,,,512:64000:16000/512,730,35,1113,15,3882,46,767,42,45,1,82

The results seem fimilar with the first "many files" test (maybe because 
there too I was written much more than memory, ie 10GB).

Interesting observations:
- - v4 seems to be much slower than v3 at the "create files" test 
- - v4 also is much slower at deleting many files sequentially but its much 
faster than v3 at deleting them random (much closer to real life so this 
is a gain for v4); 
- - v4 also is a lot faster than v3 when reading many "small" files 
sequentially althought I would love to see some increase in the "random 
read" case where its closer to real-life case

> -- 
> Hans

- -- 
Mihai RUSU                                    Email: dizzy@roedu.net
GPG : http://dizzy.roedu.net/dizzy-gpg.txt    WWW: http://dizzy.roedu.net
                       "Linux is obsolete" -- AST
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAUCRlPZzOzrZY/1QRAqJXAKC2zeMIpcMi8HW8xGAILKeH8Lp06wCcDASA
nCw0Pvfg3v4Br6g/aAmJTkI=
=joC5
-----END PGP SIGNATURE-----
