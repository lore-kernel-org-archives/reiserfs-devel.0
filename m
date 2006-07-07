From: Jan Kara <jack@suse.cz>
Subject: Re: ReiserFS v3 choking when free space falls below 10%?
Date: Fri, 7 Jul 2006 19:49:35 +0200
Message-ID: <20060707174935.GB13606@atrey.karlin.mff.cuni.cz>
References: <44A55271.7050501@namesys.com> <44A55591.6060500@suse.com> <1152059846.30139.11.camel@ipso.snappymail.ca> <44AB25EE.8030702@namesys.com> <20060706125856.fdac1d16.pegasus@nerv.eu.org> <1152200638.30139.45.camel@ipso.snappymail.ca> <44AD5020.6050803@suse.com> <1152210439.30139.59.camel@ipso.snappymail.ca> <44AD58D1.9040806@suse.com> <1152257397.13211.43.camel@ipso.snappymail.ca>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28932-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1152257397.13211.43.camel@ipso.snappymail.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Benoit <ipso@snappymail.ca>
Cc: Jeff Mahoney <jeffm@suse.com>, Jure =?iso-8859-2?Q?Pe=E8ar?= <pegasus@nerv.eu.org>, Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

  Hi,

  just one note: I've looked to the in scan_bitmap() in bitmap.c. There is:
        /* When the bitmap is more than 10% free, anyone can allocate.
         * When it's less than 10% free, only files that already use the
         * bitmap are allowed. Once we pass 80% full, this restriction
         * is lifted.
         *
         * We do this so that files that grow later still have space
         * close to
         * their original allocation. This improves locality, and
         * presumably
         * performance as a result.
         *
         * This is only an allocation policy and does not make up for
         * getting a
         * bad hint. Decent hinting must be implemented for this to work
         * well.
         */
        if (TEST_OPTION(skip_busy, s)
            && SB_FREE_BLOCKS(s) > SB_BLOCK_COUNT(s) / 20) {

   So the comment suggests we should lift the restriction when we are 80%
full but if you see the condition, it checks wherher we are 95% full! I
guess that is really asking for trouble and could explain the
behaviour...
  Mike could you try changing that 20 in the test to 5? IMHO that could
fix your problem.

								Honza



-- 
Jan Kara <jack@suse.cz>
SuSE CR Labs
