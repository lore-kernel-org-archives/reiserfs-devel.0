From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiser4 status: benchmarked vs. V3 (and ext3)
Date: Sun, 27 Jul 2003 16:59:40 +0400
Message-ID: <3F23CCBC.9070600@namesys.com>
References: <3F1EF7DB.2010805@namesys.com>	 <1059062380.29238.260.camel@sonja>	 <16160.4704.102110.352311@laputa.namesys.com>	 <1059093594.29239.314.camel@sonja>	 <16161.10863.793737.229170@laputa.namesys.com> <1059142851.6962.18.camel@sonja>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15066-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1059142851.6962.18.camel@sonja>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Daniel Egger <degger@fhm.edu>
Cc: Nikita Danilov <Nikita@Namesys.COM>, Linux Kernel Mailinglist <linux-kernel@vger.kernel.org>, reiserfs mailing list <reiserfs-list@namesys.com>

Daniel Egger wrote:

>Am Fre, 2003-07-25 um 15.02 schrieb Nikita Danilov:
>
>  
>
>>No special measures are taken to level block allocation. Wandered blocks
>>are allocated to improve packing i.e., place blocks of the same file
>>close to each other. Actually, it tries to place tree nodes in the
>>parent-first order.
>>    
>>
>
>So the new blocks are created as close as possible to the old blocks
>instead of say spreading them as far as possible. This is pretty bad for
>usage in the embedded world but I guess this is not the market you're
>aiming at. :(
>
>  
>
I thought that close was fine, it was putting it in the same block that 
was the problem?

Again, I think this is best solved in the device layer.

-- 
Hans


