From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiserfs v3 vs v4 bonnie++ benchmarks
Date: Wed, 10 Mar 2004 09:33:43 +0300
Message-ID: <404EB6C7.9000909@namesys.com>
References: <Pine.LNX.4.58L0.0403091811140.5982@ahriman.bucharest.roedu.net> <404DFACE.4090008@namesys.com> <Pine.LNX.4.58L0.0403091914240.8537@ahriman.bucharest.roedu.net> <404DFDBA.8040006@namesys.com> <Pine.LNX.4.58L0.0403091929530.9967@ahriman.bucharest.roedu.net> <404E0112.7080904@namesys.com> <Pine.LNX.4.58L0.0403092308420.17447@ahriman.bucharest.roedu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17153-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.58L0.0403092308420.17447@ahriman.bucharest.roedu.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mihai RUSU <dizzy@roedu.net>
Cc: reiserfs-list@namesys.com, Yann Dupont <Yann.Dupont@univ-nantes.fr>

Mihai RUSU wrote:

>-----BEGIN PGP SIGNED MESSAGE-----
>Hash: SHA1
>
>On Tue, 9 Mar 2004, Hans Reiser wrote:
>
>  
>
>>Yes, it would be interesting.  I think maybe we need to tweak reiser4 
>>more for benchmarks near to ram size.
>>    
>>
>
>Hi again
>
>I have repeated the "block" read/write tests asking bonnie++ to write 5 GB 
>of data (10x my RAM size).
>
>reiser v3:
>Version  1.03       ------Sequential Output------ --Sequential Input- --Random-
>                    -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --Seeks--
>Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /sec %CP
>dizzywork        5G 17340  89 46074  15 22140   5 16473  85 46145   6 102.8   0
>dizzywork,5G,17340,89,46074,15,22140,5,16473,85,46145,6,102.8,0,,,,,,,,,,,,,
>
>reiser v4:
>Version  1.03       ------Sequential Output------ --Sequential Input- --Random-
>                    -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --Seeks--
>Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /sec %CP
>dizzywork        5G 17491  90 48452  14 23563  11 17426  89 47952   8 110.9   0
>dizzywork,5G,17491,90,48452,14,23563,11,17426,89,47952,8,110.9,0,,,,,,,,,,,,,
>
>You were right. The values now seem almost the same (well, reiser4 seems a 
>little bit better).
>
>Should I repeat the "many small files" tests too with lots more files ?
>
>  
>
>>-- 
>>Hans
>>    
>>
>
>- -- 
>Mihai RUSU                                    Email: dizzy@roedu.net
>GPG : http://dizzy.roedu.net/dizzy-gpg.txt    WWW: http://dizzy.roedu.net
>                       "Linux is obsolete" -- AST
>-----BEGIN PGP SIGNATURE-----
>Version: GnuPG v1.2.4 (GNU/Linux)
>
>iD8DBQFATjObPZzOzrZY/1QRAnOMAJ4glX0TXNnuz3hbKQiR4SGijXvE1QCePYOd
>HPRGgqPvWMuUb/UYIzUGtLE=
>=Gyjj
>-----END PGP SIGNATURE-----
>
>
>  
>
Sure.  Thanks for repeating it.

Yann, I think you will get the same effect if you repeat with 10x larger 
fileset.  Reiser4 is not tuned for size of ram benchmarks, and I don't 
think it should be.

-- 
Hans


