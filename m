From: Jens Axboe <axboe@suse.de>
Subject: Re: random minor benchmark: Re: Copy 20 tarfiles: ext2 vs (reiser4, unixfile) vs (reiser4,cryptcompress)
Date: Fri, 27 Jan 2006 09:09:03 +0100
Message-ID: <20060127080903.GT4311@suse.de>
References: <43D7C6BE.1010804@namesys.com> <43D7CA7F.4010502@namesys.com> <20060126153343.GH4311@suse.de> <43D91225.3030605@namesys.com> <20060126185612.GM4311@suse.de> <43D933EB.6080009@namesys.com> <43D9CF3C.9070706@namesys.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S964957AbWA0IGv@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <43D9CF3C.9070706@namesys.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Edward Shishkin <edward@namesys.com>, LKML <linux-kernel@vger.kernel.org>, Reiserfs mail-list <Reiserfs-List@namesys.com>

On Thu, Jan 26 2006, Hans Reiser wrote:
> Edward Shishkin wrote:
> 
> >
> > I guess this is because real compression is going in background
> > flush, not in sys_write->write_cryptcompress (which just copies
> > user's data to page cache). So in this case we have something
> > very similar to ext2. Reiser4 plain write (write_unix_file) is
> > more complex, and currently we try to reduce its sys time.
> >
> > Edward.
> >
> >
> >
> >
> Which means that only real time is a meaningful measurement.....

Indeed. I guess the compression stuff cost is hard to quantify, since it
has cache effects on the rest of the system in addition to costing CPU
cycles on its own.

A profile of, say, dbench with and without compression would be
interesting to see. And the actual dbench reults, naturally :-)

-- 
Jens Axboe
