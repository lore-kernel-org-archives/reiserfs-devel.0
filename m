From: Bernd Schubert <bernd-schubert@web.de>
Subject: Re: HILFE! HELP! Problem with my root-partition
Date: Tue, 26 Aug 2003 22:48:26 +0200
Sender: bernd-schubert@web.de
Message-ID: <200308262248.26593.bernd-schubert@web.de>
References: <200308261742.h7QHgGD02541@fx.webpoint.at>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15442-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200308261742.h7QHgGD02541@fx.webpoint.at>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Alexander Waller <a.waller@webpoint.at>
Cc: reiserfs-list@namesys.com

On Tuesday 26 August 2003 19:41, Alexander Waller wrote:
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


Hello Alex,

first of all you should install a new reiserfsck (get it from=20
ftp.namesys.com). Perhaps even this helps, otherwise there are options like=
 =20
--rebuild-tree and --rebuild-sb. Especially if you need to to rebuild-sb, y=
ou=20
should do a backup of you partition to another harddisk using dd or=20
dd_rescue.

I guess you will get more professional help in the next hours by the=20
reiserfs-programmers... :) However, I think they will first advise you to=20
upgrade to newer reiser-tools.

Regards,
	Bernd

