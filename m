From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: FIFO files
Date: Wed, 18 Jun 2003 14:53:07 +0100
Message-ID: <1055944386.27851.7.camel@passion.cambridge.redhat.com>
References: <20030617162127.GA14124@chepelov.org> <3EEF40B3.6000300@gmx.net>
	 <3EEF42B6.1000409@namesys.com> <3EEF4929.20503@gmx.net>
	 <20030618061721.GA15283@namesys.com> <20030618102057.GA22264@vestdata.no>
	 <3EF04F96.7030406@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14603-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EF04F96.7030406@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>
Cc: Ragnar =?ISO-8859-1?Q?Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>, Oleg Drokin <green@namesys.com>, Hans Reiser <reiser@namesys.com>, Cyrille Chepelov <cyrille@chepelov.org>, reiserfs-list@namesys.com, linux-fsdevel@vger.kernel.org

On Wed, 2003-06-18 at 12:40, Carl-Daniel Hailfinger wrote:
> >>I do not remember any API to create holes in existing files in place of already
> >>present data.
> > 
> > There isn't one.
> > 
> > XFS uses an ioctl to punch holes, dm_punch_hole, but it's prototype is
> > specific to XDSM.
> > 
> > Once multiple filesystems implement the same functionality it makes sense 
> > to have a common interface - maybe a new entry in struct
> > inode_operations, and a corresponding systemcall?

I want to implement this for JFFS2 but refused to do it with an ioctl;
it can be done through something non-fs-specific or not at all. As soon
as there's a non-bletcherous way to expose it to the user, I'll be
implementing it.

-- 
dwmw2

