From: Anders Widman <andewid@tnonline.net>
Subject: Re: Could not make new filesystem
Date: Thu, 6 Mar 2003 01:47:19 +0100
Message-ID: <592809843.20030306014719@tnonline.net>
References: <20030305193852.6394596d.treaves@silverfields.com>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13102-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030305193852.6394596d.treaves@silverfields.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

>         Hello all.

>         Today I tried to make a new file system on a 154 gig driver, /dev/sdb1.
> reiserfs could not do it.  It would give errors ( I did not write it down,
> but think it was '/dev/sdb1 is not a valid block device').  This suprised
> me.  I have used reiser exclusivly for a while.  I know it was not a disk
> problem, as jfs had no problem creating a filesystem, and I can use it
> that way.

>         This is a standard SuSE box.

>         Any idea?

  1) Have you used large drives before?
  2) Is the partition table correct?
  3) .. other things you might have forgotten?

  



--------
PGP public key: https://tnonline.net/secure/pgp_key.txt

