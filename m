From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: [PATCH 0/5] reiserfs lock inversion fixes on xattr
Date: Sat, 2 Jan 2010 04:52:23 +0100
Message-ID: <20100102035221.GB5238@nowhere>
References: <1262150491-9983-1-git-send-regression-fweisbec@gmail.com> <1262205747-9208-1-git-send-regression-fweisbec@gmail.com> <alpine.DEB.2.01.0912301943020.3483@bogon.housecafe.de> <20100101092944.GB12203@elte.hu>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:references:mime-version:content-type
         :content-disposition:in-reply-to:user-agent;
        bh=20hOQsScVdmjhu/2ca8nubhFDBRKXHs3FnxS7busXWM=;
        b=IrpnGsiiLnIXfleRnwReMD4oMAGDpezcCa180QJNzCLvpmRNKtuYQOCOeu/3iZX/1w
         RBjvK1xsWWVUSsUNbftH/541IIpbRKur1QD7k4RptYASI99lwxoLqEbrImn0MjDMRktK
         y4KZXNQqJoOe1tBeELUh3PaCEBehwmnh8uv3E=
Content-Disposition: inline
In-Reply-To: <20100101092944.GB12203@elte.hu>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>
Cc: Christian Kujau <lists@nerdbynature.de>, LKML <linux-kernel@vger.kernel.org>, Alexander Beregalov <a.beregalov@gmail.com>, Chris Mason <chris.mason@oracle.com>, reiserfs-devel@vger.kernel.org

On Fri, Jan 01, 2010 at 10:29:44AM +0100, Ingo Molnar wrote:
> 
> * Christian Kujau <lists@nerdbynature.de> wrote:
> 
> > On Wed, 30 Dec 2009 at 21:42, Frederic Weisbecker wrote:
> > > I hope you can give it a try (and/or review) before I send the whole
> > > to Linus.
> > 
> > Without your patches, "dbench -x" was pretty much instantly causing the 
> > threads to lock up, forcing me to reboot the box. With LOCKDEP enabled, 
> > warnings were printed. After applying your patches (and a reboot) I've run 
> > "dbench -x" for quite a while now with different runtimes and number of
> > clients and it's not locking up any more. I've tested with:
> > 
> > CONFIG_REISERFS_FS=y
> > CONFIG_REISERFS_CHECK=y
> > CONFIG_REISERFS_PROC_INFO=y
> > CONFIG_REISERFS_FS_XATTR=y
> > CONFIG_REISERFS_FS_POSIX_ACL=y
> > # CONFIG_REISERFS_FS_SECURITY is not set
> > 
> > ...and a few "Kernel hacking" options set. Full config and dmesg:
> > 
> >    http://nerdbynature.de/bits/2.6.33-rc1/reiserfs/t3/
> > 
> >    (although I'm not really testing -rc1 but latest mainline -git
> >     and your changes pulled)
> > 
> > So, feel free to add:
> > 
> >   Tested-by: Christian Kujau <lists@nerdbynature.de>
> 
> Frederic, i'd suggest you send this tree to Linus with Christian's tested-by 
> tags added ASAP - we better have these fixes in -rc3.
> 
> Thanks,
> 
> 	Ingo


Yep, done :)

