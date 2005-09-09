From: Christoph Hellwig <hch@infradead.org>
Subject: Re: List of things requested by lkml for reiser4 inclusion (to review)
Date: Fri, 9 Sep 2005 20:00:07 +0100
Message-ID: <20050909190007.GA12109@infradead.org>
References: <200509091817.39726.zam@namesys.com> <4321C806.60404@namesys.com> <20050909185740.GA11923@infradead.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-25911-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20050909185740.GA11923@infradead.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@infradead.org>, Hans Reiser <reiser@namesys.com>, Andrew Morton <akpm@osdl.org>, LKML <linux-kernel@vger.kernel.org>, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Fri, Sep 09, 2005 at 07:57:40PM +0100, Christoph Hellwig wrote:
> A very annoying small thing that comes to mind is the usage of
> reiser4_internal.  Please remove it, all but exported symbol are
> module-private.

Oh, one other things that's totally annoying and makes reading the
code a pain are the line-length and comment style.  Please wrap
lines after 80 chars and use normal

/* foobar, blagg */

or 

/*
 * fvsfafsfasdrfasddddddddddddddddddddd
 * fdsfsfdsfsdf
 * sdfsdfs
 */

comments, thanks

