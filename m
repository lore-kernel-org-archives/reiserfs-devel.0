From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: corruption?  how do I fix?
Date: Wed, 13 Nov 2002 09:44:03 +0100
Message-ID: <200211130944.03753.Dieter.Nuetzel@hamburg.de>
References: <3DD1DEEF.6030903@panix.com> <3DD1E56B.6080603@panix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11980-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3DD1E56B.6080603@panix.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: kenny gorman <kgorman@panix.com>, reiserfs-list@namesys.com

Am Mittwoch, 13. November 2002 06:38 schrieb kenny gorman:
> Just to add a bit to this.  I ran reiserfsck, and it returned 0.  Does
> that mean the filesystem is actually ok? Thats what the man pages see to
> suggest...
>
> byte 286719: bm1: ffffffbd bm2 ffffffff
> on-disk bitmap does not match to the correct one. 102400 bytes differ
> ok
> Checking Semantic tree...ok
> # echo $?
> 0
>
> kenny gorman wrote:
> > I am running a semi-large oracle database on reiserfs and lvm.  I
> > started receiving block corruption messages in oracle.  So I started
> > checking out the filesystem.  I ran debugreiserfs and I get the
> > following.  Is this bad?  I can't seem to find docs on
> > repair/restoration of reiserfs filesystems around.. am I just missing
> > em?  We are down so any help would be really great.  Thx!
> >
> > See output of debugreiserfs:
> >
> > # debugreiserfs /dev/datagrp/datavol
> >
> > <-------------debugreiserfs, 2001------------->
> > reiserfsprogs 3.x.0j
> > reiserfs_open: bitmap 45 was marked free
> > <repeated until>
> > reiserfs_open: bitmap 69 was marked free
> > Super block of format 3.5 found on the 0x3 in block 16
> > Block count 7752704
> > Blocksize 4096
> > Free blocks 2361789
> > Busy blocks (skipped 16, bitmaps - 237, journal blocks - 8193
> > 1 super blocks, 5382468 data blocks
> > Root block 8384
> > Journal block (first) 18
> > Journal dev 0
> > Journal orig size 8192
> > Filesystem state ERROR
> > Tree height 4
> > Hash function used to sort names: "r5"
> > Objectid map size 2, max 1004
> > Version 0

Kenny,

please start with the latest reiserfsprogs version 3.6.4.
ftp://ftp.namesys.com/pub/reiserfsprogs

Run it in "scan mode" readonly, again.

Good luck!

=2DDieter
=2D-=20
Dieter N=FCtzel
Graduate Student, Computer Science

University of Hamburg
Department of Computer Science
@home: Dieter.Nuetzel at hamburg.de (replace at with @)

