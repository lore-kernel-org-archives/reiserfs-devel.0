From: Toby Thain <toby@smartgames.ca>
Subject: Re: reiserfs and IDE write cache
Date: Fri, 18 Aug 2006 10:20:57 -0400
Message-ID: <BAYC1-PASMTP065B968F8D624DE47C91F4BF420@CEZ.ICE>
References: <200608180922.23867.fjcabello@visual-tools.com>
Mime-Version: 1.0 (Apple Message framework v752.2)
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29625-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200608180922.23867.fjcabello@visual-tools.com>
Message-Id: <62F98FB1-8B60-44D6-A04E-EA0722E610A7@smartgames.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: Francisco Javier Cabello <fjcabello@visual-tools.com>
Cc: reiserfs-list@namesys.com


On 18-Aug-06, at 3:22 AM, Francisco Javier Cabello wrote:

> Hello,
> I have been 'googling' and I have found a lot of people warning  
> about the
> problems with IDE write cache and journaling filesystems.
> Should I disable write cache in my systems using reiserfs3+2.4.25?
>
> I have tried to disable write cache with hdparm (hdparm -W0 /dev/ 
> hdc) but it
> is not working  ( you can see write cache is enabled with hdparm
> -i /dev/hdc).
> Is there other way to disable write cache?


Get a UPS. :)

Here are some links I collected on this subject a few months ago.


    * _Due to loose interpretations and vendor uniqueness in the ATA  
Standard, there is no defined way that a driver can be assured that  
the disk's cache has been flushed._ (http://developer.apple.com/ 
technotes/tn/tn1040.html)

    * _if write back cache is turned on, it is not difficult to  
create metadata inconsistency or corruption at the file system upon  
power failure._ (http://sr5tech.com/write_back_cache_experiments.htm)

    * Apple forum [[http://lists.apple.com/archives/darwin-dev/2005/ 
Feb/msg00072.html post]] discussing the issues and OS X's F_FULLFSYNC  
feature, which tries hard to flush drive caches.

    * Linux kernel mailing list: _How long can the unwritten data  
linger in the drive cache if the drive is otherwise idle?_ http:// 
lkml.org/lkml/2003/11/2/73

    * Interesting blog [[http://peter-zaitsev.livejournal.com/ 
12639.html?mode=reply post]] on the issue by a !MySQL developer.  
_Transaction will be durable and database intact on the crash only if  
database will perform synchronous IO as synchronous - reporting it is  
done when data is physically on the disk._

    * Detailed [[http://www.opensolaris.org/os/community/arc/caselog/ 
2004/652/ post]] about Open Solaris' approach to the issue (see  
'spec' link)


>
> Regards,
>
> Paco
>
> -- 
> One of my most productive days was throwing away 1000 lines of code  
> (Ken
> Thompson)
> -----------------
> PGP fingerprint: AF69 62B4 97EB F5BB 2C60  B802 568A E122 BBBE 5820
> PGP Key available at http://pgp.mit.edu
> -----------------
>

