From: Brandon Low <lostlogic@gentoo.org>
Subject: Re: r4 v. ext3, quick speed vs. cpu experiments
Date: Tue, 5 Aug 2003 17:49:10 -0500
Message-ID: <20030805224909.GA26180@lostlogicx.com>
References: <3F302A54.2050204@mrs.umn.edu> <Pine.LNX.4.30.0308052251530.6739-100000@divine.city.tvnet.hu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15163-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.30.0308052251530.6739-100000@divine.city.tvnet.hu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Szakacsits Szabolcs <szaka@sienet.hu>
Cc: Grant Miner <mine0057@mrs.umn.edu>, reiserfs-list@namesys.com

On Tue, 08/05/03 at 23:08:31 +0200, Szakacsits Szabolcs wrote:
> BTW, from your numbers it seems ext3 gives better overall performance.
> 
That is an incorrect statement.  Reiserfs is KNOWN to be heavier on CPU
than other filesystems, it's benefit is not there, it's benefit is in
speed of operation, and efficiency of disk accesses.  It would be near
impossible for a filesystem with 4x (unsure of this figure) the code of
ext3 to execute in the same CPU time, but the fact that it is
consistently a LOT faster on the total run time is very impressive.

--Brandon

> 	Szaka
> 
