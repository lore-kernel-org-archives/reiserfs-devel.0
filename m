From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: reiserfsprogs 3.6.5-pre2 release.
Date: Wed, 5 Mar 2003 18:48:25 +0100
Message-ID: <200303051848.25635.Dieter.Nuetzel@hamburg.de>
References: <200302251650.22469.vitaly@namesys.com> <b43hko$qeg$1@satsuki.furryterror.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13080-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b43hko$qeg$1@satsuki.furryterror.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com
Cc: Vitaly Fertman <vitaly@namesys.com>

Am Mittwoch, 5. M=E4rz 2003 01:50 schrieb Zygo Blaxell:
> In article <200302251650.22469.vitaly@namesys.com>,
>
> Vitaly Fertman  <vitaly@namesys.com> wrote:
> >this new pre-release includes:
> >- reiserfsck -a (started at boot) replays journal, checks error flags in
> >the superblock, bitmaps, fs size, 2 levels of internal tree and switches
> >to fixble mode if any problem is detected. For root fs fixable cannot be
> >performed (as fs is mounted) and just --check will be done.
>
> I get:
>
> 	Checking all file systems...
> 	fsck 1.27 (8-Mar-2002)
> 	Reiserfs super block in block 16 on 0x902 of format 3.6 with standard
> journal Blocks (total/free): 32848/22393 by 4096 bytes
> 	Filesystem is cleanly umounted
>
> 	flush_buffers: device is not specifed
> 	Warning... fsck.reiserfs for device /dev/md2 exited with signal 6.
> 	Reiserfs super block in block 16 on 0x900 of format 3.6 with standard
> journal Blocks (total/free): 37446896/1277098 by 4096 bytes
> 	Filesystem is cleanly umounted
>
> 	flush_buffers: device is not specifed
> 	Warning... fsck.reiserfs for device /dev/md0 exited with signal 6.
>
> 	fsck failed.  Please repair manually.
>
> 	CONTROL-D will exit from this shell and continue system startup.
>
> 	Give root password for maintenance
> 	(or type Control-D for normal startup):
>
> ...at which point booting stops.

Same here with all my "normal" SCSI disks.
See my former "reiserfsprogs-3.6.5-pre2: volumes do not mount during boot"=
=20
post.

Should I try reiserfsck --rebuild-tree?

Thanks,
	Dieter

=2D-=20
Dieter N=FCtzel
Graduate Student, Computer Science

University of Hamburg
Department of Computer Science
@home: Dieter.Nuetzel at hamburg.de (replace at with @)
