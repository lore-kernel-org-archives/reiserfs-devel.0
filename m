From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Hi Reiserfs-dev
Date: Thu, 28 Aug 2008 21:36:54 +0400
Message-ID: <48B6E236.5090607@gmail.com>
References: <194549.89970.qm@web53201.mail.re2.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <194549.89970.qm@web53201.mail.re2.yahoo.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 
Cc: reiserfs-devel@vger.kernel.org

Steven wrote:
> Thanks for the replies :) Thats the first time i've heard about barriers.
>
> I've always used noatime.. so thats no the issue. (I recently learnt to disable the dodgy Fedora readahead service too, and can't remember if i knew about this back then). Part of the problem is Reiser3 is so damn good (speed and robustness), and even FreeBSD has RO support nowadays, it's going to be hard to change even though reiser4's tail packing always got me excited.
>
>   

Actually, tail _conversion_ (not packing).

Working around dirty polymorphisms in the ITEM interface (a file built
of tails can not be mmap-ed with flags VM_MAYWRITE | VM_SHARED)
plus working around deadlock issues make its implementation very
complex.

So I would prefer reiser4 to go to mainline without tail stuff. However it
will require to fork the stuff for people who are not ready to reformat
their partitions, and it is not good, because somebody should take
care of the second branch. Any ideas?

Edward.

> --- On Wed, 8/27/08, Volker Armin Hemmann <volker.armin.hemmann@tu-clausthal.de> wrote:
>
>   
>> From: Volker Armin Hemmann <volker.armin.hemmann@tu-clausthal.de>
>> Subject: Re: Hi Reiserfs-dev
>> To: reiserfs-devel@vger.kernel.org
>> Date: Wednesday, August 27, 2008, 2:48 PM
>> On Mittwoch, 27. August 2008, Zan Lynx wrote:
>>     
>>> Steven wrote:
>>>       
>>>> Been using Reiser 3 for years now, messing round
>>>>         
>> with m-multiple
>>     
>>>> operating systems. Imho, it's easily the best
>>>>         
>> general purpose linux
>>     
>>>> filesystem.  Does anyone here say otherwise ?
>>>>
>>>> I went through the hassle of installing reiser 4
>>>>         
>> on 2.6.24 about a
>>     
>>>> year ago, but it seemed to have latency issues,
>>>>         
>> esp. at start-up
>>     
>>>> (fedora 4, 1.13 PIII dell laptop with 256ram) and
>>>>         
>> reverted back to
>>     
>>>> reiser 3. Ideas?
>>>>
>>>> Thanks, Steven.
>>>>         
>>> I've been running Reiser4 on my laptop as / for a
>>>       
>> long time now. I have
>>     
>>> two bits of advice.
>>>
>>> Make sure it mounts at boot with the noatime option.
>>>       
>> Something like
>>     
>>> "rootflags=noatime" on your LILO or GRUB
>>>       
>> kernel options line.
>>     
>>> Have your init scripts set the queue depth on your
>>>       
>> block IO scheduler to
>>     
>>> 1024. Something like "echo 1024 >
>>>       
>> /sys/block/sda/queue/nr_requests".
>>     
>>> With just 256 MB you might want to try smaller values.
>>>       
>> I'm not very
>>     
>>> clear on how much RAM each queue slot can use.
>>>
>>> I found that Reiser4 will appear to hang if it cannot
>>>       
>> flush an entire
>>     
>>> transaction atom to the IO queue in one go. Make sure
>>>       
>> it's big enough.
>>     
>>> The other thing that seems to make it a little slow is
>>>       
>> that it uses
>>     
>>> barriers.  This is a Linux feature that serious
>>>       
>> filesystems use to
>>     
>>> guarantee data integrity.  ext3 uses barriers for its
>>>       
>> journal and XFS
>>     
>>> uses barriers too.  I believe there were patches for
>>>       
>> reiser3 to use
>>     
>>> barriers too but I don't know if those are in all
>>>       
>> Linux or just SUSE.
>>
>> reiserfs uses barriers for ages. Xfs and reiserfs use
>> barriers by default.
>> ext3 does not use barriers by default. Because of the
>> performance hit.
>>
>> Every 'benchmark' that does not enable or disable
>> barriers is skewed in ext3's 
>> advantage. With barriers turned on for all filesystems ext3
>> is very slow.
>>
>>
>>
>> --
>> To unsubscribe from this list: send the line
>> "unsubscribe reiserfs-devel" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at 
>> http://vger.kernel.org/majordomo-info.html
>>     
>
>
>       
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>   

