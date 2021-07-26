From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH] reiserfs: check directry items on read from disk
Date: Mon, 26 Jul 2021 10:20:50 +0200
Message-ID: <20210726082050.GA20621@quack2.suse.cz>
References: <20210709152929.766363-1-chouhan.shreyansh630@gmail.com>
 <YPZ7zUVAedCkx3IQ@fedora>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1627287651; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=YTJdefTSqpDX0dKDr3Y61JSstsmTOoq9vu6GdbYEihE=;
        b=rHBhjlYRREwBeR3PAZu1f26XKkJsNUhYt6dimQJr6kzF57zRgArV5RZN0sfSPeX7lIA5FE
        7/+JPHebFjf2RBs0wqdbqUV3+t0i/nY1kQ9R4lTA3KFmWGwZMuQBqw98vRUbXlGsPVc1aR
        0ZVPvVKBcdHKPQd8V56b5unMbyCLJ4Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1627287651;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=YTJdefTSqpDX0dKDr3Y61JSstsmTOoq9vu6GdbYEihE=;
        b=Q9Wf5Kr/cR19bOw30JlDYvnTf4Tm+vZJ8WPuWzMqy1fgYq4o9754JbA2+UacefyIOL2lBb
        OZ3iwlh4Uw3ApoAQ==
Content-Disposition: inline
In-Reply-To: <YPZ7zUVAedCkx3IQ@fedora>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
Cc: rkovhaev@gmail.com, jack@suse.cz, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, syzbot+c31a48e6702ccb3d64c9@syzkaller.appspotmail.com

Hello!

On Tue 20-07-21 13:01:25, Shreyansh Chouhan wrote:
> Just a ping for reviews/merge since there has been no activity on this patch.

The patch is already in my tree and included in linux-next. I wanted to
send it to Linus before going on vacation but somehow that slipped through.
I'll send it to Linus this week with other fixes I have accumulated. I'm
sorry for the delay.

								Honza

> On Fri, Jul 09, 2021 at 08:59:29PM +0530, Shreyansh Chouhan wrote:
> > 
> > While verifying the leaf item that we read from the disk, reiserfs
> > doesn't check the directory items, this could cause a crash when we
> > read a directory item from the disk that has an invalid deh_location.
> > 
> > This patch adds a check to the directory items read from the disk that
> > does a bounds check on deh_location for the directory entries. Any
> > directory entry header with a directory entry offset greater than the
> > item length is considered invalid.
> > 
> > Reported-by: syzbot+c31a48e6702ccb3d64c9@syzkaller.appspotmail.com
> > Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
> > ---
> >  fs/reiserfs/stree.c | 31 ++++++++++++++++++++++++++-----
> >  1 file changed, 26 insertions(+), 5 deletions(-)
> > 
> > diff --git a/fs/reiserfs/stree.c b/fs/reiserfs/stree.c
> > index 476a7ff49482..ef42729216d1 100644
> > --- a/fs/reiserfs/stree.c
> > +++ b/fs/reiserfs/stree.c
> > @@ -387,6 +387,24 @@ void pathrelse(struct treepath *search_path)
> >  	search_path->path_length = ILLEGAL_PATH_ELEMENT_OFFSET;
> >  }
> >  
> > +static int has_valid_deh_location(struct buffer_head *bh, struct item_head *ih)
> > +{
> > +	struct reiserfs_de_head *deh;
> > +	int i;
> > +
> > +	deh = B_I_DEH(bh, ih);
> > +	for (i = 0; i < ih_entry_count(ih); i++) {
> > +		if (deh_location(&deh[i]) > ih_item_len(ih)) {
> > +			reiserfs_warning(NULL, "reiserfs-5094",
> > +					 "directory entry location seems wrong %h",
> > +					 &deh[i]);
> > +			return 0;
> > +		}
> > +	}
> > +
> > +	return 1;
> > +}
> > +
> >  static int is_leaf(char *buf, int blocksize, struct buffer_head *bh)
> >  {
> >  	struct block_head *blkh;
> > @@ -454,11 +472,14 @@ static int is_leaf(char *buf, int blocksize, struct buffer_head *bh)
> >  					 "(second one): %h", ih);
> >  			return 0;
> >  		}
> > -		if (is_direntry_le_ih(ih) && (ih_item_len(ih) < (ih_entry_count(ih) * IH_SIZE))) {
> > -			reiserfs_warning(NULL, "reiserfs-5093",
> > -					 "item entry count seems wrong %h",
> > -					 ih);
> > -			return 0;
> > +		if (is_direntry_le_ih(ih)) {
> > +			if (ih_item_len(ih) < (ih_entry_count(ih) * IH_SIZE)) {
> > +				reiserfs_warning(NULL, "reiserfs-5093",
> > +						 "item entry count seems wrong %h",
> > +						 ih);
> > +				return 0;
> > +			}
> > +			return has_valid_deh_location(bh, ih);
> >  		}
> >  		prev_location = ih_location(ih);
> >  	}
> > -- 
> > 2.31.1
> > 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
