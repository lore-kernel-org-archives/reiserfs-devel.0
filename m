From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: reiserfs 3.5.x partition and corruption - please help
Date: Fri, 29 Mar 2002 21:09:45 +0100
Message-ID: <200203292109.46370.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Rajesh Fowkar <rfowkar@goatelecom.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

On Friday, 29. March 2002 07:58:32, Rajesh Fowkar wrote:
> Hi,
>
> I have got a primary partition of 1.5 GB on which I created reiserfs file
> system. I created the file system using mkreiserfs which came with the
> reiserfsprogs package distributed with woody. It was working fine for last
> 6 months.
>
> Today suddenly when I tried to mount and list the contents, it gave me
> error saying that some of the files could not be stated. I downloaded the
> latest version of e2fsprogs from woody tree and ran reiserfsck /dev/hda2,
> error still persisted. I even tried --fix-fixable, --rebuild-tree.
>
> Now my position is I cannot mount the patition at all. I have got lot of
> stuff from woody downloaded on my dial-up link in that partition. Please
> help me to somehow mount that partition.
>
> Here are some details :
>
> --------------------------------------------------------------------------
> debian:~# mount /mnt/hda2/
> mount: wrong fs type, bad option, bad superblock on /dev/hda2,
>       or too many mounted file systems
> debian:~#=20
> --------------------------------------------------------------------------
> --------------------------------------------------------------------------
> debian:~# dpkg -l |grep reiser
> ii  reiserfsprogs  3.x.1a-2       User-level tools for ReiserFS filesyste=
ms

Hello,

first of all I think that you should start with the latest reiserfprogs too=
ls=20
and let debian woody's e2fsprogs alone.

ftp://ftp.namesys.com/pub/reiserfsprogs/pre
reiserfsprogs-3.x.1c_pre1.tar.gz
or
reiserfsprogs-3.x.1b.tar.gz (final)

When all is smooth again you could switch to 3.6 format (kernel 2.4) with=20
mount -conv.

Happy Easter!

-Dieter

--=20
Dieter N=FCtzel
Graduate Student, Computer Science

University of Hamburg
Department of Computer Science
@home: Dieter.Nuetzel@hamburg.de

