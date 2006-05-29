From: "Masthan, Dudekula (STSD)" <dudekula.masthan@hp.com>
Subject: RE: Bug#369285: reiserfsprogs: can't mount reiserfs volume with 8kb block size
Date: Mon, 29 May 2006 16:18:39 +0530
Message-ID: <4EEB5A4713E61F49A759A504BECCBC0A024544EC@bgeexc01.asiapacific.cpqcorp.net>
References: <20060529062736.GA5529@raptus.dandreoli.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28683-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-class: urn:content-classes:message
In-Reply-To: <20060529062736.GA5529@raptus.dandreoli.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Domenico Andreoli <cavok@debian.org>
Cc: reiserfs-list@namesys.com

Hi Domenico,

Currently ReiserFS supports  4 KB block only. Following link will
explain you more on this.
www.oracle.com/technology/pub/articles/calish_filesys.html=20

Kindly come back, still if you have any doubts

Regards,
Masthan




-----Original Message-----
From: Domenico Andreoli [mailto:cavok@debian.org]=20
Sent: Monday, May 29, 2006 11:58 AM
To: Andreas Beckmann
Cc: reiserfs-list@namesys.com; 369285@bugs.debian.org;
304342@bugs.debian.org; control@bugs.debian.org
Subject: Re: Bug#369285: reiserfsprogs: can't mount reiserfs volume with
8kb block size

forwarded 369285 reiserfs-list@namesys.com merge 304342 369285 thanks

On Sun, May 28, 2006 at 11:03:11PM +0200, Andreas Beckmann wrote:
>=20
> Hi,

hi Andreas,
=20
> I just created a new reiserfs volume with the following command:
>     mkreiserfs -d -l backup -b 8192 /dev/hda11 but mounting it fails=20
> with the error:
>   mount: wrong fs type, bad option, bad superblock on /dev/hda11,
>        missing codepage or other error
>        In some cases useful info is found in syslog - try
>        dmesg | tail  or so
> and dmesg says:
>   ReiserFS: hda11: warning: sh-2011: read_super_block: can't find a
>   reiserfs filesystem on (dev hda11, block 32, size 2048)
>   ReiserFS: hda11: warning: sh-2021: reiserfs_fill_super: can not find
>   reiserfs on hda11
>=20
> Other blocksizes just work fine.

that block sizes different from 4k do not work is a known problem,
please see bug #304342.

last news i heard about this is of more than a year ago.
Vitaly, maybe you have a nice release under the cover? :)

cheers
domenico

-----[ Domenico Andreoli, aka cavok
 --[ http://people.debian.org/~cavok/gpgkey.asc
   ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50
