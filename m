From: Hans Reiser <reiser@namesys.com>
Subject: Re: ReiserFS v3 choking when free space falls below 10%?
Date: Fri, 07 Jul 2006 12:38:46 -0700
Message-ID: <44AEB846.90306@namesys.com>
References: <20060706125856.fdac1d16.pegasus@nerv.eu.org> <1152200638.30139.45.camel@ipso.snappymail.ca> <44AD5020.6050803@suse.com> <1152210439.30139.59.camel@ipso.snappymail.ca> <44AD58D1.9040806@suse.com> <1152257397.13211.43.camel@ipso.snappymail.ca> <20060707174935.GB13606@atrey.karlin.mff.cuni.cz> <44AE9EFB.7060301@suse.com> <20060707180746.GA29487@atrey.karlin.mff.cuni.cz> <44AEB064.7000907@namesys.com> <20060707191809.GC29487@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28938-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060707191809.GC29487@atrey.karlin.mff.cuni.cz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Kara <jack@suse.cz>
Cc: Jeff Mahoney <jeffm@suse.com>, Mike Benoit <ipso@snappymail.ca>, =?UTF-8?B?SnVyZSBQZcSNYXI=?= <pegasus@nerv.eu.org>, reiserfs-list@namesys.com

Jan Kara wrote:

>>Jan Kara wrote:
>>
>>    
>>
>>>>-----BEGIN PGP SIGNED MESSAGE-----
>>>>Hash: SHA1
>>>>
>>>>Jan Kara wrote:
>>>>   
>>>>
>>>>        
>>>>
>>>>> Hi,
>>>>>
>>>>> just one note: I've looked to the in scan_bitmap() in bitmap.c. There is:
>>>>>       /* When the bitmap is more than 10% free, anyone can allocate.
>>>>>        * When it's less than 10% free, only files that already use the
>>>>>        * bitmap are allowed. Once we pass 80% full, this restriction
>>>>>        * is lifted.
>>>>>        *
>>>>>        * We do this so that files that grow later still have space
>>>>>        * close to
>>>>>        * their original allocation. This improves locality, and
>>>>>        * presumably
>>>>>        * performance as a result.
>>>>>        *
>>>>>        * This is only an allocation policy and does not make up for
>>>>>        * getting a
>>>>>        * bad hint. Decent hinting must be implemented for this to work
>>>>>        * well.
>>>>>        */
>>>>>       if (TEST_OPTION(skip_busy, s)
>>>>>           && SB_FREE_BLOCKS(s) > SB_BLOCK_COUNT(s) / 20) {
>>>>>     
>>>>>
>>>>>          
>>>>>
>>How about eliminating this feature entirely.   It seems rather dubious.
>>    
>>
>  Yes, but it may help reducing fragmentation as it leaves some free
>space in bitmaps for the files already ending in that bitmaps. I'm not
>sure if it really helps through...
>  
>
I think I was wrong, and retract my remark.

