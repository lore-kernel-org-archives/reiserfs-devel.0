From: Reiserml <reiserml@hlf.net>
Subject: Re: Problem mounting fs after a crash
Date: Mon, 26 Aug 2002 20:50:58 +0200
Message-ID: <4.3.1.2.20020826205043.030c6c10@mail.hlf.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11326-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: reiserfs-list@namesys.com

Hi

At 22:24 26.08.2002 +0400, you wrote:

>Hi,
>
>On Monday 26 August 2002 18:59, Reiserml wrote:
> > Hi List
> >
> > i have a big problem
> >
> > after my system crachs i=B4m unabel to mount my disk again
> > the disk is a VG with 3 * 80 GB HD`s if i try to mount
> >
> > mount -t reiserfs /dev/vg2/video /video
> >
> > i get
> > Segmantation Fault
> >
> > Thats it afer that i=B4m unable to mount or unmount anything
> >
> > i use Suse Linux 7.2 Kernel 2.4x
> >
> > i checked the filesystem 10 times but nothing goes
>
>Which reiserfsprogs do you use? Would you take the latest one and
>try to check again.

Yes I do
the reiserfsck -o /dev ...
i run it 10 times i get the same error
Cheking Semantic tree .../Comedy/....
ok

its the same after a --rebuild-tree

i don=B4t what to do now ...

Thx
Thomas




>--
>
>Thanks,
>Vitaly Fertman

