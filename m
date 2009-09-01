From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: [PATCH 0/4] kill-the-bkl/reiserfs: fix some lock dependency
	inversions
Date: Wed, 2 Sep 2009 00:16:34 +0200
Message-ID: <20090901221631.GA6108@nowhere>
References: <1251167570-5233-1-git-send-email-fweisbec@gmail.com> <20090826201330.GA18761@orion>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:references:mime-version:content-type
         :content-disposition:in-reply-to:user-agent;
        bh=aQvlvK2ko+tNN+vXEEMvMTJxekzQLqhikZrwfjEhdZo=;
        b=mg8rMXjs23LCOmdPLDOZrtcLiS4TWSVPTxNUQygrmSmpo70cOMxcSNTruA7gkloBO9
         Rp5NNWnt704Vefb07nPSKc6NGQh7TtYrzwBWv2xSCj+z2b3R98uArR2Z5JjdrJdbFcdm
         HhLS1JfHFNlp33bHvvzQNLPaiyM2FqWOe4aG8=
Content-Disposition: inline
In-Reply-To: <20090826201330.GA18761@orion>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Reiserfs <reiserfs-devel@vger.kernel.org>

On Thu, Aug 27, 2009 at 12:13:30AM +0400, Alexander Beregalov wrote:
> On Tue, Aug 25, 2009 at 04:32:46AM +0200, Frederic Weisbecker wrote:
> > Hi,
> > 
> > This small set fixes some lock dependency inversions found in reiserfs
> > xattr and mmap paths.
> > I guess there are still some of them that I'll have to hunt, especially one
> > reported by Laurent Riffard and another one introduced by the reiserfs_readdir
> > path optimization (though I'm not sure about the latter, I have yet to find a
> > way to reproduce it properly).
> > 
> > As usual, these patches can be found at:
> > 
> > git://git.kernel.org/pub/scm/linux/kernel/git/frederic/random-tracing.git \
> > 	reiserfs/kill-bkl
> 
> Hi,
> possible circular locking dependency detected
> 
> Is it false positive?



No, this confirms a real one, also the worst because it has been
introduced by a nice optimization (in term of result of throughput)
that I'll probably need to revert.

reiserfs_readdir() has a reiserfs_write_lock -> mm->mmap_sem
dependency.
But reiserfs_readpage() has a mm->mmap_sem -> reiserfs_write_lock
dependency.

I'll send a fix soon. Thanks a lot for this report Alexander!

Frederic.

