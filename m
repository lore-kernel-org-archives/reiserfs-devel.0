From: Hans Reiser <reiser@namesys.com>
Subject: Re: Horrible ftruncate performance
Date: Tue, 15 Jul 2003 17:51:23 +0400
Message-ID: <3F1406DB.9090705@namesys.com>
References: <Pine.LNX.4.30.0307151310560.6563-100000@divine.city.tvnet.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14940-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.30.0307151310560.6563-100000@divine.city.tvnet.hu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Szakacsits Szabolcs <szaka@sienet.hu>
Cc: Oleg Drokin <green@namesys.com>, Dieter N?tzel <Dieter.Nuetzel@hamburg.de>, Chris Mason <mason@suse.com>, Marc-Christian Petersen <m.c.p@gmx.net>, reiserfs-list@namesys.com, Philippe Gramoull? <philippe.gramoulle@mmania.com>, Vladimir Demidoff <vova@namesys.com>

Szakacsits Szabolcs wrote:

>On Sun, 13 Jul 2003, Oleg Drokin wrote:
>  
>
>>On Sat, Jul 12, 2003 at 03:37:48AM +0200, Szakacsits Szabolcs wrote:
>>
>>    
>>
>>>Ok, last complain for today :) I couldn't find an API (I admit, because of
>>>the above reasons, I didn't search hard) to query the map of disk blocks or
>>>[offsets, length] couples used by a file, like XFS's XFS_IOC_GETBMAPX does.
>>>      
>>>
>>Something like FIBMAP ioctl?
>>    
>>
>
>FIBMAP is limited, inefficient (especially for large sparse files with very
>high hole density) and it also needs root.
>
>Some data, querying a 200GB file,
>
>ext3 + FIBMAP             63.53 sec 100% CPU
>JFS  + FIBMAP      	  65.81 sec 100% CPU
>XFS  + FIBMAP            125.93 sec 100% CPU
>XFS  + XFS_IOC_GETBMAPX    0.00 sec   0% CPU
>
>Probably this inefficiency is the reason that no utilities (tar, cp, cat,
>gzip, bzip2, etc) use it, instead they just read/analyse the zeros over an
>hour when in cases their _entire_ operation could/can be done in seconds,
>minutes.
>
>	Szaka
>
>
>
>  
>
This is a good point.  Demidov, consider holes when you optimize 
assignment in sys_reiser4().

-- 
Hans


