From: Oleg Drokin <green@namesys.com>
Subject: Re: kernel loop with lseek + LFS on reiser partition.
Date: Tue, 23 Apr 2002 08:58:00 +0400
Message-ID: <20020423085800.B4770@namesys.com>
References: <200204221910.16392.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10138-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <200204221910.16392.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dieter N?tzel <Dieter.Nuetzel@hamburg.de>
Cc: wolfgang.glas@ev-i.at, Chris Mason <mason@suse.com>, Robert Love <rml@tech9.net>, ReiserFS List <reiserfs-list@namesys.com>

Hello!

On Mon, Apr 22, 2002 at 07:10:16PM +0200, Dieter N?tzel wrote:

> > I think this is because of expanding-truncate patch.
> > So, the real bug is this process cannot get interrupted until finished
> > which opens a window for resource-eating.

> /database/db1> time ~/Entwicklung/ReiserFS/testprg
> 0.000u 545.310s 9:12.69 98.6%   0+0k 0+0io 124pf+0w

9 minutes as expected from your HW config.

> -rw-r--r--    1 nuetzel  users    137438953485 Apr 22 17:22 seek.tmp
> /dev/sdb5               859412    166264    693148  20% /database/db1
> Isn't this only a "bad" glibc "speed test"?

Huh? glibc have nothing to do with this result.

> With my latest latencytest0.42-png tests I found that there are one or two 
> locks remaining in the VFS or ReiserFS code (preemption and/or lock-break 
> could be the culprit, too).

We already have identified a problem place and testing the patch before
releasing it to the public.

Bye,
    Oleg
