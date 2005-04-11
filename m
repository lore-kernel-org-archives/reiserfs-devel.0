From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Less disk space with reiser4?
Date: Mon, 11 Apr 2005 23:52:53 +0400
Message-ID: <20050411195253.GD6211@backtop.namesys.com>
References: <425A8A1D.9040206@siwnet.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23851-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <425A8A1D.9040206@siwnet.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefan Andersson <stefan@siwnet.net>
Cc: reiserfs-list@namesys.com

On Mon, Apr 11, 2005 at 04:30:53PM +0200, Stefan Andersson wrote:
> Hi,
> 
> I have a disk array wich I used reiserfs(v3) on, and got 932G.
> Now I started to test reiser4 on it and get less space, 886G.
> 
> Is it suppose to be like this or is there something wrong?

reiser4 reserves 5% of disk space.  

That is so because of delayed block allocation impelented in reiser4.  Actual
block allocation is done near the transaction commit, it means the allocation
has to be reliable -- we can't return ENOSPC because the write(2) call when we
could return an error was already completed successfully.  

The reserved space makes the allocation reliable because it covers possible
insertions (and growing of the internal reiser4 tree) of new extent items
insertions on a highly fragmented fs.

> I'am using linux 2.6.11.4 and default settings for mkfs.reiser4 and 
> mkfs.reiserfs,
> and reiser4 patch from 2.6.11-mm3.
> 
> //Stetan
> 

-- 
Alex.
