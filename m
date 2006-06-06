From: Tom Vier <tmv@comcast.net>
Subject: Re: reiser4: first impression (vs xfs and jfs)
Date: Tue, 6 Jun 2006 09:44:59 -0400
Message-ID: <20060606134459.GA18513@zero>
References: <20060523155102.GB25889@zero>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28742-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20060523155102.GB25889@zero>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Tue, May 23, 2006 at 11:51:02AM -0400, Tom Vier wrote:
> It seems that both r4 and xfs allow a large number of pages to be dirtied,
> before queuing them for writeback, and this has a negative effect on
> throughput. In my test (rsync'ing ~50gigs of flacs), r4 and xfs are almost
> 10 minutes slower than jfs.

Just to follow up on this (i've been too busy lately), that's how delayed
allocation works. It waits til the vm forces writeouts.

In my case of copying large files from a slower drive, the delayed allocation
of r4 and xfs is stalling reads from the source, since neither will write
until the vw forces it.

Is there a way in r4 to force sync a mount every so often, ala flushd? ext3
has the commit option. Does r4 have a hard coded sync timer already? If not,
i think it's an important feature that should be added (and made a mount
option). Otherwise, a lot of data can be lost. Does the kernel do a system
wide sync every 30sec, like it used to?

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0x15741ECE
