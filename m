From: Dave Jones <davej@codemonkey.org.uk>
Subject: Re: BUGed to death
Date: Tue, 15 Apr 2003 16:57:08 +0100
Message-ID: <20030415155708.GB17152@suse.de>
References: <20030415143024.GA10117@rushmore>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13662-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030415143024.GA10117@rushmore>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rwhron@earthlink.net
Cc: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

On Tue, Apr 15, 2003 at 10:30:24AM -0400, rwhron@earthlink.net wrote:
 > The patch below eliminates 4 BUG() calls that clearly 
 > cannot happen based on the context.

This looks bogus.

 > --- linux-2.5.67-mm2/fs/reiserfs/hashes.c.orig	2003-04-15 10:11:44.000000000 -0400
 > +++ linux-2.5.67-mm2/fs/reiserfs/hashes.c	2003-04-15 10:13:43.000000000 -0400
 > @@ -90,10 +90,6 @@
 >  
 >  	if (len >= 12)
 >  	{
 > -	    	//assert(len < 16);
 > -		if (len >= 16)
 > -		    BUG();
 > -

Imagine I pass in 20. Previously, the BUG triggers. Not any more.
Ditto the other changes.  Or am _I_ missing something ?

		Dave

