From: Russell Coker <russell@coker.com.au>
Subject: Re: How to mount reiserfs with a relocated journal? -- Figured out
Date: Fri, 11 Jul 2003 17:08:22 +1000
Message-ID: <200307111708.22951.russell@coker.com.au>
References: <003401c34771$51d29e60$6401a8c0@doug>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14879-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <003401c34771$51d29e60$6401a8c0@doug>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Doug Bazarnic <doug@cavecreek.net>
Cc: reiserfs-list@namesys.com

On Fri, 11 Jul 2003 15:57, Doug Bazarnic wrote:
> I've heard that using flash card memory (solid state devices) increases
> performance -- roughly 20-30%.   With the slower write speeds of 4 - 6
> MByte/sec,  I'm not sure if it would truly be faster.

As Oleg mentions having 0 seek time will be a huge win for flash.  However if 
you have a 15,000rpm disk doing nothing but journalling (so the journal is 
only on the first few cylinders) the seek time will also be very low.

> The flash card is supposed to have a life greater than 1 million writes
> to it, so I don't know how well it will hold up in real life.  We're

Last time I looked into this I had some servers that were sustaining >1M/s of 
disk writes 24*7.  If that is all journalled and there's a 256M journal then 
each block would be written once every four minutes.  If the flash card would 
last exactly 1M writes for each block (something I doubt) then it would last 
4M minutes which is over 7 years.  You may want to sustain a higher load than 
I did, but it still is quite likely that the flash will last the 3 months you 
require.

However I believe that the the umem cards are a better choice.  They have a 
sustained write speed of 240MB/s (much faster than flash) and because they 
are battery backed RAM devices they support an unlimited number of writes.  
The best thing is that they are specifically designed for tasks just like 
this one.  See the following URL for details:
http://www.micromemory.com/

I am not associated with umem in any way, I just determined after extensive 
research that they were the best option for one of my clients.  My client 
then decided to just purchase more hard drives instead (at much greater 
expense).  :(

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

