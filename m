From: Yury Umanets <umka@namesys.com>
Subject: Re: Reiser4 status: benchmarked vs. V3 (and ext3)
Date: Thu, 14 Aug 2003 09:04:29 +0400
Message-ID: <1060837469.17622.6.camel@haron.namesys.com>
References: <Pine.LNX.3.96.1030813160910.12417A-100000@gatekeeper.tmr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15306-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.3.96.1030813160910.12417A-100000@gatekeeper.tmr.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bill Davidsen <davidsen@tmr.com>
Cc: Daniel Egger <degger@fhm.edu>, Hans Reiser <reiser@namesys.com>, Nikita Danilov <Nikita@namesys.com>, Linux Kernel Mailinglist <linux-kernel@vger.kernel.org>, reiserfs mailing list <reiserfs-list@namesys.com>

On Thu, 2003-08-14 at 00:12, Bill Davidsen wrote:
> On Sun, 27 Jul 2003, Yury Umanets wrote:
> 
> > On Sun, 2003-07-27 at 18:10, Daniel Egger wrote:
> > > Am Son, 2003-07-27 um 15.28 schrieb Hans Reiser:
> 
> > > > or for which a wear leveling block device driver is used (I don't know
> > > > if one exists for Linux).
> > > 
> > > This is normally done by the filesystem (e.g. JFFS2).
> > 
> > Normally device driver should be concerned about making wear out
> > smaller. It is up to it IMHO.

> 
> The driver should do the logical to physical mapping, but the portability
> vanishes if the filesystem to physical mapping is not the same for all
> machines and operating systems. For pluggable devices this is important.
> 
> The leveling seems to be done by JFFs2 in a portable way, and that's as it
> should be. If the leveling were in the driver I don't believe even FAT
> would work.

Hello Bill,

Yes, you are right. Device driver cannot take care about leveling.

It is able only to take care about simple caching (one erase block) in 
order to make wear out smaller and do not read/write whole block if one 
sector should be written.

Part of a filesystem called "block allocator" should take care about 
leveling.

