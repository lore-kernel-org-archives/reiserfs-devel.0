From: Chris Mason <mason@suse.com>
Subject: Re: write barrier patches for 2.4.21
Date: 28 Aug 2003 21:44:34 -0400
Message-ID: <1062121473.5322.161.camel@tiny.suse.com>
References: <20030825170849.GA14811@mfa.kfki.hu> <20030826214624.GA410@zero>
	 <20030827064103.GA29131@namesys.com> <20030827220337.GB4886@zero>
	 <1062031059.5324.111.camel@tiny.suse.com>
	 <20030828170725.GB21352@matchmail.com> <20030829000730.GA9019@zero>
	 <20030829011852.GI21352@matchmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15487-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030829011852.GI21352@matchmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Fedyk <mfedyk@matchmail.com>
Cc: Tom Vier <tmv@comcast.net>, Reiserfs List <reiserfs-list@namesys.com>

On Thu, 2003-08-28 at 21:18, Mike Fedyk wrote:
>  
> > i'm not sure what you mean. chris is just saying tcq makes performance w/o
> > write cache better. i WOULD like to see wb's used w/ scsi. it would be nice
> > to be able to safely enable write cache on my drives.
> 
> I'm just trying to clairify that it looks like TCQ shows exactly what it
> happening in the drive's cache, and that's why with tcq the wb's aren't
> explicitly needed.
> 
> With ide without tcq and with write caching, it accepts the write request
> and says it's complete when it's actually still in the disks cache, not on
> the platters yet.
> 
> Contrast that to TCQ (IDE or SCSI), where the write request is sent to the
> drive, and once it hits the platter, the tcq command completes and notifies
> the host OS (Linux in this case) that it's done.  And SCSI with no TCQ is
> like IDE with no write cache.
> 
> Do I have that right?

Pretty much.  If your tag depth is set right, you get the benefits of
writeback caching without the risk.  But your workload has to be right.

Picture one process doing synchronous io writes.  He's only going to
generate one tag and then wait on it.  With writeback cache, the drive
will return immediately, but with just tcq you'll still have to wait.

For the one writer workload with the barrier patches, the writeback
cache disk will be just as slow as the tcq disk.  This is usually what
you want, since if you're taking the time to do synchronous IO it's
because you want to know the data is really on disk (or on battery
backed cache somewhere).

-chris






