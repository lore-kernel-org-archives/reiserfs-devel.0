From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: ReiserFS Maximum file size (in practice)
Date: Wed, 19 May 2004 12:33:16 +0400
Message-ID: <20040519083316.GJ16332@backtop.namesys.com>
References: <40AA74CA.5040306@suse.com> <1084927507.27142.2.camel@watt.suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18761-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1084927507.27142.2.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <mason@suse.com>
Cc: Jeff Mahoney <jeffm@suse.com>, Reiserfs mail-list <Reiserfs-List@Namesys.COM>

On Tue, May 18, 2004 at 08:45:07PM -0400, Chris Mason wrote:
> On Tue, 2004-05-18 at 16:40, Jeff Mahoney wrote:
> > Hey all -
> > 
> > The ReiserFS FAQ that we quote and point people to when they ask 
> > questions about limits in ReiserFS states that the maxmimum file size 
> > for a reiserfs v3 filesystem is 2^60-1. However, the actual limits, in 
> > practice, are far less.
> > 
> > I tried to create a 3 TB sparse file, and ended up getting told it was 
> > too large. 2 TB was too large also, just under 2 TB was ok.
> > 
> > This is a result of super->s_maxbytes = (512LL << 32) - s->s_blocksize;, 
> > in fs/reiserfs/super.c, which is set so that i_blocks isn't overflowed.
> > 
> > Other filesystems that have the ability to cross the 2 TB limit on file 
> > sizes simply ignore the limit and allow i_blocks to wrap. There's really 
> > no reason we can't do the same.
> > 
> > The patch is attached.
> 
> Are quotas happy with this?

quota database initialization is affected, I guess.

> -chris

-- 
Alex.
