From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiser4 status: benchmarked vs. V3 (and ext3)
Date: Mon, 28 Jul 2003 16:44:07 +0400
Message-ID: <3F251A97.9010409@namesys.com>
References: <3F1EF7DB.2010805@namesys.com>	 <1059062380.29238.260.camel@sonja>	 <16160.4704.102110.352311@laputa.namesys.com>	 <1059093594.29239.314.camel@sonja>	 <16161.10863.793737.229170@laputa.namesys.com>	 <1059142851.6962.18.camel@sonja>  <3F23CCBC.9070600@namesys.com> <1059315409.10692.215.camel@sonja>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15093-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1059315409.10692.215.camel@sonja>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Daniel Egger <degger@fhm.edu>
Cc: Nikita Danilov <Nikita@Namesys.COM>, Linux Kernel Mailinglist <linux-kernel@vger.kernel.org>, reiserfs mailing list <reiserfs-list@namesys.com>

Daniel Egger wrote:

>Am Son, 2003-07-27 um 14.59 schrieb Hans Reiser:
>
>  
>
>>I thought that close was fine, it was putting it in the same block that 
>>was the problem?
>>    
>>
>
>This looks fine for normal harddrives put on flash you'd probably like
>to write the data evenly over the free space in some already formatted
>section still leaving the oportunity to format some other sectors to not
>run out of space.
>
I was not able to parse the sentence above.;-)

>
>  
>
>>Again, I think this is best solved in the device layer.
>>    
>>
>
>A device layer that shuffles around sectors would have interesting
>semantics, like hardly being portable because one would have to use
>exactly the same device driver with the same parameters to use the
>filesystem and thus retrieve the data.
>
>  
>
No, you could be more clever than that.

-- 
Hans


