From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Problem mounting fs after a crash
Date: Mon, 26 Aug 2002 22:24:52 +0400
Message-ID: <200208262224.52553.vitaly@namesys.com>
References: <4.3.1.2.20020826165410.030df008@mail.hlf.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11325-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4.3.1.2.20020826165410.030df008@mail.hlf.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Reiserml <reiserml@hlf.net>, reiserfs-list@namesys.com


Hi,=20

On Monday 26 August 2002 18:59, Reiserml wrote:
> Hi List
>
> i have a big problem
>
> after my system crachs i=B4m unabel to mount my disk again
> the disk is a VG with 3 * 80 GB HD`s if i try to mount
>
> mount -t reiserfs /dev/vg2/video /video
>
> i get
> Segmantation Fault
>
> Thats it afer that i=B4m unable to mount or unmount anything
>
> i use Suse Linux 7.2 Kernel 2.4x
>
> i checked the filesystem 10 times but nothing goes

Which reiserfsprogs do you use? Would you take the latest one and=20
try to check again.

--=20

Thanks,
Vitaly Fertman
