From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Bug report: slab error at module removal
Date: Sun, 15 Aug 2004 20:31:04 +0400
Message-ID: <20040815163104.GC4703@backtop.namesys.com>
References: <87pt5uibur.fsf@barad-dur.crans.org> <1092509502.13269.5.camel@frontdesk.gurulabs.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20300-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1092509502.13269.5.camel@frontdesk.gurulabs.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Lamont R. Peterson" <lamont@gurulabs.com>
Cc: reiserfs-list@namesys.com

On Sat, Aug 14, 2004 at 12:51:42PM -0600, Lamont R. Peterson wrote:
> On Fri, 2004-08-13 at 22:26, Mathieu Segaud wrote:
> > I don't know if this is the right place, but I just saw a kernel message
> > in my dmesg.  
> [SNIP]
> > After several hours of running some moderatly high load stuff 
> > on each of them (big transfert of data, long repacker runs...).
> > I decided to umount them and unload reiser4.ko module.
> > dmesg gave this message:
> 
> I thought that building reiser4 as a module was still not ready.  Is
> that true?
> 
> Is it safe to build and load as a module but does not remove cleanly
> yet?  Is that the reason reiser4 as a kernel module was not ready?

reiser4-as-module is supposed to work :) If it doesn't please report the bug to
the mailing list. 

> > slab error in kmem_cache_destroy(): cache `plugin_set': Can't free all objects
> >  [<c0135c41>] kmem_cache_destroy+0xd1/0x130
> >  [<f99bf57a>] plugin_set_done+0xa/0x30 [reiser4]
> >  [<f99b9194>] shutdown_reiser4+0xf4/0x210 [reiser4]
> >  [<c012a004>] sys_delete_module+0x144/0x180
> >  [<c013ea9e>] unmap_vma_list+0xe/0x20
> >  [<c013edcf>] do_munmap+0xef/0x150
> >  [<c0103afd>] sysenter_past_esp+0x52/0x71
> > SLAB: cache with size 64 has lost its name
> > SLAB: cache with size 64 has lost its name
> > SLAB: cache with size 64 has lost its name
> > SLAB: cache with size 64 has lost its name
> > SLAB: cache with size 64 has lost its name
> > SLAB: cache with size 64 has lost its name
> > SLAB: cache with size 64 has lost its name
> > SLAB: cache with size 64 has lost its name
> > SLAB: cache with size 64 has lost its name
> > SLAB: cache with size 64 has lost its name
> > SLAB: cache with size 64 has lost its name
> > 
> > The FSes are still consistent (fsck'ed with no --fix needed).
> > Unfortunatly, I turned off debugging options to test latest snapshot
> > performance. I can rebuild the module with debugging options on,
> > and try to give you a more accurate report to help find the memory leak.
> > 
> > Regards,
> -- 
> Lamont R. Peterson <lamont@gurulabs.com>
> Senior Instructor
> Guru Labs http://www.gurulabs.com/



-- 
Alex.
