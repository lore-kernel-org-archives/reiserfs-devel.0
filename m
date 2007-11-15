From: "Dushan Tcholich" <dusanc@gmail.com>
Subject: Re: Reiser4 and loop device problems
Date: Thu, 15 Nov 2007 22:51:11 +0100
Message-ID: <a08621850711151351o7e46a9d3vc9f595434c39de27@mail.gmail.com>
References: <20071115224457.2202be3e@sirius>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=DDPbiOD/QCESnx5AEweJfTUg05xV+R3mYSvcaUVpuQo=;
        b=t3rd7pRDvb6mvfZd7IxjyYwWRC9wEqHQpbA+b0uQZHl7b4Q63fn49rxe249joYFaDVgr0bQ7IzIbGsHycSuRUsnMtp+i/3529cU4eCqaE826fnFf/DJLmNI2EUQ2GCaQafaYGBszJa338syREeystWVr3ESen7XsyW/IUh4TjB0=
In-Reply-To: <20071115224457.2202be3e@sirius>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Can you remember the last kernel that worked?

Thanks

Dushan

On Nov 15, 2007 10:44 PM, Thomas Kuther <gimpel@sonnenkinder.org> wrote:
> Hi,
>
> in recent reiser4 it is not possible to loopback mount a file located
> on a reiser4 partition
>
> * kernel 2.6.24-rc2-git5
> * reiser4progs 1.0.6
> * reiser4 from 2.6.24-rc2-mm1with following series
>
>         sync_sb_inodes-propagate-errors.patch
>         reiser4-sb_sync_inodes.patch
>         reiser4-export-remove_from_page_cache.patch
>         reiser4-export-find_get_pages.patch
>         make-copy_from_user_inatomic-not-zero-the-tail-on-i386-vs-reiser4.patch
>         reiser4.patch
>         jens-broke-reiser4patch-added-to-mm-tree.patch
>
> * filsystem created with
>         $ mkfs.reiser4
> * mounted with noatime
> * no cryptcompress or anything non-default
>
> $ mount -o loop -t iso9660 /tmp/systemrescuecd-x86-0.4.0.iso /mnt/cdrom
> ioctl: LOOP_SET_FD: Invalid argument
>
> Regards,
> Tom
>
