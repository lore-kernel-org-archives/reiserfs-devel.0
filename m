From: Chris Mason <mason@suse.com>
Subject: Re: delayed file deallocation?
Date: Mon, 15 Mar 2004 08:48:01 -0500
Message-ID: <1079358480.8748.384.camel@watt.suse.com>
References: <20040315074452.GG19159@exavio.com.cn>
	 <200403151257.47145.reiser@bitshadow.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17219-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200403151257.47145.reiser@bitshadow.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@bitshadow.namesys.com>
Cc: Isaac Claymore <clay@exavio.com.cn>, reiserfs-list@namesys.com

On Mon, 2004-03-15 at 04:57, Hans Reiser wrote:
> On Monday 15 March 2004 10:44, Isaac Claymore wrote:
> > Hi list,
> >
> > We're using reiser 3.6 as workhorse fs beneath Samba in our NAS setup.
> > Under our workload, it's common that tens of clients (often around 20)
> > are doing real-time video editing simultaneously. We've been suffering a
> > scenario that when one client comes and deletes some large file while
> > many others are busy editing, the many others will experience noticeable
> > period of IO stalling, usually of about 3 seconds. And, since they're
> > doing some kind of realtime editing, this stall is unacceptable.
> >
> > I'm wondering that whether the file deallocation could be delayed
> > somewhat, i.e. when a file is unlink()'ed by Samba, fs driver just mark
> > the file to-be-deallocated when its reference count reaches zero. Then,
> > the fs driver, at some later time, either triggered by user space or when
> > lack of free space, actually commits the deallocation. Since we have
> > plenty of free disk space, this deallocation scheme does make sense.
> >
> > It's possible to do this in user space, say, by modifying Samba so that
> > it creates an extra secret link to each file it creates, and write
> > another program that routinely checks the secret links, at proper times,
> > for those inodes with inode ref count of 1, and unlinks them.
> >
> > But for some reason, we do not want to touch Samba code, then it looks that
> > this can only be done at fs level.
> >
> > How can I achieve this with Reiser? Or, if you've some alternatives,
> > please kindly enlighten me.
> >
> > Thanks for any hint or suggestion.
> This is definitely fixable, but someone would need to sponsor the fix as we 
> are low on funds.  Probably it would not be all that expensive to fix.  
> Chris, forgive my memory, did any of your recent patches address this?
> 
> 
There are two different sides to this problem.

1) make the unlink happen at a much later time.  This isn't coded
2) get rid of the stalls while unlinking.  I think I've got this largely
fixed.  The patch set sent to Andrew on Friday had both of the most
important fixes there for 2.6.  The 2.4 data logging patch set has some
fixes here, there are a few more in Andrea's -aa kernel series.

Intel, suse and a few others are doing latency tests on 2.6 now, things
should generally improve over the next few weeks.

-chris


