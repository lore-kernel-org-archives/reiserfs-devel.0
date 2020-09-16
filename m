From: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH] reiserfs: only call unlock_new_inode() if I_NEW
Date: Tue, 15 Sep 2020 21:01:18 -0700
Message-ID: <20200916040118.GB825@sol.localdomain>
References: <20200628070057.820213-1-ebiggers@kernel.org>
 <20200727165215.GI1138@sol.localdomain>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600228879;
        bh=X8wXCrHwg8qTRjJeeDa4WPSRGx8yGWNAx7/mtcme7zk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WB3ZVtqPk5D/h4gKkIuCLaImnHFkzEIZCcdhD+x0br2wD9fjD/lGleHExEs5uQk/i
         tEpB19F5wN5+ASIBZiwgBMw/VtpmaFp7ORjR7QeX5S+9bzHBRzD6OV7z9Rzii4iicb
         YKSVSWa3xJcbqul4YbKbB8Gaz2EIXuZW/03MoOv4=
Content-Disposition: inline
In-Reply-To: <20200727165215.GI1138@sol.localdomain>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.com>
Cc: reiserfs-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, syzbot+187510916eb6a14598f7@syzkaller.appspotmail.com

On Mon, Jul 27, 2020 at 09:52:15AM -0700, Eric Biggers wrote:
> On Sun, Jun 28, 2020 at 12:00:57AM -0700, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > unlock_new_inode() is only meant to be called after a new inode has
> > already been inserted into the hash table.  But reiserfs_new_inode() can
> > call it even before it has inserted the inode, triggering the WARNING in
> > unlock_new_inode().  Fix this by only calling unlock_new_inode() if the
> > inode has the I_NEW flag set, indicating that it's in the table.
> > 
> > This addresses the syzbot report "WARNING in unlock_new_inode"
> > (https://syzkaller.appspot.com/bug?extid=187510916eb6a14598f7).
> > 
> > Reported-by: syzbot+187510916eb6a14598f7@syzkaller.appspotmail.com
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> 
> Anyone interested in taking this patch?

Jan, you seem to be taking some reiserfs patches... Any interest in taking this
one?

- Eric
