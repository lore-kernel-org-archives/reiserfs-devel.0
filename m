From: Andrew Morton <akpm@digeo.com>
Subject: Re: [BK][PATCH] Reiser4, will double Linux FS performance, pleaseapply
Date: Thu, 31 Oct 2002 17:17:46 -0800
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <3DC1D63A.CCAD78EF@digeo.com>
References: <3DC19F61.5040007@namesys.com> <200210312334.18146.Dieter.Nuetzel@hamburg.de> <3DC1B2FA.8010809@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Dieter =?iso-8859-1?Q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>, Jeff Garzik <jgarzik@pobox.com>, Linux Kernel <linux-kernel@vger.kernel.org>, Reiserfs-List@namesys.com, Oleg Drokin <green@namesys.com>, zam@namesys.com, umka <umka@thebsh.namesys.com>

Hans Reiser wrote:
> 
> Green and Zam and Umka, on Monday please start work on seriously
> analyzing how the block allocation differs between the new and the old
> kernel, now that you can finally reproduce the benchmark on the old kernel.

I just sent the Orlov allocator patch to Linus.  It will double or
triple ext2 performance in that test, so please make sure you compare
against the latest.  There's a copy at
http://www.zip.com.au/~akpm/linux/patches/2.5/2.5.45/shpte-stuff/broken-out/orlov-allocator.patch

We can expect similar gains for ext3, when that's done.

(The 2x-3x is on an 8meg filesystem.  Larger filesystems should
gain more)
