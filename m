From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: [PATCH 0/5] reiserfs lock inversion fixes on xattr
Date: Sat, 2 Jan 2010 02:40:06 +0100
Message-ID: <20100102014003.GA5238@nowhere>
References: <1262150491-9983-1-git-send-regression-fweisbec@gmail.com> <1262205747-9208-1-git-send-regression-fweisbec@gmail.com> <alpine.DEB.2.01.0912301943020.3483@bogon.housecafe.de>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:references:mime-version:content-type
         :content-disposition:in-reply-to:user-agent;
        bh=SRiztdUBoizAm/qwHqhtK2vas8eudIIq3DCVly88jow=;
        b=R65+rNjpZO7X+2lcdg7n+vBY0T54J7m4bMDU5cAwvpHzLJR9wIJ0was6zYzqB6o5K7
         tTN7Elb2MpAGdSBlFfATrUMBz3o1XY551NGlpMeaUaf0G9ZpmL/8jq0MkSNt8++iHcNz
         UJ14kb3QRT4PxjiXwx3e8ZMrWQKPRoC0nli0c=
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.01.0912301943020.3483@bogon.housecafe.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Kujau <lists@nerdbynature.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Alexander Beregalov <a.beregalov@gmail.com>, Chris Mason <chris.mason@oracle.com>, Ingo Molnar <mingo@elte.hu>, reiserfs-devel@vger.kernel.org

On Wed, Dec 30, 2009 at 10:32:04PM -0800, Christian Kujau wrote:
> On Wed, 30 Dec 2009 at 21:42, Frederic Weisbecker wrote:
> > I hope you can give it a try (and/or review) before I send the whole
> > to Linus.
> 
> Without your patches, "dbench -x" was pretty much instantly causing the 
> threads to lock up, forcing me to reboot the box. With LOCKDEP enabled, 
> warnings were printed. After applying your patches (and a reboot) I've run 
> "dbench -x" for quite a while now with different runtimes and number of
> clients and it's not locking up any more. I've tested with:
> 
> CONFIG_REISERFS_FS=y
> CONFIG_REISERFS_CHECK=y
> CONFIG_REISERFS_PROC_INFO=y
> CONFIG_REISERFS_FS_XATTR=y
> CONFIG_REISERFS_FS_POSIX_ACL=y
> # CONFIG_REISERFS_FS_SECURITY is not set
> 
> ...and a few "Kernel hacking" options set. Full config and dmesg:
> 
>    http://nerdbynature.de/bits/2.6.33-rc1/reiserfs/t3/
> 
>    (although I'm not really testing -rc1 but latest mainline -git
>     and your changes pulled)
> 
> So, feel free to add:
> 
>   Tested-by: Christian Kujau <lists@nerdbynature.de>


Great, I've added this to the xattr related commits,
thanks a lot!


> 
> I can't help with the code review though :-\


Don't worry, both testing and review are very precious
and appreciated!

