From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: [PATCH] new data logging and quota patches available
Date: Sun, 23 Feb 2003 02:04:07 +0100
Message-ID: <3E581E07.3050407@mb.tu-ilmenau.de>
References: <1045870331.16048.325.camel@tiny.suse.com>	 <200302221341.23799.Dieter.Nuetzel@hamburg.de>	 <1045926958.16042.366.camel@tiny.suse.com> <1045930351.16042.377.camel@tiny.suse.com> <3E581AD7.30000@mb.tu-ilmenau.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12870-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@namesys.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 02/23/2003 01:50 AM, Manuel Krause wrote:
> On 02/22/2003 05:12 PM, Chris Mason wrote:
> 
>> And here's one more patch for those of you that want to experiment a
>> little.  reiserfs_dirty_inode gets called to log the inode every time
>> the vfs layer does an atime/mtime/ctime update, which is one of hte
>> reasons mounting with -o noatime and -o nodiratime makes things 
>> faster. We had to do this because otherwise kswapd can end up trying 
>> to write
>> inodes, which can lead to deadlock as he tries to wait on the log.
>>
>> One of the patches in my data logging directory is kinoded-8, which
>> changes things so a new kinoded does all inode writeback instead of
>> kswapd.
>>
>> That means that if you apply up to 05-data-logging-36 and then apply
>> 09-kinoded-8 (you won't need any of the other quota patches), you can
>> also apply this patch.  It changes reiserfs to leave inodes dirty, which
>> saves us lots of time on atime/mtime updates.
>>
>> I'l upload this after it gets a little additional testing, but wanted to
>> include it here in case anyone else was interested in benchmarking.
>>
>> [11.dirty-inodes-for-kinoded.diff]
> 
> Hi Chris!
> 
> At least I'm not able to copy through my partition via "cp -a ..." with 
> the last supposed setup + preempt without quota ...
> 
> When umounting the destination partition it says "device is busy".
> 
> I don't know what is gone for now on my repository partition, but I know 
> from earlier times this should not happen.

Sorry, I was incomplete with my report, at least with the following: 
After thinking over the remount strategy for some minutes with a pizza 
the partition was umountable again. I don't have exact values but it was 
under about 15 minutes max. with 3.5GB copied previously.

My setup in fact:
m02-akpm-b_journal_head-1.diff
m03-relocation-6.diff
m04-reiserfs-sync_fs-1.diff
m05-data-logging-36.diff
m06-logging-export.diff
m06-write_times.diff
m09-kinoded-8.diff
m11.inode-dirty-for-kinoded-ML.diff
(prefix m for you)

+ latest preempt patch (what was for 2.4.21-pre1).


Thanks,

Manuel

