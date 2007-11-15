From: "Edward Shishkin" <edward.shishkin@gmail.com>
Subject: Re: Reiser4 and loop device problems
Date: Fri, 16 Nov 2007 02:03:52 +0300
Message-ID: <5c7c368b0711151503p6ae801fcsa3803fbd65443341@mail.gmail.com>
References: <5c7c368b0711151455l2cf7a080yff21884e5957d20b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=S52o0eokA33v2ffsZupIx567U86k3q6VsgR606r3ZCI=;
        b=MtJor61K9lKuEqEZ7oeENJRYAx/9fUqT2zKiWJBOPAUSJtTXe2UjhKN3BrCoG1JZRiP8qs6MYxaHFo+zkX9TTWdhG9nFiN8o0d/q51FEBJB/tCfuYUrmjixeHcu9ynsMPIZrmF2Dq9hJNHLtpPfXLcSy+CRJYs81aQE9DJ0wEqM=
In-Reply-To: <5c7c368b0711151455l2cf7a080yff21884e5957d20b@mail.gmail.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Kuther <gimpel@sonnenkinder.org>
Cc: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

> On Do, 15.11.07 22:49 "Dushan Tcholich" <dusanc@gmail.com> wrote:
>
> > Can you remember the last kernel that worked?
> >
> > Thanks
> >
> > Dushan
>
> Unfortunately not for sure. I'm not even sure if it ever worked at all,
> to be honest. There were some old threads from 2003 saying that loop is
> not supported (yet). Did that ever change?

No, it didn't.
Sorry..

Edward.

>
> Regards,
> Tom
>
>
> > On Nov 15, 2007 10:44 PM, Thomas Kuther <gimpel@sonnenkinder.org>
> > wrote:
> > > Hi,
> > >
> > > in recent reiser4 it is not possible to loopback mount a file
> > > located on a reiser4 partition
> > >
> > > * kernel 2.6.24-rc2-git5
> > > * reiser4progs 1.0.6
> > > * reiser4 from 2.6.24-rc2-mm1with following series
> > >
> > >         sync_sb_inodes-propagate-errors.patch
> > >         reiser4-sb_sync_inodes.patch
> > >         reiser4-export-remove_from_page_cache.patch
> > >         reiser4-export-find_get_pages.patch
> > >         make-copy_from_user_inatomic-not-zero-the-tail-on-i386-vs-reiser4.patch
> > >         reiser4.patch
> > >         jens-broke-reiser4patch-added-to-mm-tree.patch
> > >
> > > * filsystem created with
> > >         $ mkfs.reiser4
> > > * mounted with noatime
> > > * no cryptcompress or anything non-default
> > >
> > > $ mount -o loop -t
> > > iso9660 /tmp/systemrescuecd-x86-0.4.0.iso /mnt/cdrom ioctl:
> > > LOOP_SET_FD: Invalid argument
> > >
> > > Regards,
> > > Tom
> > >
>
