From: Oleg Drokin <green@namesys.com>
Subject: Re: Horrible ftruncate performance
Date: Wed, 16 Jul 2003 14:35:39 +0400
Message-ID: <20030716103539.GB4955@namesys.com>
References: <Pine.LNX.4.30.0307151407100.6563-100000@divine.city.tvnet.hu> <200307151848.59027.Dieter.Nuetzel@hamburg.de> <20030715170540.GA1213@namesys.com> <200307152155.09716.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14947-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200307152155.09716.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dieter N?tzel <Dieter.Nuetzel@hamburg.de>
Cc: Chris Mason <mason@suse.com>, Szakacsits Szabolcs <szaka@sienet.hu>, Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>, reiserfs-list@namesys.com

Hello!

On Tue, Jul 15, 2003 at 09:55:09PM +0200, Dieter N?tzel wrote:

> Somewhat.
> Mouse movement is OK, now. But...
> 
> 1+0 Records aus
> 0.000u 3.090s 0:16.81 18.3%     0+0k 0+0io 153pf+0w
> 0.000u 0.050s 0:00.27 18.5%     0+0k 0+0io 122pf+0w
> INSTALL/SOURCE> time dd if=/dev/zero of=sparse1 bs=1 seek=200G count=1 ; time 
> sync
> 1+0 Records ein
> 1+0 Records aus
> 0.000u 3.010s 0:15.27 19.7%     0+0k 0+0io 153pf+0w
> 0.000u 0.020s 0:01.01 1.9%      0+0k 0+0io 122pf+0w

So you create a file in 15 seconds and remove it in 15 seconds.
Kind of nothing changed except mouse now moves, am I reading this wrong?

> INSTALL/SOURCE> time rm sparse ; time sync
> 0.000u 14.990s 1:31.15 16.4%    0+0k 0+0io 130pf+0w
> 0.000u 0.030s 0:00.22 13.6%     0+0k 0+0io 122pf+0w

So the stuff fell out of cache and we need to read it again.
hence the increased time. Hm, probably this case can be optimized
if there is only one item in the leaf and this item should be removed.
Need to take closer look to balancing code.

Bye,
    Oleg
