From: Pavel Skripkin <paskripkin@gmail.com>
Subject: Re: [PATCH v2] reiserfs: add check for invalid 1st journal block
Date: Tue, 8 Jun 2021 13:44:43 +0300
Message-ID: <20210608134443.022b3389@gmail.com>
References: <20210517101523.GB31755@quack2.suse.cz>
        <20210517121545.29645-1-paskripkin@gmail.com>
        <20210517130818.GB25760@quack2.suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RQrvOOav2Bz07nagbQp4IaMsDtzS0SARmjf449xkKTE=;
        b=H0g5dE5ct2vfn54LljqsH3PsAAf+N6ccwBzPSpf9DiIR4UoSSp0hq1lHHrqjgU8c20
         gZqH5ZBnyvCui7JCt3M4Zidpva0ERHmoeinDerCeFS7q+KWNfNsaaKWcpXGME/Yh0b0s
         2Cn8hyAJCWl3pS3VEGy49+QUo5n84EpNSv9TpUIFm4hvrDdKOrlMGJpkXcOqRt9gUFAJ
         S5czwEhgTvZ11uvkOOK4dMxZprhF8QDZOklpZraQzfh5WIRwqmZhdSuzHGt7LTKGdpRw
         S9pkNLgTbugWUESxO1ls8oUTyYVh6BVnzTWgfsao3v5IiWvJAa8AZYEiArbNr7GpV9IS
         orgA==
In-Reply-To: <20210517130818.GB25760@quack2.suse.cz>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Kara <jack@suse.cz>
Cc: tiantao6@hisilicon.com, rdunlap@infradead.org, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, syzbot+0ba9909df31c6a36974d@syzkaller.appspotmail.com

On Mon, 17 May 2021 15:08:18 +0200
Jan Kara <jack@suse.cz> wrote:

> On Mon 17-05-21 15:15:45, Pavel Skripkin wrote:
> > syzbot reported divide error in reiserfs.
> > The problem was in incorrect journal 1st block.
> > 
> > Syzbot's reproducer manualy generated wrong superblock
> > with incorrect 1st block. In journal_init() wasn't
> > any checks about this particular case.
> > 
> > For example, if 1st journal block is before superblock
> > 1st block, it can cause zeroing important superblock members
> > in do_journal_end().
> > 
> > Reported-by: syzbot+0ba9909df31c6a36974d@syzkaller.appspotmail.com
> > Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> 
> Thanks! I've added the patch to my tree.
> 
> 								Honza
> 

Hi, Jan!

Is this patched got lost somehow? I did't find it in your tree here
https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git/.

Sorry to bother you, maybe Im missing something :)



With regards,
Pavel Skripkin
