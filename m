From: Dongliang Mu <mudongliangabcd@gmail.com>
Subject: Re: [PATCH] fs: reiserfs: free new_opts in reiserfs_remount
Date: Wed, 27 Oct 2021 20:29:19 +0800
Message-ID: <CAD-N9QX01gVnRdntN=pcTgAW7wCXtZj5o_9YctvOSHaf694cxQ@mail.gmail.com>
References: <20211027033947.3992059-1-mudongliangabcd@gmail.com>
 <20211027094644.GA28650@quack2.suse.cz> <CAD-N9QW48LDX7++chFjeZwr0Q1HX+D0+e=6BcXKxPx=i+DgmUA@mail.gmail.com>
 <20211027111527.GD28650@quack2.suse.cz>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RmJV7y4H0T7dh+JR8cakBOomZHH6oytwp4hKK/hZKRg=;
        b=f2bAYZi8bkhaxUekZ1UbLZCe0hFL7njRAVf+CnNlFRWOTum5/g5Jhqo8NhlA6rByT5
         kKZj+3QeFARk+aLW4mS5X1H623yUQ4o1mcUt2CSXuyohGpe4Lds+tU1wutcHqgNjwWnf
         20tEFdjfi12LKf41bJJyu3ZmMp/FjT4EPBnNKPa4Ouu4BHhfpxKPk7jvylp3hiXVt5hN
         kRFIPtatIRWxiOKgtJ5rq5UCFQpjKf9RUpgIk9H/7l359gQi1RmfTAI1VRAiKN33VnNm
         UpJgpQcOfNEsQJrNvpCt8+/EVqMFKtHVIOp4a8kbp/vPb5AfctTBq5rKVxaxo1/TLd7C
         eXRA==
In-Reply-To: <20211027111527.GD28650@quack2.suse.cz>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.cz>
Cc: Yu Kuai <yukuai3@huawei.com>, Miklos Szeredi <mszeredi@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, David Howells <dhowells@redhat.com>, reiserfs-devel@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>

On Wed, Oct 27, 2021 at 7:15 PM Jan Kara <jack@suse.cz> wrote:
>
> On Wed 27-10-21 18:19:00, Dongliang Mu wrote:
> > On Wed, Oct 27, 2021 at 5:46 PM Jan Kara <jack@suse.cz> wrote:
> > >
> > > On Wed 27-10-21 11:39:25, Dongliang Mu wrote:
> > > > Since the commit c3d98ea08291 ("VFS: Don't use save/replace_mount_options
> > > > if not using generic_show_options") eliminates replace_mount_options
> > > > in reiserfs, but did not handle the allocated new_opts,
> > > > it will cause memory leak in the reiserfs_remount.
> > > >
> > > > Fix this by freeing new_opts in the reiserfs_remount temporarily.
> > > >
> > > > Fixes: c3d98ea08291 ("VFS: Don't use save/replace_mount_options if not using generic_show_options")
> > > > Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> > >
> > > Thanks for the patch but I can see that new_opts is not actually used at
> > > all in reiserfs_remount() so we should perhaps just remove them (including
> > > kstrdup() et al).
> >
> > That's also a plan. Since I am not sure if maintainers will use
> > new_opts anymore, So I propose a temporary patch to fix this memory
> > leak.
> >
> > If you think new_opts is not used anymore, let's remove all the code
> > related to new_opts.
>
> If it is ever needed again, we can always add it. Please just remove it.

Sure. I will send a patch v2.

> Thanks!
>
>                                                                 Honza
> --
> Jan Kara <jack@suse.com>
> SUSE Labs, CR
