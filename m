From: Oleg Drokin <green@linuxhacker.ru>
Subject: Re: v3 experimental data=ordered and logging speedups for 2.6.1
Date: Wed, 11 Feb 2004 13:49:12 +0200
Message-ID: <20040211114912.GC3042@linuxhacker.ru>
References: <1074530725.29546.178.camel@tiny.suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16752-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1074530725.29546.178.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Jan 19, 2004 at 11:45:26AM -0500, Chris Mason wrote:

> ftp.suse.com.  Oleg is cc'd in case he wants to look over the changes to
> reiserfs_file_write in reiserfs-jh-2.

Ok, I finally got some time to look at it.

> 03-reiserfs-iosize
> Changes reiserfs to tell userspace the default io size is 4k.  Works around
> a bug in bdb hit by rpm users

BTW, I am using 2.6 for a long time now, and I use rpm too, I yet to see any
problems with 128k default write size. Though I use Fedora Core 1 as the distro.
Anyway there should be absolutely zero problems with bdb, I looked in their code
and they have sanity checks that do not allow write size to be bigger than
some values that they think are safe (16K I think).

> 05-reiserfs-logging
> Logging speedups for small transactions and fsync heavy applications.  Most
> experimental patch of the bunch, since it changes the way the log does
> metadata writeback

> 06-reiserfs-jh-2
> Adds data=ordered support, along with a journal header attached to
> the buffer head.  This allows for more efficient data=ordered support
> than I had in 2.4.x.

I have some comments on this one, too.
Replicating __block_commit_write just to make sure you add buffer to ordered
list seems to be overkill. You can easily put buffers to some temp list at
buffer allocation time and then just add entire temp list to ordered
buffers list, I think. Also this will make handling of mmap write in the middle
of write a little bit more correct, I think. BTW, I do not see where do you
specially handle mmap writes so that they are written in correct order wrt
inode updates.
Also I am not very sure why you choose to still update sd_blocks, but not
st_size in case of errors in reiserfs_allocate_blocks_for_region().
Perhaps it makes more sence to update both to avoid potential metadata
inconsistency.

Also this part of patch to file.c ruins the attachement of comment to
prepared_pages definition.

     struct page * prepared_pages[REISERFS_WRITE_PAGES_AT_A_TIME];
+    struct reiserfs_transaction_handle th;
+    th.t_trans_id = 0;
                                /* To simplify coding at this time, we store
                                   locked pages in array for now */

That's about all I have noticed on the first look. ;)

Bye,
    Oleg
