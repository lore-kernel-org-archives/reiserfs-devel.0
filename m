From: Anders Widman <andewid@tnonline.net>
Subject: Re: reiserfsprogs 3.6.5-pre2 release.
Date: Wed, 26 Feb 2003 13:34:22 +0100
Message-ID: <865715375.20030226133422@tnonline.net>
References: <200302251650.22469.vitaly@namesys.com>
 <200302251712.45985.vitaly@namesys.com>
 <20030226015448.1efac468.philippe.gramoulle@mmania.com>
 <20030226102934.A2659@namesys.com> <3E5CA48C.5070807@namesys.com>
 <1794518093.20030226131425@tnonline.net> <20030226152441.A16073@namesys.com>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12934-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030226152441.A16073@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

>> Would it be possible to lower the time it takes to mount a filesystem?
>> Currently it takes about 48s to mount my fs:

> Unfortunatelly there is no easy way.
> Seems that most of the time is spent reading bitmaps (one bitmap after each 128M of data),
> and reiserfs reads in all the bitmaps at once during mount.

I  only  posted  this  because it is discussed how to lower the bootup
time. The fsck might take a few seconds when optimised, but the actual
mount of the FS takes much longer.

How  big  is  each  block  of bitmaps that is being read during mount?
Would  it  be  possible  to make the reads more efficient? I mean, now
there  would  be 6400 reads on a 800GB FS. From the sound of the disks
it does not seem as they work at 100% during mount?

(Actually,  in  my system it is not a problem is the boot takes 5 min,
but I can imagine many that do not like that)

~Anders



