From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH] reiserfs: only call unlock_new_inode() if I_NEW
Date: Wed, 16 Sep 2020 12:54:18 +0200
Message-ID: <20200916105418.GC3607@quack2.suse.cz>
References: <20200628070057.820213-1-ebiggers@kernel.org>
 <20200727165215.GI1138@sol.localdomain>
 <20200916040118.GB825@sol.localdomain>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200916040118.GB825@sol.localdomain>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Biggers <ebiggers@kernel.org>
Cc: Jan Kara <jack@suse.com>, reiserfs-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, syzbot+187510916eb6a14598f7@syzkaller.appspotmail.com

On Tue 15-09-20 21:01:18, Eric Biggers wrote:
> On Mon, Jul 27, 2020 at 09:52:15AM -0700, Eric Biggers wrote:
> > On Sun, Jun 28, 2020 at 12:00:57AM -0700, Eric Biggers wrote:
> > > From: Eric Biggers <ebiggers@google.com>
> > > 
> > > unlock_new_inode() is only meant to be called after a new inode has
> > > already been inserted into the hash table.  But reiserfs_new_inode() can
> > > call it even before it has inserted the inode, triggering the WARNING in
> > > unlock_new_inode().  Fix this by only calling unlock_new_inode() if the
> > > inode has the I_NEW flag set, indicating that it's in the table.
> > > 
> > > This addresses the syzbot report "WARNING in unlock_new_inode"
> > > (https://syzkaller.appspot.com/bug?extid=187510916eb6a14598f7).
> > > 
> > > Reported-by: syzbot+187510916eb6a14598f7@syzkaller.appspotmail.com
> > > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > 
> > Anyone interested in taking this patch?
> 
> Jan, you seem to be taking some reiserfs patches... Any interest in
> taking this one?

Sure, the patch looks good to me so I've added it to my tree. Thanks!

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
