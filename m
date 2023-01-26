From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 4.14/4.19/5.4/5.10/5.15 1/1] fs: reiserfs: remove useless
 new_opts in reiserfs_remount
Date: Thu, 26 Jan 2023 10:13:23 +0100
Message-ID: <Y9JEM9toMBcEfDak@kroah.com>
References: <20230126085846.466209-1-pchelkin@ispras.ru>
 <20230126085846.466209-2-pchelkin@ispras.ru>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1674724406;
        bh=K75+4I/AEzlBnGR65u1uXoshesabW5aquBFF3e097hE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cgEFonWHQd0j+9vg/6yFSo1TQCFTWPOHgcDUrmOpeSJ1XJmbfX3pORkXx50Lhib3y
         rnkx3Q6LeDa6Fq7FVBoKP/GAXsAIUoiCyHx7S753ilEzevsOyUYnah4oq0CU55S1kJ
         QdwjoGMQQPIz8zAeZcWUF3vo3blc+Zx2i1erAMDY=
Content-Disposition: inline
In-Reply-To: <20230126085846.466209-2-pchelkin@ispras.ru>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fedor Pchelkin <pchelkin@ispras.ru>
Cc: stable@vger.kernel.org, Jan Kara <jack@suse.cz>, Dongliang Mu <mudongliangabcd@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>, David Howells <dhowells@redhat.com>, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexey Khoroshilov <khoroshilov@ispras.ru>, lvc-project@linuxtesting.org

On Thu, Jan 26, 2023 at 11:58:46AM +0300, Fedor Pchelkin wrote:
> From: Dongliang Mu <mudongliangabcd@gmail.com>
> 
> commit 81dedaf10c20959bdf5624f9783f408df26ba7a4 upstream.
> 
> Since the commit c3d98ea08291 ("VFS: Don't use save/replace_mount_options
> if not using generic_show_options") eliminates replace_mount_options
> in reiserfs_remount, but does not handle the allocated new_opts,
> it will cause memory leak in the reiserfs_remount.
> 
> Because new_opts is useless in reiserfs_mount, so we fix this bug by
> removing the useless new_opts in reiserfs_remount.
> 
> Fixes: c3d98ea08291 ("VFS: Don't use save/replace_mount_options if not using generic_show_options")
> Link: https://lore.kernel.org/r/20211027143445.4156459-1-mudongliangabcd@gmail.com
> Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> Signed-off-by: Jan Kara <jack@suse.cz>
> Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
> ---
>  fs/reiserfs/super.c | 6 ------
>  1 file changed, 6 deletions(-)

Now queued up, thanks.

greg k-h
