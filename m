From: Hans Reiser <reiser@namesys.com>
Subject: Re: mkreiserfs -s 1024 makes unmountable partitions
Date: Wed, 29 Jan 2003 14:37:16 +0300
Message-ID: <3E37BCEC.9080203@namesys.com>
References: <20030117221535.GA945@Kadath> <20030118080941.B5575@humilis> <20030118115724.GA946@Kadath> <20030121213336.GA6756@hell.mine.nu> <20030122065712.D5575@humilis> <20030122100342.GA14100@hell.mine.nu> <20030124222823.GA15643@hell.mine.nu> <20030126181816.GA1274@Kadath> <20030127095957.A22720@namesys.com> <2147483647.1043634047@[10.1.120.1]> <20030127102540.A22869@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12536-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030127102540.A22869@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: "Scott R. Every" <scott@blast.com>, Francois-Rene Rideau <fare@tunes.org>, reiserfs-list@namesys.com

Oleg Drokin wrote:

>Hello!
>
>On Mon, Jan 27, 2003 at 02:20:47AM -0500, Scott R. Every wrote:
>  
>
>>this URL works better:
>>ftp://ftp.suse.com/pub/people/mason/patches/data-logging
>>Oleg, thanks so much for this info(and Chris, thanks for the patches). 
>>This is much needed for embedded filesystems of 128MB and smaller.  Its 
>>hard to fit a 32MB journal on a 32 or 16MB FLASH disk!
>>    
>>
>
>Actually if you have direct access to FLASH device (e.g. through MTD),
>then you really want to look at jffs2. Besides being journalled, it also
>provides data compression (which is invaluable for such small storage sizes)
>and flash wearing control (or what is the name for facility that controls that
>certain areas of flash are not written to more often then other ones).
>
>Bye,
>    Oleg
>
>
>  
>
Reiser4 will provide compression (compression plugin is being coded 
now), and won't waste space for a mandatory fixed size journal area.

-- 
Hans


