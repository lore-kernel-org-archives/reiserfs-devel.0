From: Mike Jadon <mikej@umem.com>
Subject: Re: non volatile ram devices
Date: Wed, 04 Dec 2002 13:17:09 -0800
Message-ID: <5.1.0.14.0.20021204131208.07ef40d8@192.168.0.12>
References: <200212042059.35300.russell@coker.com.au>
 <200212042059.35300.russell@coker.com.au>
Reply-To: mikej@umem.com
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12110-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3DEE7C46.9080203@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: reiser@namesys.com, Russell Coker <russell@coker.com.au>
Cc: linux-ide-arrays@lists.math.uh.edu, ReiserFS <reiserfs-list@namesys.com>, Edward Shishkin <edward@namesys.com>, lrm@umem.com, rmathews@umem.com

Hans,

Many thanks for the referral.

Russell,

Our qty. 1-9 pricing is $730/unit for the 128MB card and $960/unit for the 
1GB card.  A driver is included the 2.4.19 kernel.

Thanks,

Mike


At 02:05 PM 12/4/2002, Hans Reiser wrote:
>Russell Coker wrote:
>
>>I have some servers that are giving inadequate disk performance for 
>>Maildir mail spools.  They are running kernel 2.4.19 (2.4.20 upgrade is 
>>planned) and using ReiserFS for everything that's important.
>>
>>At this stage it is impossible for me to replace disks, RAID controllers, 
>>or anything else really significant.
>>
>>What I am thinking of doing is using a kernel that supports data 
>>journalling which should increase performance, but still probably won't 
>>give me enough.
>>So I am thinking of using an "external journal" (or using software RAID 
>>to put the part of the partition containing the journal on a different device).
>>
>>The device containing the journal would be something much faster than 
>>physical media.  I have been doing some research on non-volatile memory 
>>devices.  I only found one company producing disks that are RAM based 
>>with battery backup, and they seem to start at $10K (too expensive - 
>>probably because they are much larger than I need, I need 128M at most, 
>>they provide 2G).  I found many companies selling flash memory, but that 
>>only takes a million writes (that'll last about an hour for the use I 
>>plan).  I found one company selling PC-Card devices that have two 
>>batterys for backup, but that requires getting a PCI controller for 
>>PC-Card's (something I haven't tried before).
>>
>>Does anyone know of an affordable ($1000 or less) device that can survive 
>>unexpected power outages of at least 24 hours duration, can commit a 
>>write in less than 1ms, supports unlimited writes, and connects to a IDE 
>>or SCSI bus (or PCI if there's a suitable Linux driver).
>>
>>
>The umem.com folks sell a device that we have tested and benchmarked 
>reiserfs on. If I could get Edward to format benchmarks in a way that 
>conveys that information that is relevant to persons reading them, I would 
>post them on our mailing list....
>
>Hans
>

Mike Jadon
Micro Memory, LLC
(US) Tel 818 998 0070 x 318
(US) Fax 818 998 4459
mikej@umem.com
www.umem.com
9540 Vassar
Chatsworth, Ca.
USA 91311 


