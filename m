From: Jeffrey Mahoney <jeffm@suse.com>
Subject: Re: vs-4080
Date: Mon, 23 Jan 2006 23:43:33 -0500
Message-ID: <43D5B075.1030307@suse.com>
References: <200601111109.09437.rmeijer@internet.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27841-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200601111109.09437.rmeijer@internet.gr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Raymond A. Meijer" <rmeijer@internet.gr>
Cc: reiserfs-list@namesys.com

Raymond A. Meijer wrote:
> Hello,
> 
> This morning I found the following warning on my Debian server holding a 253
> GB Debian archive mirror:
> 
> ReiserFS: dm-8: warning: vs-4080: reiserfs_free_block: free_block (dm-8:46707368)[dev:blocknr]: bit already cleared
> 
> If fixed it with --fix-fixable, but what was it and what does it mean?

What kernel version are you using for this node? I've been developing
the on-demand bitmap patches and have been getting one of these under
heavy sustained load. I've assumed that it was a result of my patches,
but I'm curious what kernel you're running.

Are you running a -mm kernel, stock, or vendor? Which version?

Thanks.

-Jeff

--
Jeff Mahoney
jeffm@suse.com
