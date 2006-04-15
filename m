From: Nick Piggin <npiggin@suse.de>
Subject: Re: [patch] reiser4 releasepage fix
Date: Sat, 15 Apr 2006 11:25:06 +0200
Message-ID: <20060415092506.GC14115@wotan.suse.de>
References: <20060415085758.GB14115@wotan.suse.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28492-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20060415085758.GB14115@wotan.suse.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@osdl.org>
Cc: reiserfs-list@namesys.com

On Sat, Apr 15, 2006 at 10:57:58AM +0200, Nick Piggin wrote:
> Hi Andrew,
> 
> Can you put the following in -mm please? I cc'ed Hans about it earlier.

I did test it under reclaim pressure, btw. Seems to be working OK.
