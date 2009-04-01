From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: [patch 00/35] Jeff's ReiserFS Patch Queue
Date: Thu, 2 Apr 2009 01:59:39 +0200
Message-ID: <20090401235937.GA6131@nowhere>
References: <20090330180215.951354436@suse.com> <alpine.LFD.2.00.0903301236280.4093@localhost.localdomain> <20090401161657.GA13802@elte.hu> <49D39642.9070606@suse.com> <20090401163407.GE22517@elte.hu> <20090401165134.GA5924@nowhere> <20090401221850.GB6776@brong.net>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:references:mime-version:content-type
         :content-disposition:in-reply-to:user-agent;
        bh=vV0iMfx00PELuaBcK+5CPTyI0aifMr4gZ1ODahqkhb4=;
        b=tGSWyTU+4FgenCptJL4bhRVGJ2cs4DXuaIEQG+qde3QnI9vNgJGcoJ3yA7339hlz1D
         9oXdYtwvVmYUvUbOIvRi9prw8QHe7mw6K6UqWQvNQB+1PXkBzEQCXACY1hGrqot+8HaC
         1wxhqG0DOvC5NA79BNWXnYvd0cwkrXfQYiHo0=
Content-Disposition: inline
In-Reply-To: <20090401221850.GB6776@brong.net>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bron Gondwana <brong@fastmail.fm>
Cc: Ingo Molnar <mingo@elte.hu>, Jeff Mahoney <jeffm@suse.com>, Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

On Thu, Apr 02, 2009 at 09:18:50AM +1100, Bron Gondwana wrote:
> On Wed, Apr 01, 2009 at 06:51:36PM +0200, Frederic Weisbecker wrote:
> > > I'll let Frederic describe it but AFAIK the patch is working fine 
> > > with the BKL as a mutex and no lockdep complaints or lockups. The 
> > > main focus is now on finding the performance affecting spots, 
> > > because Frederic's main desktop is on reiserfs and he does not 
> > > accept a slowdown :)
> > 
> > Hehe :-)
> > No actually I would accept a tiny slowdown but I fear that the common
> > reiserfs users wouldn't.
> 
> We run big(ish) imap servers with up to 80 reiserfs partitions
> spread over a bunch of SCSI or SAS attached external drive units.
> I'm actually surprised that the BKL isn't causing us much pain
> (load is amazingly low considering how many users are on these
> boxes - at least now that we have 32Gb RAM and 64 bit kernels).
>
> Are you still using an "entire reiserfs subsystem" mutex, or
> per-filesystem locking?  If it's per filesystem, then I suspect
> we'll be big fans!



Yeah. It is per superblock :-)

Frederic.


>  
> > I'm still working on this and once it's ready enough for an RFC patch,
> > I'll explain how is done the conversion to a mutex.
> > 
> > Stay tuned.
> 
> Sure will!
> 
> Thanks,
> 
> Bron.

