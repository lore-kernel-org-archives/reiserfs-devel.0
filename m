From: Andrew Morton <akpm@osdl.org>
Subject: Re: + reiser4-big-update-div64-fix.patch added to -mm tree
Date: Fri, 16 Sep 2005 11:29:02 -0700
Message-ID: <20050916112902.1166649d.akpm@osdl.org>
References: <200509160642.j8G6gI4Q014008@shell0.pdx.osdl.net>
	<432AC5DC.4070601@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26001-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <432AC5DC.4070601@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

"Vladimir V. Saveliev" <vs@namesys.com> wrote:
>
> Hello
> 
> akpm@osdl.org wrote:
> > The patch titled
> > 
> >      reiser4-big-update-div64-fix
> > 
> > has been added to the -mm tree.  Its filename is
> > 
> >      reiser4-big-update-div64-fix.patch
> > 
> > 
> > From: Andrew Morton <akpm@osdl.org>
> > 
> > There's no implementation of __div64_32().   Nor should there be.
> > 
> 
> hmm, there is one in linux/lib/div64.c.
> 

It's only for supporting compiler-generated calls on 32-bit platforms:

	/* Not needed on 64bit architectures */
	#if BITS_PER_LONG == 32

	uint32_t __div64_32(uint64_t *n, uint32_t base)

