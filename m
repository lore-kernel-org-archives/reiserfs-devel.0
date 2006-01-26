From: Jens Axboe <axboe@suse.de>
Subject: Re: random minor benchmark: Re: Copy 20 tarfiles: ext2 vs (reiser4, unixfile) vs (reiser4,cryptcompress)
Date: Thu, 26 Jan 2006 16:33:43 +0100
Message-ID: <20060126153343.GH4311@suse.de>
References: <43D7C6BE.1010804@namesys.com> <43D7CA7F.4010502@namesys.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932351AbWAZPbe@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <43D7CA7F.4010502@namesys.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Edward Shishkin <edward@namesys.com>, LKML <linux-kernel@vger.kernel.org>, Reiserfs mail-list <Reiserfs-List@namesys.com>

On Wed, Jan 25 2006, Hans Reiser wrote:
> Notice how CPU speed (and number of cpus) completely determines
> compression performance.
> 
> cryptcompress refers to the reiser4 compression plugin, (unix file)
> refers to the reiser4 non-compressing plugin.
> 
> Edward Shishkin wrote:
> 
> > Here are the tests that vs asked for:
> > Creation (dd) of 20 tarfiles (the original 200M file is in ramfs)
> > Kernel: 2.6.15-mm4 + current git snapshot of reiser4
> >
> > ------------------------------------------
> >
> > Laputa workstation
> > Uni Intel Pentium 4 (2.26 GHz) 512M RAM
> >
> > ext2:
> > real 2m, 15s
> > sys 0m, 14s
> >
> > reiser4(unix file)
> > real 2m, 7s
> > sys  0m, 23s
> >
> > reiser4(cryptcompress, lzo1, 64K)
> > real 2m, 13s
> > sys 0m, 11s

Just curious - does your crypt plugin reside in user space?

-- 
Jens Axboe
