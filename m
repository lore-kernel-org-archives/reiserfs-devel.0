From: Hans Reiser <reiser@namesys.com>
Subject: Re: [BK][PATCH] Reiser4, will double Linux FS performance, pleaseapply
Date: Fri, 01 Nov 2002 04:27:33 +0300
Message-ID: <3DC1D885.6030902@namesys.com>
References: <3DC19F61.5040007@namesys.com> <200210312334.18146.Dieter.Nuetzel@hamburg.de> <3DC1B2FA.8010809@namesys.com> <3DC1D63A.CCAD78EF@digeo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11882-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3DC19F61.5040007@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andrew Morton <akpm@digeo.com>
Cc: =?ISO-8859-1?Q?Dieter_N=FCtzel?= <Dieter.Nuetzel@hamburg.de>, Jeff Garzik <jgarzik@pobox.com>, Linux Kernel <linux-kernel@vger.kernel.org>, Reiserfs-List@namesys.com, Oleg Drokin <green@namesys.com>, zam@namesys.com, umka <umka@thebsh.namesys.com>

Andrew Morton wrote:

>Hans Reiser wrote:
>  
>
>>Green and Zam and Umka, on Monday please start work on seriously
>>analyzing how the block allocation differs between the new and the old
>>kernel, now that you can finally reproduce the benchmark on the old kernel.
>>    
>>
>
>I just sent the Orlov allocator patch to Linus.  It will double or
>triple ext2 performance in that test, so please make sure you compare
>against the latest.  There's a copy at
>http://www.zip.com.au/~akpm/linux/patches/2.5/2.5.45/shpte-stuff/broken-out/orlov-allocator.patch
>
>We can expect similar gains for ext3, when that's done.
>
>(The 2x-3x is on an 8meg filesystem.  Larger filesystems should
>gain more)
>
>
>  
>
Well, if we are only 2.5 times as fast for writes as ext3 after your 
patch is applied, I'll still feel good.;-)  

Better benchmarks will be conducted during the next 3 months, the ones 
we have are still a bit raw....

-- 
Hans


