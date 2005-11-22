From: "E.Gryaznova" <grev@namesys.com>
Subject: Re: More Slowdown or reiser4 update for 2.6.14-mm2
Date: Tue, 22 Nov 2005 21:46:23 +0300
Message-ID: <4383677F.8060106@namesys.com>
References: <200511171447.41362.mail@earthworm.de> <437CBC63.3050202@namesys.com> <200511172040.39955.mail@earthworm.de> <43820CAD.3090605@namesys.com> <20051121210136.GA25708@favonius>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27078-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20051121210136.GA25708@favonius>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: sander@humilis.net
Cc: "Hesse, Christian" <mail@earthworm.de>, "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com

Sander wrote:

>E.Gryaznova wrote (ao):
>  
>
>>Unfortunately we are not able to reproduce this slowdown. Would you
>>please provide more info?:
>>    
>>
>
>FWIW, I notice the same (I'm not the OP). My main workstation (Athlon)
>runs 2.6.15-rc1-mm1. Vim needs 4 to 12 seconds to close any file, mutt
>is very slow on sending email, backups take several hours and in general
>anything done on the filesystem seems slow. This system has one IDE
>disk.
>
>Scrips are locked when vim closes and bash/perl complain when they try
>to read/execute the script.
>
>The strange thing is that another system running 2.6.15-rc1-mm2 does not
>have this slowdown. There are no Reiser4 updates in -mm2 AFAICS. This
>system is a Via Epia with Reiser4 on lvm2 on 4xSATA.
>
>  
>
>>Is this 2.6.14-mm2 bad sync/fsync performance reproducible on fresh
>>created reiser4 too?
>>    
>>
>
>I'll try.
>
>  
>
>>Are these values stable reproducible? If you run this test several
>>time -- do you have the same results?
>>    
>>
>
>Vim is always very slow on close (:wq) for me.
>
>  
>
>>Would you please send df -T output 
>>    
>>
>
># df -T /
>Filesystem    Type   1K-blocks      Used Available Use% Mounted on
>/dev/hda2  reiser4   232423180 166976448  65446732  72% /
>
>  
>
>>and 2.6.14-mm2 config file?
>>    
>>
>
>2.5.16-rc1-mm1 below.
>
>  
>
>>Did you try this test on ext2? If no -- would you please try it on
>>ext2 for the same kernels and send us the results?
>>    
>>
>
>If I open and edit a file on /boot, which is ext2 on hda1, vim reacts as
>expected. Quick and without a single delay.
>
># echo "foo" > /boot/test
># time vim +"s/foo/bar/" +"wq" /boot/test
>real    0m0.016s
>user    0m0.000s
>sys     0m0.000s
>
># echo "foo" > /root/test
># time vim +"s/foo/bar/" +"wq" /root/test
>real    0m9.667s
>user    0m0.000s
>sys     0m0.020s
>
>/dev/hda2 on / type reiser4 (rw)
>/dev/hda1 on /boot type ext2 (rw)
>
>
>Anything I can do to help?
>
>  
>
Yes, thank you.
Which iosched do you use?
Would you please  repeat the vim/reiser4 test for each iosched and send 
us the time values?
Something like
for i in cfq noop anticipatory deadline
do
  echo $i > /sys/block/hda/queue/scheduler && cat 
/sys/block/hda/queue/scheduler && echo "foo" >/root/test && time vim +"s/
foo/bar/" +"wq" /root/test
done

Thanks,
Lena


>#
># IO Schedulers
>#
>CONFIG_IOSCHED_NOOP=y
>CONFIG_IOSCHED_AS=y
>CONFIG_IOSCHED_DEADLINE=y
>CONFIG_IOSCHED_CFQ=y
># CONFIG_DEFAULT_AS is not set
>CONFIG_DEFAULT_DEADLINE=y
># CONFIG_DEFAULT_CFQ is not set
># CONFIG_DEFAULT_NOOP is not set
>CONFIG_DEFAULT_IOSCHED="deadline"
>  
>



