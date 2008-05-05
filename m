From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH 1/1] Replace down_trylock() with down_try(), reverse return values.
Date: Mon, 5 May 2008 16:09:12 +1000
Message-ID: <200805051609.13731.rusty@rustcorp.com.au>
References: <200805051156.36437.rusty@rustcorp.com.au> <20080505055823.GA20970@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20080505055823.GA20970@infradead.org>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Hellwig <hch@infradead.org>
Cc: linux-kernel@vger.kernel.org, gregkh@suse.de, kaos@sgi.com, Stephen Rothwell <sfr@au1.ibm.com>, rolandd@cisco.com, "Brian S. Julin" <bri@calyx.com>, Martin Diehl <info@mdiehl.de>, mokuno@sm.sony.co.jp, aacraid@adaptec.com, mfasheh@suse.com, wim@iguana.be, xfs@oss.sgi.com, reiserfs-devel@vger.kernel.org, Matthew Wilcox <willy@linux.intel.com>

On Monday 05 May 2008 15:58:23 Christoph Hellwig wrote:
> On Mon, May 05, 2008 at 01:56:35AM +0000, Rusty Russell wrote:
> > down_trylock() returns 1 on failure, 0 on success.  This differs from
> > spin_trylock(), mutex_trylock() and common sense.  Or as ocfs2 put it
> > "kernel 1, world 0".
> >
> > Rename it to down_try() (which makes more sense anyway), and reverse
> > it.  Fortunately there aren't a huge number of callers left.
>
> Given that people are actively trying to kill struct semaphore I don't
> think doing a big search and rename is a good idea right now.

If it goes away before the 2.6.27 merge window, great.  But I don't see that 
happening, so let's clean up this horror.  I cc'd all the people effected in 
the hope that it will prod some of them towards mutexes anyway.

> (And I also really hate the name down_try, but when it goes away that's
>  rather void and we can spare the discussion)

Ideas?  down() is pretty bad, down_try() matches it.

Thanks,
Rusty.

