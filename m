From: Chris Mason <mason@suse.com>
Subject: Re: snapshot 2004.03.26 + linux 2.6.5 = build error
Date: Mon, 05 Apr 2004 09:12:42 -0400
Message-ID: <1081170762.4977.1.camel@watt.suse.com>
References: <20040404161030.GA21978@raptus.homelinux.org>
	 <200404051540.58430.rmeijer@internet.gr>
	 <16497.21749.932806.34057@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17721-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16497.21749.932806.34057@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: "Raymond A. Meijer" <rmeijer@internet.gr>, reiserfs-list@namesys.com

On Mon, 2004-04-05 at 08:45, Nikita Danilov wrote:

> Try this:
> 
> ----------------------------------------------------------------------
> ===== as_ops.c 1.69 vs edited =====
> --- 1.69/as_ops.c	Thu Feb 19 20:12:42 2004
> +++ edited/as_ops.c	Mon Apr  5 16:43:30 2004
> @@ -567,7 +565,7 @@
>  	/* work around infinite loop in pdflush->sync_sb_inodes. */
>  	/* Problem: ->writepages() is supposed to submit io for the pages from
>  	 * ->io_pages list and to clean this list. */
> -	mapping->dirtied_when = jiffies|1;
> +	mapping->host->dirtied_when = jiffies|1;
                                       ^^^^^^^^^^^^

This was a bug fixed in the -mm tree (might be in mainline now too). 
You need to get rid of the |1, it can lead to a dirtied_when in the
future, and missed writeback.

-chris


