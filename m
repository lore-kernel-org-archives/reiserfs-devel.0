From: Mike Fedyk <mfedyk@matchmail.com>
Subject: Re: [r4] a few benchmarks
Date: Sun, 17 Aug 2003 14:16:41 -0700
Message-ID: <20030817211641.GZ1027@matchmail.com>
References: <20030816203028.GA14504@chepelov.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15352-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030816203028.GA14504@chepelov.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cyrille Chepelov <cyrille@chepelov.org>
Cc: reiserfs-list@namesys.com

On Sat, Aug 16, 2003 at 10:30:28PM +0200, Cyrille Chepelov wrote:
> Hi all,
> 
> I performed a couple of benchmarks on a spare machine, and put them online.
> 
> I couldn't perform all the tests I wanted (see my previous "oops" message),
> the hardware is not exactly representative of today's machines, some details
> would use some tuning for more representative results, and I had
> ideas for extra things I'd like to measure, but here are today's results anyway
> for what it's worth: http://www.chepelov.org/cyrille/fsbench-results

Nice.

You should umount the partition if you want to clear the cache, and you are
doing this between filesystems so that might affect your results also
somewhat (you umounted before the mkfs for the next filesystem tested, right?)
