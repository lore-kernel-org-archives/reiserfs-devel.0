From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: can't mount repaired reiserfs partition
Date: Wed, 23 Apr 2003 16:17:15 +0400
Message-ID: <200304231617.15308.vitaly@namesys.com>
References: <Pine.LNX.4.21.0304231506000.3962-100000@entandikwa.ds.co.ug>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13772-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.21.0304231506000.3962-100000@entandikwa.ds.co.ug>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Joshua Masiko <joshua@dsmagic.com>
Cc: reiserfs-list@namesys.com


Hi,=20

On Wednesday 23 April 2003 16:23, Joshua Masiko wrote:
> One of the partition on a harddisk that had SuSE 7.2 got corrupted. I
> connected it as a secondary drive on a SuSE 8.1 machine and run reiserf=
sck
> --check which found an error and said it was fixable by
> --fix-fixable. Below is the output of --fix-fixable
>
> reiserfsck --fix-fixable /dev/hdd6
> reiserfsck 3.6.2 (2002)

this is the old version, would you try to check your fs with 3.6.6-pre1 v=
ersion and=20
tell us what it says?

--=20
Thanks,
Vitaly Fertman
