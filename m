From: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH] reiserfs: only call unlock_new_inode() if I_NEW
Date: Mon, 27 Jul 2020 09:52:15 -0700
Message-ID: <20200727165215.GI1138@sol.localdomain>
References: <20200628070057.820213-1-ebiggers@kernel.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595868737;
        bh=Rd0yXJxM1FZV2AkKPP2w284CplJp2APSP/Ajct3yKQI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H6Ei18zs+qrut1A39M6wgC5rrS5mOrbqutkkGin1Snx5fZdNkwTDur3EaWxhm97jn
         n0RtL8vd3MAwWfTuY0qCdOWljf9ED3bvuVB8/tLl5UZD8NOqbBInhlSQHd/ss2H5oq
         jrvY7WxeP0D27Bo7cD2y6Q0TeTB12MvB2LilSQZM=
Content-Disposition: inline
In-Reply-To: <20200628070057.820213-1-ebiggers@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, syzbot+187510916eb6a14598f7@syzkaller.appspotmail.com

On Sun, Jun 28, 2020 at 12:00:57AM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> unlock_new_inode() is only meant to be called after a new inode has
> already been inserted into the hash table.  But reiserfs_new_inode() can
> call it even before it has inserted the inode, triggering the WARNING in
> unlock_new_inode().  Fix this by only calling unlock_new_inode() if the
> inode has the I_NEW flag set, indicating that it's in the table.
> 
> This addresses the syzbot report "WARNING in unlock_new_inode"
> (https://syzkaller.appspot.com/bug?extid=187510916eb6a14598f7).
> 
> Reported-by: syzbot+187510916eb6a14598f7@syzkaller.appspotmail.com
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Anyone interested in taking this patch?

- Eric
