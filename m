From: William Stearns <wstearns@pobox.com>
Subject: Re: Unable to create reiserfs on an empty file
Date: Wed, 3 Apr 2002 11:28:01 -0500 (EST)
Message-ID: <Pine.LNX.4.44.0204031126300.8574-100000@sparrow.websense.net>
References: <20020403201601.A1918@namesys.com>
Reply-To: William Stearns <wstearns@pobox.com>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020403201601.A1918@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: ML-reiserfs <reiserfs-list@namesys.com>, William Stearns <wstearns@pobox.com>

Good day, Oleg,

On Wed, 3 Apr 2002, Oleg Drokin wrote:

> On Wed, Apr 03, 2002 at 09:56:34AM -0500, William Stearns wrote:
> 
> > 	I'd be interested in hearing whether the following issue is 1) 
> > PEBCAK (Problem Exists Between Chair And Keyboard) on my part ;-), 2) a 
> > bug in mkreiserfs, 3) a known issue with or without an available fix, or 
> > 4) a non-issue.
> > 	My sincerest apologies if I've made a silly mistake at this end.
> > 	Cheers,
> 
> Hm. I remembered I answered such a question, but my mailbox seems to contradict.

	It might very well have been under a different subject.

> Ok, so this was not a problem, but a design decision instead.
> mkreiserfs did only work on device files.
> 
> reiserfs 3.x.0j is old though.
> And new reiserfsprogs 3.x.1b (latest stable) can create filesystem on files
> now. (you need to specify -f switch)

	Excellent!  I'll pull down the latest version.
	Thank you so much for taking the time to respond - I really 
appreciate it.
	Cheers,
	- Bill

---------------------------------------------------------------------------
        "Absence diminishes mediocre passions and increases great ones,
as the wind blows out candles and fans fires."
        -- La Rochefoucauld
--------------------------------------------------------------------------
William Stearns (wstearns@pobox.com).  Mason, Buildkernel, named2hosts, 
and ipfwadm2ipchains are at:                        http://www.stearns.org
--------------------------------------------------------------------------

