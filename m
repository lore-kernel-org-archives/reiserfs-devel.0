From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: Which version will be merged into mainline kernel?
Date: Wed, 8 Nov 2006 03:21:36 -0700
Message-ID: <20061108102136.GS6012@schatzie.adilger.int>
References: <194f62550610160250u265ef120lee3cf9a17266939f@mail.gmail.com> <454A596F.8070909@namesys.com> <194f62550611072321j1cd34205u55f3c121dcac7aac@mail.gmail.com> <200611081015.14320.biscani@pd.astro.it>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-30115-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200611081015.14320.biscani@pd.astro.it>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Francesco Biscani <biscani@pd.astro.it>
Cc: reiserfs-list@namesys.com

On Nov 08, 2006  10:15 +0100, Francesco Biscani wrote:
> I think the slow performance you're experiencing are caused by the fsync() 
> call not being well-optimized in reiser4. I've commented out the function in 
> fs/buffer.c, and I'm having much better performance on my / partition.

I don't think this can be advocated as a real solution to performance
problems.  This can mean data loss for some applications like email that
expect "fsync return" to mean "this data is safely on disk".  May as well
say "I improved the performance of my backups by writing to /dev/null".

Cheers, Andreas
--
Andreas Dilger
Principal Software Engineer
Cluster File Systems, Inc.

