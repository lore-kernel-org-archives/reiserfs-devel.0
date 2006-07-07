From: Jan Kara <jack@suse.cz>
Subject: Re: ReiserFS v3 choking when free space falls below 10%?
Date: Fri, 7 Jul 2006 21:18:09 +0200
Message-ID: <20060707191809.GC29487@atrey.karlin.mff.cuni.cz>
References: <20060706125856.fdac1d16.pegasus@nerv.eu.org> <1152200638.30139.45.camel@ipso.snappymail.ca> <44AD5020.6050803@suse.com> <1152210439.30139.59.camel@ipso.snappymail.ca> <44AD58D1.9040806@suse.com> <1152257397.13211.43.camel@ipso.snappymail.ca> <20060707174935.GB13606@atrey.karlin.mff.cuni.cz> <44AE9EFB.7060301@suse.com> <20060707180746.GA29487@atrey.karlin.mff.cuni.cz> <44AEB064.7000907@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28937-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <44AEB064.7000907@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Jeff Mahoney <jeffm@suse.com>, Mike Benoit <ipso@snappymail.ca>, Jure =?iso-8859-2?Q?Pe=E8ar?= <pegasus@nerv.eu.org>, reiserfs-list@namesys.com

> Jan Kara wrote:
> 
> >>-----BEGIN PGP SIGNED MESSAGE-----
> >>Hash: SHA1
> >>
> >>Jan Kara wrote:
> >>    
> >>
> >>>  Hi,
> >>>
> >>>  just one note: I've looked to the in scan_bitmap() in bitmap.c. There is:
> >>>        /* When the bitmap is more than 10% free, anyone can allocate.
> >>>         * When it's less than 10% free, only files that already use the
> >>>         * bitmap are allowed. Once we pass 80% full, this restriction
> >>>         * is lifted.
> >>>         *
> >>>         * We do this so that files that grow later still have space
> >>>         * close to
> >>>         * their original allocation. This improves locality, and
> >>>         * presumably
> >>>         * performance as a result.
> >>>         *
> >>>         * This is only an allocation policy and does not make up for
> >>>         * getting a
> >>>         * bad hint. Decent hinting must be implemented for this to work
> >>>         * well.
> >>>         */
> >>>        if (TEST_OPTION(skip_busy, s)
> >>>            && SB_FREE_BLOCKS(s) > SB_BLOCK_COUNT(s) / 20) {
> >>>      
> >>>
> How about eliminating this feature entirely.   It seems rather dubious.
  Yes, but it may help reducing fragmentation as it leaves some free
space in bitmaps for the files already ending in that bitmaps. I'm not
sure if it really helps through...

> >>>   So the comment suggests we should lift the restriction when we are 80%
> >>>full but if you see the condition, it checks wherher we are 95% full! I
> >>>guess that is really asking for trouble and could explain the
> >>>behaviour...
> >>>  Mike could you try changing that 20 in the test to 5? IMHO that could
> >>>fix your problem.
> >>>      
> >>>
> >>Shoot. I guess I never sent that mail out last night. I had discovered
> >>the same thing. The thing is, I don't think it will cause the kind of
> >>performance problem we're seeing here. Once it sees the 90% check it
> >>will bail out. Minor slowdown, not anything like we're seeing.
> >>    
> >>
> >  Hmm, right. You'll only scan that one bitmap the file is in, won't
> >  
> >
> I don't understand your remark.  These files are in many many
> bitmaps....  Can you quote more of the code?
  The condition really is:
  if ((off && (!unfm || (file_block != 0))) || SB_AP_BITMAP(s)[bm].free_count
      > (s->s_blocksize << 3) / 10)

  and we reset 'off' after the first test so the first part of || can be
true only once (when we are scanning the bitmap containing the last file
block).

								Honza
-- 
Jan Kara <jack@suse.cz>
SuSE CR Labs
