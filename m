From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: A question about slum and relocate
Date: Tue, 25 Nov 2003 13:19:03 +0300
Message-ID: <20031125101902.GB2144@backtop.namesys.com>
References: <Pine.GSO.4.58.0311241820230.6503@bingsun2.cc.binghamton.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16160-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.GSO.4.58.0311241820230.6503@bingsun2.cc.binghamton.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhihui Zhang <bf20761@binghamton.edu>
Cc: reiserfs-list@namesys.com

On Mon, Nov 24, 2003 at 06:50:07PM -0500, Zhihui Zhang wrote:
> Hi,
> 
> After reading some code, it seems to me that a slum does not have to be
> relocated.  If a slum is small , it will use the overwrite strategy.  Is
> this understanding correct?  

Not exactly.

If slum is big we set pos->leaf_relocate and always relocate leaf nodes.
Except this, flush alg. makes relocate/overwrite decision individually for each
node. Leaves can be relocated even if slum size < FLUSH_RELOCATE_THRESHOLD.

> Also, at the leaf level, if the number of
> dirty nodes exceeds FLUSH_RELOCATE_THRESHOLD (64), they are always
> relocated.  Is there any similar threshold for an internal level?  

no.

> Does Reiser4 relocate internal nodes separately (i.e. not as part of the slum
> involving leaf nodes.  

yes.

> Note a slum can grow backwards if a dirty node is the leftmost child of a
> parent at an internal level)?  Thanks for your enlightenment.
> 
> -Zhihui
> 
> -- 

-- 
Alex.
