From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiser4 status: benchmarked vs. V3 (and ext3)
Date: Sun, 27 Jul 2003 17:28:43 +0400
Message-ID: <3F23D38B.3020309@namesys.com>
References: <3F1EF7DB.2010805@namesys.com>	 <1059062380.29238.260.camel@sonja>	 <16160.4704.102110.352311@laputa.namesys.com>	 <1059093594.29239.314.camel@sonja>	 <16161.10863.793737.229170@laputa.namesys.com>	 <1059142851.6962.18.camel@sonja>	 <1059143985.19594.3.camel@haron.namesys.com>	 <1059181687.10059.5.camel@sonja>	 <1059203990.21910.13.camel@haron.namesys.com> <1059228808.10692.7.camel@sonja>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15068-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1059228808.10692.7.camel@sonja>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Daniel Egger <degger@fhm.edu>
Cc: Yury Umanets <umka@namesys.com>, Nikita Danilov <Nikita@Namesys.COM>, Linux Kernel Mailinglist <linux-kernel@vger.kernel.org>, reiserfs mailing list <reiserfs-list@namesys.com>

Daniel Egger wrote:

>Am Sam, 2003-07-26 um 09.19 schrieb Yury Umanets:
>
>  
>
>>I think this is more then enough for running reiser4. Reiser4 is a linux
>>filesystem first of all, and linux is able to be ran on even worse
>>hardware then you have.
>>    
>>
>
>Linux is running just fine one the system, thanks. My question is
>whether reiserfs is suitable for flash devices. The chances to get some
>usable answers seem to be incredible low though...
>
>  
>
it is suitable for any flash device that has wear leveling built into 
the hardware (e.g. all compact flash cards), or for which a wear 
leveling block device driver is used (I don't know if one exists for Linux).

-- 
Hans


