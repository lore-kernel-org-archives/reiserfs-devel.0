From: Chris Mason <mason@suse.com>
Subject: Re: v3 experimental data=ordered and logging speedups for 2.6.1
Date: Wed, 11 Feb 2004 09:00:34 -0500
Message-ID: <1076508034.15498.5.camel@watt.suse.com>
References: <1074530725.29546.178.camel@tiny.suse.com>
	 <20040211114912.GC3042@linuxhacker.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16754-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040211114912.GC3042@linuxhacker.ru>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@linuxhacker.ru>
Cc: reiserfs-list@namesys.com

On Wed, 2004-02-11 at 06:49, Oleg Drokin wrote:
> Hello!
> 
> On Mon, Jan 19, 2004 at 11:45:26AM -0500, Chris Mason wrote:
> 
> > ftp.suse.com.  Oleg is cc'd in case he wants to look over the changes to
> > reiserfs_file_write in reiserfs-jh-2.
> 
> Ok, I finally got some time to look at it.
> 
> > 03-reiserfs-iosize
> > Changes reiserfs to tell userspace the default io size is 4k.  Works around
> > a bug in bdb hit by rpm users
> 
> BTW, I am using 2.6 for a long time now, and I use rpm too, I yet to see any
> problems with 128k default write size. Though I use Fedora Core 1 as the distro.
> Anyway there should be absolutely zero problems with bdb, I looked in their code
> and they have sanity checks that do not allow write size to be bigger than
> some values that they think are safe (16K I think).
> 
Well, it was easiest to trigger with older rpm versions, but you'll get
hit by eventually.  Keep in mind the suse autobuild system runs rpm
thousands (hundreds of thousands) of times per day.  It wasn't an easy
bug to hit.

> > 05-reiserfs-logging
> > Logging speedups for small transactions and fsync heavy applications.  Most
> > experimental patch of the bunch, since it changes the way the log does
> > metadata writeback
> 
> > 06-reiserfs-jh-2
> > Adds data=ordered support, along with a journal header attached to
> > the buffer head.  This allows for more efficient data=ordered support
> > than I had in 2.4.x.
> 
> I have some comments on this one, too.
> Replicating __block_commit_write just to make sure you add buffer to ordered
> list seems to be overkill. You can easily put buffers to some temp list at
> buffer allocation time and then just add entire temp list to ordered
> buffers list, I think. 

If you use the generic __block_commit_write, you've got to update i_size
first to make sure the generic code doesn't do it.  There are a few
other tricky parts when the data=journal code is added.  We've already
made our own file_write call, it doesn't make sense to warp it just to
avoid our own __block_commit_write ;-)

> Also this will make handling of mmap write in the middle
> of write a little bit more correct, I think. BTW, I do not see where do you
> specially handle mmap writes so that they are written in correct order wrt
> inode updates.

Those changes are still only in my local tree.  I wanted to get the
basic functionality out there for testing.

> Also I am not very sure why you choose to still update sd_blocks, but not
> st_size in case of errors in reiserfs_allocate_blocks_for_region().
> Perhaps it makes more sence to update both to avoid potential metadata
> inconsistency.
> 
I'll look at that, thanks.

> Also this part of patch to file.c ruins the attachement of comment to
> prepared_pages definition.
> 
>      struct page * prepared_pages[REISERFS_WRITE_PAGES_AT_A_TIME];
> +    struct reiserfs_transaction_handle th;
> +    th.t_trans_id = 0;
>                                 /* To simplify coding at this time, we store
>                                    locked pages in array for now */
> 
> That's about all I have noticed on the first look. ;)

Thanks, will fix.

-chris


