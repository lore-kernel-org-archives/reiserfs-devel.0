From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: new data logging patches available
Date: Thu, 8 May 2003 21:46:55 +0200
Message-ID: <200305082146.56163.Dieter.Nuetzel@hamburg.de>
References: <1052400138.14612.483.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14032-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1052400138.14612.483.camel@tiny.suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>, reiserfs-list@namesys.com

Am Donnerstag, 8. Mai 2003 15:22 schrieb Chris Mason:
> Hello all,
>
> New data logging patches are available for download at:
>
> ftp.suse.com/pub/people/mason/patches/data-logging/2.4.21
>
> It might take the suse internal ftp server an hour to see the new
> files.  Check for 03-relocation-8.diff to make sure you are grabbing the
> most recent stuff.
>
> These include Oleg Drokin's merge with 2.4.21-rc1 (thanks Oleg!), and
> they no longer change fs/super.c:sync_supers().  I believe things are
> now clean enough for me to start submitting for 2.4.22-pre once it
> starts.
>
> 03-relocation-8.diff is also updated, I believe it will fix the bug
> where md reports the device is busy during reboot.  It has not been
> tested on a box with a software raid root device, so please handle with
> care.

Up and running under 2.4.21-rc1-jam1 (-aa) ;-)

06-write_times.diff
07-quota-v2-2.4.21.diff
Not needed.

05-data-logging-37.diff
need some fixing in fs/reiserfs/inode.c

Ignore the first:
***************
*** 2027,2033 ****

  fail:
      if (nr) {
-         submit_bh_for_writepage(arr, nr) ;
      } else {
          UnlockPage(page) ;
      }
--- 2191,2197 ----

  fail:
      if (nr) {
+         submit_bh_for_writepage(page, arr, nr) ;
      } else {
          UnlockPage(page) ;
      }
***************

But change it to this some lines above:

    if (nr) {
        submit_bh_for_writepage(page, arr, nr) ;
	wakeup_page_waiters(page);
    } else {


Second:
***************
*** 2143,2148 ****
                                struct kiobuf *iobuf, unsigned long blocknr,
                              int blocksize)
  {
      return generic_direct_IO(rw, inode, iobuf, blocknr, blocksize,
                               reiserfs_get_block_direct_io) ;
  }
--- 2530,2539 ----
                                struct kiobuf *iobuf, unsigned long blocknr,
                              int blocksize)
  {
+
+     if (reiserfs_data_ordered(inode->i_sb) || reiserfs_file_data_log(inode)) 
{
+       return -EINVAL;
+     }
      return generic_direct_IO(rw, inode, iobuf, blocknr, blocksize,
                               reiserfs_get_block_direct_io) ;
  }
***************

Shouldn't it be this?:

static int reiserfs_direct_io(int rw, struct file * filp,
                              struct kiobuf *iobuf, unsigned long blocknr,
			      int blocksize) 
{
    struct inode * inode = filp->f_dentry->d_inode->i_mapping->host;

    if (reiserfs_data_ordered(inode->i_sb) || reiserfs_file_data_log(inode)) {
	return -EINVAL;
    }
    return generic_direct_IO(rw, inode, iobuf, blocknr, blocksize,
                             reiserfs_get_block_direct_io) ;
}

Regards,
	Dieter
