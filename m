From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Reiser4 hang -- bad sectors on disk
Date: Fri, 23 Sep 2005 12:35:49 +0400
Message-ID: <4333BE65.6070009@namesys.com>
References: <200509221245.39730.rmeijer@internet.gr> <861194762.20050922121940@wp.pl> <200509230942.03727.rmeijer@internet.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26254-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200509230942.03727.rmeijer@internet.gr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Raymond A. Meijer" <rmeijer@internet.gr>
Cc: reiserfs-list@namesys.com

Hello

Raymond A. Meijer wrote:
> On Thursday 22 September 2005 13:19, Pysiak Satriani wrote:
> 
>>I might be wrong here, but bad blocks are a condition that the kernel
>>should handle without barfing oops traces,

Ray, you might want to try to mount reiser4 with -o onerror=remount-ro
This may help to avoid some of oopses

> so there indeed may be
>>not enough sanity checks somewhere.
> 
> Perhaps...
> 
> I can do some more testing, but there are more and more bad sectors...
> For now I'll disable DMA and maybe I can salvage my files.
> 

You need new hard drive.

> 
> Thanks,
> 
> Ray
> 
> 

