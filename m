From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: disk failure
Date: Mon, 28 Apr 2003 14:21:57 +0400
Message-ID: <200304281421.57850.vitaly@namesys.com>
References: <web-2465822@elet.polimi.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13852-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <web-2465822@elet.polimi.it>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vincenzo Martena <martena@elet.polimi.it>
Cc: reiserfs-list@namesys.com


Hi,=20

> bread: Cannot read a block # 218118.
>
> Aborted
> -----------------------------------------------------------------------=
--
>
> Now the problem is that I cannot acces my hard disk,
> because the journal is totally absent. Do you know if
> there is some option I can give to reiserfsck in order to
> ignore the hardware error and keep rebuilding the tree?

we are still working on badblock support in reiserfs, but it=20
is not finished yet. So if your partition has some badblocks
you should dd_rescue this partition to some spare partition=20
and fsck the copy.=20

Alternatively, you can try to write to this block with dd, then=20
the drive will probably remap this block and it will disappear.

If you need more details you can either look through reiserfs-list
mail archive or pay us for the support on the base of our=20
support.html terms.

> Thanks a lot for your help.
>
> Vinxe
>
> P.S. reiserfsck version is:
>
> <-------------reiserfsck, 2002------------->
> reiserfsprogs 3.6.3

This is an old version of reiserfsprogs, get the latest one from=20
our ftp site please.

--=20
Thanks,
Vitaly Fertman
