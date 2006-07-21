From: Sarath Menon <sarathmenon@gmail.com>
Subject: Re: reiser4 status (correction)
Date: Fri, 21 Jul 2006 15:47:57 +0530
Message-ID: <200607211547.57433.sarathmenon@gmail.com>
References: <44BFFCB1.4020009@namesys.com> <44C043B5.3070501@slaphack.com> <44C093D2.1040703@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29099-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44C093D2.1040703@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Hans Reiser <reiser@namesys.com>, David Masover <ninja@slaphack.com>, Alexander Zarochentcev <zam@namesys.com>, vs <vs@thebsh.namesys.com>


> Sigh, no, the repacker will probably be after 4.1....
> The list of tasks for zam looks something like:
> fix bugs that arise
> debug read optimization code (CPU reduction only, has no effect on IO),
> 1 week est.  (would be nice if it was less)
> review compression code 1 day per week until it ships.
> fix fsync performance (est. 1 week of time to make post-commit writes
> asynchronous, maybe 3 weeks to create fixed-reserve for write twice
> blocks, and make all fsync blocks write twice)
> write repacker (12 weeks).

Well, this is free software, and is not backed u with a million dollars of 
funding. Trust me, these guys are doing a great job with the options they 
have. 

This is not a fliambait, but I personally feel that this is way too great 
considering the resources that the entire team has. I am more than willing to 
wait even though I have had occasional bad experiences with reiser{3,4}. 

The bottemline is that all versions of reiserfs have had great performance, 
even though with its own hiccups (which fs doesn't have ??) and simply put, 
it is a fantastic peice of code.



-- 
My mother loved children -- she would have given anything if I had been one.
		-- Groucho Marx
