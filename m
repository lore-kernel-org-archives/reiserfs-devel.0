From: Isaac Claymore <clay@exavio.com.cn>
Subject: Re: delayed file deallocation?
Date: Tue, 16 Mar 2004 10:24:21 +0800
Message-ID: <20040316022421.GC28307@exavio.com.cn>
References: <20040315074452.GG19159@exavio.com.cn> <200403151257.47145.reiser@bitshadow.namesys.com> <1079346514.2808.17.camel@tribesman.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17232-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1079346514.2808.17.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com

On Mon, Mar 15, 2004 at 01:28:34PM +0300, Vladimir Saveliev wrote:
> Hello
> 
> On Mon, 2004-03-15 at 12:57, Hans Reiser wrote:
> > On Monday 15 March 2004 10:44, Isaac Claymore wrote:
> > > Hi list,
> > >
> > > We're using reiser 3.6 as workhorse fs beneath Samba in our NAS setup.
> > > Under our workload, it's common that tens of clients (often around 20)
> > > are doing real-time video editing simultaneously. We've been suffering a
> > > scenario that when one client comes and deletes some large file while
> > > many others are busy editing, the many others will experience noticeable
> > > period of IO stalling, usually of about 3 seconds. And, since they're
> > > doing some kind of realtime editing, this stall is unacceptable.
> > >
> > > I'm wondering that whether the file deallocation could be delayed
> > > somewhat, i.e. when a file is unlink()'ed by Samba, fs driver just mark
> > > the file to-be-deallocated when its reference count reaches zero. Then,
> > > the fs driver, at some later time, either triggered by user space or when
> > > lack of free space, actually commits the deallocation. Since we have
> > > plenty of free disk space, this deallocation scheme does make sense.
> > >
> > > It's possible to do this in user space, say, by modifying Samba so that
> > > it creates an extra secret link to each file it creates, and write
> > > another program that routinely checks the secret links, at proper times,
> > > for those inodes with inode ref count of 1, and unlinks them.
> > >
> > > But for some reason, we do not want to touch Samba code, then it looks that
> > > this can only be done at fs level.
> > >
> 
> You do not need to touch samba. Instead you may write your our unlink
> function and have it called instead of libc's one.
> 

Thanks very much for the hint, and I've found a library who does exactly
this:

http://m-arriaga.net/software/libtrash/

> 
> > > How can I achieve this with Reiser? Or, if you've some alternatives,
> > > please kindly enlighten me.
> > >
> > > Thanks for any hint or suggestion.
> > This is definitely fixable, but someone would need to sponsor the fix as we 
> > are low on funds.  Probably it would not be all that expensive to fix.  
> > Chris, forgive my memory, did any of your recent patches address this?
> > 
> > 

-- 

Regards, Isaac
()  ascii ribbon campaign - against html e-mail
/\                        - against microsoft attachments

