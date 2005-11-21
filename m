From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: / is no longer Reiser4 :(
Date: Mon, 21 Nov 2005 22:15:46 +0300
Message-ID: <200511212215.47467.zam@namesys.com>
References: <200511191515.48570.jgilmore@glycou.com> <43820A99.2090704@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27051-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43820A99.2090704@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: John Gilmore <jgilmore@glycou.com>, reiserfs-list@namesys.com

Hi

On Monday 21 November 2005 20:57, Hans Reiser wrote:
> zam, please look into this.

>
> Hans
>
> John Gilmore wrote:
> >Following Han's comment about the deliterious effects of 6% fragmentation,
> > I attempted a manual defrag of my hard disk.
> >
> >While restoring the .tar file, I had nothing better to do than watch it.
> > And a good thing too! It got a recurring oops. about every other minute
> > or so, it would stop with a long kernel message than mostly scrolled off
> > of the screen... I thought those where supposed to show up in a log files
> > somewhere if possible, but I can't find it. And it should have been
> > possible, as the computer continued to run just fine.
> >
> >These oopses caused some sort of data corruption - root wouldn't boot

one bug responsible for fs corruption was fixed recently.
the fix is in 2.6.14-mm2 already.

> > properly afterwards. So I reformated as ext3 and untarred my root again.
> > That worked fine, so I know it wasn't corruption of the tar file.
> >
> >I took a photograph, and I'll try to type in some of it. Just looking at
> > the names of the procudures, it looks like memory pressure made reiser4
> > flush, and then some of the lower level functions tried to allocate
> > memory and failed. But since I don't have the top of the oops message, I
> > can't tell.
> >
> >Wait - I could've stopped the scrolling with ^S, scrolled back with
> > ^pageup, and photoed the whole thing! Aaaargghh....
> >
> >Well, I'm not redoing it right now, I need to be getting to bed.
> >
> >I may try it again later - but then maybe I'll update to 2.6.14-mm2 with
> > patch from namesys first...
> >
> >Here's the (tail end of the) oops message, sans addresses and offsets
> > because I'm feeling lazy and I'm in a hurry:
> >
> >mempool_alloc+0x3a/0xe0
> >__split_bio+0x128/0x190
> >in_drive_list
> >dm_request
> >generic_make_request
> >submit_bio
> >do_IRQ
> >reiser4_clear_page_dirty
> >write_jnodes_to_disk_extent
> >write_jnode_list
> >write_fq
> >flush_current_atom
> >flush_some_atom
> >writeout
> >reiser4_sync_inodes
> >writeback_inodes
> >background_writeout
> >pdflush
> >__pdflush
> >pdflush
> >background_writeout
> >kthread
> >kthread
> >kernel_thread_helper

-- 
Alex.
