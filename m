From: Soeren Sonnenburg <reiserfs@nn7.de>
Subject: Re: BUGed to death
Date: 15 Apr 2003 18:22:03 +0200
Message-ID: <1050423723.13822.39.camel@fortknox>
References: <20030415143024.GA10117@rushmore>
	 <20030415155708.GB17152@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13664-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030415155708.GB17152@suse.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Tue, 2003-04-15 at 17:57, Dave Jones wrote:
> On Tue, Apr 15, 2003 at 10:30:24AM -0400, rwhron@earthlink.net wrote:
>  > The patch below eliminates 4 BUG() calls that clearly 
>  > cannot happen based on the context.

[...]

> Imagine I pass in 20. Previously, the BUG triggers. Not any more.
> Ditto the other changes.  Or am _I_ missing something ?

Am I having a deja vu ? For me it seems this patch has been posted some
time ago and I was also fooled by the patch at first.

BUT: the original author is right. You just have to look at the original
code not only the patch sniplet.

Soeren.

