From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: Could not make new filesystem
Date: Thu, 06 Mar 2003 03:04:05 +0100
Message-ID: <3E66AC95.2050808@mb.tu-ilmenau.de>
References: <20030305193852.6394596d.treaves@silverfields.com> <592809843.20030306014719@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13103-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list <reiserfs-list@namesys.com>

On 03/06/2003 01:47 AM, Anders Widman wrote:
 >>        Hello all.
 >
 >>        Today I tried to make a new file system on a 154 gig driver, 
/dev/sdb1.
 >>reiserfs could not do it.  It would give errors ( I did not write it 
down,
 >>but think it was '/dev/sdb1 is not a valid block device').  This suprised
 >>me.  I have used reiser exclusivly for a while.  I know it was not a disk
 >>problem, as jfs had no problem creating a filesystem, and I can use it
 >>that way.
 >
 >>        This is a standard SuSE box.
 >
 >>        Any idea?
 >
 >   1) Have you used large drives before?
 >   2) Is the partition table correct?
 >   3) .. other things you might have forgotten?
        like
     3.a) SuSE version
       b) kernel version
       c) reiserfsprogs version -- please, try the
          most recent release- or pre-release-
          version from:
           ftp://ftp.namesys.com/pub/reiserfsprogs/    or
           ftp://ftp.namesys.com/pub/reiserfsprogs/pre/
       d) things I may have forgotten ...


Manuel


