From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 plugins
Date: Mon, 27 Jun 2005 02:00:49 -0500
Message-ID: <42BFA421.70506@slaphack.com>
References: <200506240241.j5O2f1eb005609@laptop11.inf.utfsm.cl> <42BCD93B.7030608@slaphack.com> <200506251420.j5PEKce4006891@turing-police.cc.vt.edu> <42BDA377.6070303@slaphack.com> <200506252031.j5PKVb4Y004482@turing-police.cc.vt.edu> <42BDC422.6020401@namesys.com> <42BE3645.4070806@cisco.com> <e692861c05062522071fe380a5@mail.gmail.com> <42BE563D.4000402@cisco.com> <42BE5DB6.8040103@slaphack.com> <200506261816.j5QIGMdI010142@turing-police.cc.vt.edu> <42BF08CF.2020703@slaphack.com> <200506262105.j5QL5kdR018609@turing-police.cc.vt.edu> <42BF2DC4.8030901@slaphack.com> <200506270040.j5R0eUNA030632@turing-police.cc.vt.edu> <42BF667C.50606@slaphack.com> <200506270423.j5R4Np9n004510@turing-police.cc.vt.edu> <42BF8F42.7030308@slaphack.com> <200506270541.j5R5fULX007282@turing-police.cc.vt.edu> <42BF9562.4090602@slaphack.com> <200506270612.j5R6CZGX008462@turing-police.cc.vt.edu>            <42BF9
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24672-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200506270643.j5R6hqRh009781@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Valdis.Kletnieks@vt.edu
Cc: Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Hans Reiser <reiser@namesys.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Valdis.Kletnieks@vt.edu wrote:
> On Mon, 27 Jun 2005 01:27:25 CDT, David Masover said:

[...]

>>Speaking of backup, that's another nice place for a plugin.  Imagine a
>>dump that didn't have to be of the entire FS, but rather an arbitrary
>>tree...  That might be a nice new archive format.  I know Apple already
>>uses something like this for their dmg packages.
> 
> 
> Hmm.. you mean like 'tar' or 'cpio' or 'pax' or 'rsync'? :) 

No, a dmg is an OS X program installer.  It appears to be a disk image
of sorts.  So this is the backup idea in reverse.

They even "optimize" (repack? defrag?) the hard drive after each update.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQr+kIXgHNmZLgCUhAQKMbg/9GMCtXtlC76wYEvzALVQROXh5xTKHJg8q
+sngIMVKfCPOwGVe62tUfrzGaQ0/t9FJ/p40yAzRrWHV7msJWwQZYjf918AA1Vmg
IMmsbzFPH+3oRROSfwWcPB/MPG5n1YVfsaq09BUSFM7pasubGgEiFz3TA7gwRTh1
sOw/3J1mlhcxUUbQJrLPAe6e4u59h6MwUZVSdnF2D0Gnnxgwvl8ZemLVSqDaaMGs
F7fHJWUd7pZO+d4h2c9AnFLQQL5TvJHDOWuHcGVHZbt/Vaz7F79TWWyC74MeDUA6
ErSGbrZ4fLnocP8zqmDkWJ9GnqE/w9HAhDC2vPtRqCl4z8Mbc/0e5FOxi3M+7WVH
TXXBTKnBQG97DWEwneVRFndmhzP/rccnCYIlWhTugiATkStNkOKabTHVp2tpC7lB
VP+NwBsMFoaS3vvKcYMF9709OglLRdGmHoju87UIvyLLUZ1fYvZ2+7WlEez0cqSh
I0GTCq8gshagIAKhjR/vhVT0i20xyrS/oJEIYdtXz470E2S9tf1NvIwlokO153wL
6PaAN2okmC+YLG+lMeHDZs2lKDfmPzOtbzxR8XyEQHLxsbdWJBnm9B6Epa02iiE1
wZ8feMMsAOjzb/8iiZFqMRROe+j9m+beDLMdc3fYVrNQM72EyPAMw1zUr1GgXeVA
USJDqNWK5S4=
=BpTW
-----END PGP SIGNATURE-----
