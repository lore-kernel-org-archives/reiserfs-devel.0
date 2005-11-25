From: Milan =?ISO-8859-1?B?SG9seuRwZmVs?= <listen@mjh.name>
Subject: Re: reiser3 in cryptoloop
Date: Fri, 25 Nov 2005 20:23:24 +0100
Message-ID: <20051125202324.065845df.listen@mjh.name>
References: <fe11eda90511240754k2ae211e8j9d1be51c43465171@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27151-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Thu, 24 Nov 2005 12:54:06 -0300
Martin Sarsale <martin@malditainternet.com> wrote:

> Dear all:
> 
> [...]
> 
> The output for reiserfsck is the following:
> camem64:/home/martin# losetup -e
> twofish /dev/loop2 /opt/backup.img.crypto Password:
> camem64:/home/martin# reiserfsck --fix-fixable /dev/loop2
> [...]

IIRC, the help text of the cryptoloop kernel feature says that you are
not supposed to use it with journaling file systems like ext3 and
ReiserFS, because this can lead to problems.  You shall use dm-crypt
[1] instead.  Maybe this is the cause? 

I don't know whether Reiser4 is to be seen as a journaling fs here. 

Regards,
Milan

[1]: you can setup encrypted volumes using
<URL:http://clemens.endorphin.org/LUKS/>, given that your kernel has
support for them ofc.  I used only the old version
<URL:http://www.saout.de/misc/dm-crypt/> so far, but it worked fine.
(ReiserFS v3 on encrypted volumes, which are automatically mounted and
umounted on log-in. 

- -- 
1024D/65837966 2004-01-24 Milan Holzaepfel (jagdfalke/jag) <mail(A)mjh(D)name>
4C8A 5FAF 5D32 6125 89D1  0CE5 DB0C AF4F 6583 7966      <URL:http://mjh.name/>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFDh2Ss2wyvT2WDeWYRAjxgAKDRTbwUgOGJYSeg3lM1CXpYWY8H+ACcDHTU
VwUibFsgeZzT5aHqlnAsqKM=
=TO29
-----END PGP SIGNATURE-----

