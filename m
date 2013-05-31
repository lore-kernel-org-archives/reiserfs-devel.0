From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH] reiserfs: fix spurious multiple-fill in
 reiserfs_readdir_dentry
Date: Fri, 31 May 2013 23:04:31 +0200
Message-ID: <20130531210431.GA3370@quack.suse.cz>
References: <51A8F508.30100@jeffreymahoney.com>
 <20130531193121.GA21744@quack.suse.cz>
 <51A9094B.9070509@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <51A9094B.9070509@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Mahoney <jeffm@suse.com>
Cc: Jan Kara <jack@suse.cz>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

On Fri 31-05-13 16:34:19, Jeff Mahoney wrote:
> On 5/31/13 3:31 PM, Jan Kara wrote:
> > On Fri 31-05-13 15:07:52, Jeff Mahoney wrote:
> >> After sleeping for filldir(), we check to see if the file system has
> >> changed and research. The next_pos pointer is updated but its value
> >> isn't pushed into the key used for the search itself. As a result,
> >> the search returns the same item that the last cycle of the loop did
> >> and filldir() is called multiple times with the same data.
> >>
> >> The end result is that the buffer can contain the same name multiple
> >> times. This can be returned to userspace or used internally in the
> >> xattr code where it can manifest with the following warning:
> >>
> >> jdm-20004 reiserfs_delete_xattrs: Couldn't delete all xattrs (-2)
> >>
> >> reiserfs_for_each_xattr uses reiserfs_readdir_dentry to iterate over
> >> the xattr names and ends up trying to unlink the same name twice. The
> >> second attempt fails with -ENOENT and the error is returned. At some
> >> point I'll need to add support into reiserfsck to remove the orphaned
> >> directories left behind when this occurs.
> >>
> >> The fix is to push the value into the key before researching.
> >   The patch looks good. I've added it to my tree.
> 
> Thanks, Jan.
> 
> I have a few other fixes that we've had in SLE11 for a while that should
> probably make it into the next release as well.
> 
> I've published them at:
> git://jeffreymahoney.com/linux/linux-upstream reiserfs-for-3.10
> 
> There are 3 patches, HEAD is 7c769dbb (reiserfs: fix problems with
> chowning setuid file w/ xattrs)
> 
> It includes this fix.
  I've pulled the other two patches into my tree as well. Thanks!

								Honza


> >> Signed-off-by: Jeff Mahoney <jeffm@suse.com>
> >> ---
> >>  fs/reiserfs/dir.c |    2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> --- a/fs/reiserfs/dir.c	2013-05-31 14:29:35.945840685 -0400
> >> +++ b/fs/reiserfs/dir.c	2013-05-31 14:30:05.473952112 -0400
> >> @@ -204,6 +204,8 @@ int reiserfs_readdir_dentry(struct dentr
> >>  				next_pos = deh_offset(deh) + 1;
> >>  
> >>  				if (item_moved(&tmp_ih, &path_to_entry)) {
> >> +					set_cpu_key_k_offset(&pos_key,
> >> +							     next_pos);
> >>  					goto research;
> >>  				}
> >>  			}	/* for */
> >>
> >>
> >> -- 
> >> Jeff Mahoney
> 
> 
> -- 
> Jeff Mahoney
> SUSE Labs
> 


-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
