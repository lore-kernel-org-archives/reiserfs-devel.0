From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: HILFE! HELP! Problem with my root-partition
Date: Wed, 27 Aug 2003 01:20:56 +0400
Message-ID: <200308270120.56598.vitaly@namesys.com>
References: <200308261742.h7QHgGD02541@fx.webpoint.at>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15444-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200308261742.h7QHgGD02541@fx.webpoint.at>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Alexander Waller <a.waller@webpoint.at>, reiserfs-list@namesys.com

On Tuesday 26 August 2003 21:41, Alexander Waller wrote:
> Hi!
> I restarted my server.
> Now my reiserfs-root-partition cannot be mounted.
> Reiserfsck doesn=B4t help.
>
> filehound:~ # reiserfsck --fix-fixable /dev/hdb3
> reiserfsck 3.6.4 (2002 www.namesys.com)
> Will check consistency of the filesystem on /dev/hdb3
> and will fix what can be fixed w/o --rebuild-tree
> Will put log info to 'stdout'
>
> Do you want to run this program?[N/Yes] (note need to type Yes if you
> do):Yes
> reiserfs_open: neither new nor old reiserfs format found on /dev/hdb3
>
> reiserfsck: Cannot not open filesystem on "/dev/hdb3"
> Aborted
> filehound:~
>
> There is a harddisk, realy.
> filehound:~ # fdisk -l /dev/hdb
>
> Disk /dev/hdb: 28.5 GB, 28520497152 bytes
> 16 heads, 63 sectors/track, 55262 cylinders
> Units =3D cylinders of 1008 * 512 =3D 516096 bytes
>
>    Device Boot    Start       End    Blocks   Id  System
> /dev/hdb1   *         1        33     16600+  83  Linux
> /dev/hdb2            34       292    130536   82  Linux swap
> /dev/hdb3           293     55252  27699840   83  Linux
> filehound:~ #
>
> Please can anyone help me ?!
> Alex.

Hi Alexander,

first of all you need to ensure that your hdb3 partition is on its=20
proper place, and the start of it has not been moved aside due=20
to some reason. If the start (and size) is correct, then you lost=20
the super block of the reiserfs on hdb3 and you should obtain=20
the latest reiserfsprogs from our ftp site (ftp.namesys.com) first
of all and then run=20
        reiserfsck --rebuild-sb /dev/hdb3
after that you will have to run=20
        reiserfsck --rebuild-tree /dev/hdb3 -l logfile.

=2D-=20
Thanks,
Vitaly Fertman
