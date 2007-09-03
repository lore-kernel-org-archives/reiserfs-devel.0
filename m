From: "=?ISO-8859-2?Q?Grzegorz_Ja=B6kiewicz?=" <gryzman@gmail.com>
Subject: Re: BUG: at fs/reiserfs/inode.c:2868 reiserfs_releasepage()
Date: Mon, 3 Sep 2007 13:00:15 +0100
Message-ID: <2f4958ff0709030500w2bc8d064q351c1b8e05e71b31@mail.gmail.com>
References: <1d7601c7edf6$40655930$8700a8c0@robmhp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=nizW2CqCYZCoPLR7HUY5fxa25aNVa0t+AjWlbM/NujpjuMwdPq0CqdqTvPWvBkwHB2WOazUIyHxTBkMFTL+4vtdVjmZ6MrsyS2R97BplH5A1EUrCioCs02HSroU4Oao3k9gDzRHPprapyzfH2m2L2l6r+gMz2ZejIs66at2cGPo=
In-Reply-To: <1d7601c7edf6$40655930$8700a8c0@robmhp>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Mueller <robm@fastmail.fm>
Cc: reiserfs-devel@vger.kernel.org

On 9/3/07, Rob Mueller <robm@fastmail.fm> wrote:
> This is linux 2.6.20.11 with one patch applied to work around this bug
> http://lists.linuxcoding.com/kernel/2006-q1/msg32508.html, the patch is:
>
> -----
> --- linux/fs/reiserfs/file.c   2006-11-29 16:57:37.000000000 -0500
> +++ linux-syncwrite/fs/reiserfs/file.c 2007-02-02 01:01:36.000000000 -0500
> @@ -1358,6 +1358,8 @@
>                 return result;
>         }
>
> +       return do_sync_write(file, buf, count, ppos);
> +
>         if (unlikely((ssize_t) count < 0))
>                 return -EINVAL;

that's the dead code than, because you put return upfront. this ain't
any fix, problem probably lies somewhere else - and is exposed by
'unlikely()' function.

-- 
GJ
