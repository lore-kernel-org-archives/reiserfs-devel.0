From: "E.Gryaznova" <grev@namesys.com>
Subject: Re: Collect data?
Date: Wed, 23 Nov 2005 13:06:46 +0300
Message-ID: <43843F36.5050907@namesys.com>
References: <200511171447.41362.mail@earthworm.de> <437CBC63.3050202@namesys.com> <200511172040.39955.mail@earthworm.de> <43820CAD.3090605@namesys.com> <20051121210136.GA25708@favonius> <4383677F.8060106@namesys.com> <20051123070924.GA6951@favonius>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27097-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20051123070924.GA6951@favonius>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: sander@humilis.net
Cc: Vladimir Saveliev <vs@namesys.com>, reiserfs-list@namesys.com

Sander wrote:

>E.Gryaznova wrote (ao):
>  
>
>>Sander wrote:
>>    
>>
>>># echo "foo" > /boot/test
>>># time vim +"s/foo/bar/" +"wq" /boot/test
>>>real    0m0.016s
>>>user    0m0.000s
>>>sys     0m0.000s
>>>
>>># echo "foo" > /root/test
>>># time vim +"s/foo/bar/" +"wq" /root/test
>>>real    0m9.667s
>>>user    0m0.000s
>>>sys     0m0.020s
>>>
>>>/dev/hda2 on / type reiser4 (rw)
>>>/dev/hda1 on /boot type ext2 (rw)
>>>      
>>>
>>Yes, thank you.
>>Which iosched do you use?
>>    
>>
>
>'deadline':
>
>$ cat /sys/block/hda/queue/scheduler 
>noop anticipatory [deadline] cfq 
>
>  
>
>>Would you please  repeat the vim/reiser4 test for each iosched and
>>send us the time values?
>>    
>>
>
>As others already reacted with data regarding this test I assume you
>don't need my data anymore.
>  
>
not right. We _need_ your data for "bad" system.

Thanks,
Lena

>I understand this problem must be quite annoying for the Reiserfs team
>as you can't reproduce it. In my case it also only happens on one
>system, and not on another.
>
>Maybe we can collect data? I'm happy to set up a page with 'good' and
>'bad' configurations. Any suggestions as to what you need?
>
>My 'good' system:
>kernel:		2.6.15-rc1-mm2
>OS:		Debian Sid
>disks:		4x sata on Promise
>raid/lvm/etc:	lmv stripe
>
>My 'bad' system:
>kernel:		2.6.15-rc1-mm1
>OS:		Debian Sid
>disks:		ata on nForce2
>raid/lvm/etc:	none, single disk
>
>  
>


