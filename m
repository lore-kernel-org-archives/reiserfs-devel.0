From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: Question on IICACHE and mount info (2.4.19-pre5)
Date: Fri, 05 Apr 2002 15:27:03 +0200
Message-ID: <3CADA627.7080800@mb.tu-ilmenau.de>
References: <3CACE903.30901@mb.tu-ilmenau.de> <20020405090248.A6915@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>, "Yury Yu. Rupasov" <yura@yura.polnet.botik.ru>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 04/05/2002 07:02 AM, Oleg Drokin wrote:

> Hello!
> 
> On Fri, Apr 05, 2002 at 02:00:03AM +0200, Manuel Krause wrote:
> 
> 
>>Is there only the addidional mount option "iicache" with this patch:
>>ftp://ftp.namesys.com/pub/reiserfs-for-2.4/testing/linux-2.4.19p4-iicache-new-5.patch 
>>?
>>There were some more in the early versions of iicache, IIRC.
>>
> 
> most of other options were considered unsafe, so probably they were dropped.
> 
> 
>>But at the moment it works very well with 2.4.19-pre5 + 
>>rml.preempt+lock-break + aa.vm-33 + some other aa patches and some akpm 
>>ones.
>>
> 
> Do you see any difference with and without iicache?
> 


At the moment I'm facing some stability problems with the other patches 
I applied. I could say more about differences after solving this. ;-)

> 
>>When I put ",iicache" to the fstab lines of my reiserfs partitions I 
>>don't get a response from
>># cat "/proc/fs/reiserfs/ide0(3,11)/super"
>>state:  REISERFS_VALID_FS
>>mount options:  BORDER NO_TAILS LOG
>># cat /proc/mounts
>>/dev/root / reiserfs rw,noatime 0 0
>>/dev/hda11 /mnt/beta reiserfs rw,noatime,nosuid,nodev 0 0
>>only # mount says:
>>/dev/hda7 on / type reiserfs (rw,noatime,notail,iicache)
>>...
>>/dev/hda11 on /mnt/beta type reiserfs 
>>(rw,nosuid,nodev,noatime,notail,iicache)
>>...
>>
> 
> It seems this is lost piece of code, that prints this info.
> 

> 
>>Seems like some things have gone with the latest patches which worked 
>>before? It's o.k., of course, if "iicache" doesn't show up for now, I 
>>know it's for testing only (yes, it would be very nice!). But the 
>>"notail" thing worked before!
>>
> 
> Which "notail" thing?
> 


Mmmh. I only repeated myself? I wanted to say that the "notail" mount 
option showed up in "# cat /proc/mounts" some weeks ago, IIRC.

> Bye,
>     Oleg
> 
> 


I'll try the latest one (linux-2.4.19p5-iicache-new-10.patch) instead of -5.

Thanks,

Manuel




