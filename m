From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: can't mount repaired reiserfs partition
Date: Wed, 23 Apr 2003 17:58:51 +0400
Message-ID: <200304231758.51453.vitaly@namesys.com>
References: <Pine.LNX.4.21.0304231657200.1659-100000@entandikwa.ds.co.ug>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13779-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.21.0304231657200.1659-100000@entandikwa.ds.co.ug>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Joshua Masiko <joshua@dsmagic.com>
Cc: reiserfs-list@namesys.com

On Wednesday 23 April 2003 17:57, Joshua Masiko wrote:
> On Wed, 23 Apr 2003, Vitaly Fertman wrote:
> > > Do you want to run this program?[N/Yes] (note need to type Yes if y=
ou
> > > do):Yes
> > > bread: Cannot read the block (4679842): (Invalid argument).
> >
> > Strange. And what does debugreiserfs /dev/hdd6 say?
> >
> > --
> > Thanks,
> > Vitaly Fertman
>
> timon:/home/joshua/downloads/reiserfsprogs-3.6.6-pre1/debugreiserfs #
> ./debugreiserfs /dev/hdd6
>
> <-------------debugreiserfs, 2003------------->
> reiserfsprogs 3.6.6-pre1
>
> bread: Cannot read the block (4679842): (Invalid argument).
>
> reiserfs_open: Your partition is not big enough to contain the
> filesystem of (4679842) blocks as was specified in the found super bloc=
k.
>
>
> debugreiserfs: can not open reiserfs on "/dev/hdd6": Unknown error
> 134516634

Could you send me the super block of your fs:
dd if=3D/dev/hdd6 of=3Dhdd6.sb bs=3D4096 skip=3D16 count=3D1

--=20
Thanks,
Vitaly Fertman
