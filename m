From: Till Gerken <till@tantalo.net>
Subject: Re: Problem mounting ReiserFS as root partition
Date: Mon, 16 Jun 2003 14:31:24 +0200
Message-ID: <200306161431.27002.till@tantalo.net>
References: <200306151508.57384.till@tantalo.net> <200306161117.02910.till@tantalo.net> <20030616092144.GB12314@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14561-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030616092144.GB12314@namesys.com>
Content-Description: clearsigned data
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

On Monday 16 June 2003 11:21, Oleg Drokin wrote:
> On Mon, Jun 16, 2003 at 11:16:52AM +0200, Till Gerken wrote:
> > kernel (hd0,0)/boot/vmlinuz-2.4.21 root=3D/dev/hda1,rw hdc=3Dide-scsi
> > pci=3Dbiosirq idebus=3D66
>
> I suggest you to replace the comma between "root=3D/dev/hda1" and "rw" wi=
th
> space.

You are right, that did the trick. Since I have been using that configurati=
on=20
file for well over a year, I assumed it to be correct - especially since it=
=20
worked as expected.

Thanks for the tip,

Till

