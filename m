From: Harald Radke <harryrat@gmx.de>
Subject: Re: resize_reiserfs probs
Date: Mon, 23 Jun 2003 09:02:05 +0200
Message-ID: <200306230902.05070.harryrat@gmx.de>
References: <200306230132.08812.harryrat@gmx.de> <3EF69F09.90404@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14659-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EF69F09.90404@gmx.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Good morning all!

>> "resize_reiserfs: can't shrink fs; too many blocks already allocated"
>>[...]

> I know this one very well. Please tell us the exact (including spaces)
> command line you were using to resize it. I suspect user error here - at
> least it was one when I got this error.

ok, first, here's the output of FDISK
------------------------------------------
[--- # of cylinders is > 1024 (is 1099) ---]

Disk /dev/hda: 10.0 GB, 10056130560 bytes
240 heads, 63 sectors/track, 1299 cylinders
Units = cylinders of 15120 * 512 = 7741440 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/hda1             1        35    264568+  82  Linux swap
/dev/hda2   *        36        37     15120   83  Linux
/dev/hda3            38      1299   9540720   83  Linux


the commad was 

-> resize_reiserfs -s -9240720K /dev/hda3

I also tried

-> resize_reiserfs -s -9200M /dev/hda3
(for "testing" purposes"....same prob)


Thx


Harry
