From: wolfgang.glas@ev-i.at
Subject: Re: kernel loop with lseek + LFS on reiser partition.
Date: Mon, 22 Apr 2002 13:30:58 +0200
Message-ID: <OF6E1F14ED.2ACEFBDE-ONC1256BA3.003EF743@ev-i.at>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10118-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

OK, The program terminates.
During lunchtime, I gave it a try and what I've got is:

/home/wglas/tmp > gcc -D=5FLARGEFILE64=5FSOURCE -D=5FFILE=5FOFFSET=5FBITS=
=3D64=20
-D=5FGNU=5FSOURCE seek.c
/home/wglas/tmp > time ./a.out

real    11m35.661s
user    0m0.000s
sys     11m32.780s

Seems to scale linear with CPU power......

kernel: 2.4.18+speedup patches.

   Wolfgang

--
Dr. Wolfgang Glas                        EV-i Informationstechnologie=20
GmbH.
Gesch=E4ftsf=FChrer                          Sebastian-Kneipp-Weg 17
Wolfgang.Glas@ev-i.at                    A-6020 Innsbruck/Austria
phone: ++43-512-284883-2                 fax: ++43-512-281624-31

