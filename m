From: Hans Reiser <reiser@bitshadow.namesys.com>
Subject: Re: delayed file deallocation?
Date: Mon, 15 Mar 2004 12:57:47 +0300
Message-ID: <200403151257.47145.reiser@bitshadow.namesys.com>
References: <20040315074452.GG19159@exavio.com.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17214-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040315074452.GG19159@exavio.com.cn>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Isaac Claymore <clay@exavio.com.cn>, reiserfs-list@namesys.com
Cc: mason@suse.com

On Monday 15 March 2004 10:44, Isaac Claymore wrote:
> Hi list,
>
> We're using reiser 3.6 as workhorse fs beneath Samba in our NAS setup.
> Under our workload, it's common that tens of clients (often around 20)
> are doing real-time video editing simultaneously. We've been suffering a
> scenario that when one client comes and deletes some large file while
> many others are busy editing, the many others will experience noticeable
> period of IO stalling, usually of about 3 seconds. And, since they're
> doing some kind of realtime editing, this stall is unacceptable.
>
> I'm wondering that whether the file deallocation could be delayed
> somewhat, i.e. when a file is unlink()'ed by Samba, fs driver just mark
> the file to-be-deallocated when its reference count reaches zero. Then,
> the fs driver, at some later time, either triggered by user space or when
> lack of free space, actually commits the deallocation. Since we have
> plenty of free disk space, this deallocation scheme does make sense.
>
> It's possible to do this in user space, say, by modifying Samba so that
> it creates an extra secret link to each file it creates, and write
> another program that routinely checks the secret links, at proper times,
> for those inodes with inode ref count of 1, and unlinks them.
>
> But for some reason, we do not want to touch Samba code, then it looks that
> this can only be done at fs level.
>
> How can I achieve this with Reiser? Or, if you've some alternatives,
> please kindly enlighten me.
>
> Thanks for any hint or suggestion.
This is definitely fixable, but someone would need to sponsor the fix as we 
are low on funds.  Probably it would not be all that expensive to fix.  
Chris, forgive my memory, did any of your recent patches address this?

