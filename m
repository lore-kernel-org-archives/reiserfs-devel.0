From: Bharath Vedartham <linux.bhar@gmail.com>
Subject: Re: [PATCH] fs/reiserfs/journal.c: Make remove_journal_hash static
Date: Mon, 15 Apr 2019 20:36:39 +0530
Message-ID: <20190415150639.GA32075@bharath12345-Inspiron-5559>
References: <20190414112438.GA23266@bharath12345-Inspiron-5559>
 <20190415094739.GA13684@quack2.suse.cz>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=F2xjfvaRh0uw5y6zFsCvkgZZ7iwHwpZ25K3+/mgN9Ms=;
        b=fSPbFk1x6lW8wZs3qRwFLbSc+zwVJD+cvcjTmj+kuoWa+NofKoWlYRbxg3JwICo/3U
         ZKmb3jUgJA1HQhTaXaaua5OfKNjLuaSZNc3TTjnbaCRQXDy5vrec/iqTyOzENRs8dy+J
         /SHEHugHlctt5hDhpxAS1izERz1n0z2QwLwUYhCIKkd3OdyUiwLOpxWaIJrgf5heQ6Dv
         fS7foeUarvjg87rMbSfItPLIW4LdW4lN9JPl/kJ7V9B8yjySLndUgahhVztmhrecXjv6
         gxfp8OupZDC61ILLegtnNvrQDWPK167C5lFckxLnRY63Q6caS8R+xfF9HC9MPGtLjoBm
         8n1Q==
Content-Disposition: inline
In-Reply-To: <20190415094739.GA13684@quack2.suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.cz>
Cc: keescook@chromium.org, arnd@arndb.de, akpm@linux-foundation.org, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Apr 15, 2019 at 11:47:39AM +0200, Jan Kara wrote:
> On Sun 14-04-19 16:54:38, Bharath Vedartham wrote:
> > This fixes the -WDecl sparse warning in journal.c. Function was declared
> > as static void but the definition was void.
> > 
> > Signed-off-by: Bharath Vedartham <linux.bhar@gmail.com>
> 
> Thanks! I've added your patch into my tree.
>
Thanks Jan!
> 								Honza
> 
> > ---
> >  fs/reiserfs/journal.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
> > index 8a76f9d..36346dc 100644
> > --- a/fs/reiserfs/journal.c
> > +++ b/fs/reiserfs/journal.c
> > @@ -1844,7 +1844,7 @@ static int flush_used_journal_lists(struct super_block *s,
> >   * removes any nodes in table with name block and dev as bh.
> >   * only touchs the hnext and hprev pointers.
> >   */
> > -void remove_journal_hash(struct super_block *sb,
> > +static void remove_journal_hash(struct super_block *sb,
> >  			 struct reiserfs_journal_cnode **table,
> >  			 struct reiserfs_journal_list *jl,
> >  			 unsigned long block, int remove_freed)
> > -- 
> > 2.7.4
> > 
> -- 
> Jan Kara <jack@suse.com>
> SUSE Labs, CR
