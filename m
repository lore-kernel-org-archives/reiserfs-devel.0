From: michael chang <thenewme91@gmail.com>
Subject: Re: resize_reiserfs, free space in front....
Date: Sun, 20 Nov 2005 17:48:41 +0000
Message-ID: <b14e81f00511200948u767be4fw7e9c8fb485c18e2e@mail.gmail.com>
References: <43808C53.5000808@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-27037-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43808C53.5000808@gmx.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: julius Junghans <julius.junghans@gmx.de>
Cc: reiserfs-list@namesys.com

Reiserfs partitions, when resized; the beginning MUST stay fixed.=20
This limitation also applies to ext2/3 filesystems.  The only
filesystem I know of in which the front of the filesystem can be moved
is FAT; which can't be practically used for linux, IIRC.

The solution is to make partitions as early on the disk as you'll ever
need and put everything else at the tail end (e.g. FAT at the tail
end).  IIRC, LVM should also be able to manage around this; although I
don't remember perfectly.

On 11/20/05, julius Junghans <julius.junghans@gmx.de> wrote:
> Hi,
>
> i would like to grow my reserfs partition, the unsued space is in front
> of my root partition, between swap and root partition.
> as stated in the resize_reiserfs manpage:
>
> .......This can be done using cfdisk(8) for partitions, by deleting the
> partition and recreating it with
>        a larger size (assuming there is free space after the partition
> in question).  Make sure you re-create it with the same starting disk
>        cylinder as before!  Otherwise, the resize operation will
> certainly not work, and you may lose your entire filesystem.....
>
> the same starting cylinder wouldnt change anything in my case...
> is it possible what i want todo with resize_reiserfs?
> - if yes then the manpage should be updated.
>
> greets
> julius
>


--
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
