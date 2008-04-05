From: Ric Wheeler <ric@emc.com>
Subject: Re: bad block management
Date: Sat, 05 Apr 2008 11:08:13 -0400
Message-ID: <47F795DD.1050508@emc.com>
References: <16413477.post@talk.nabble.com> <alpine.DEB.1.10.0804012050350.7128@sheep.housecafe.de> <47F28DE5.1060402@emc.com>  <47F29257.3000502@suse.com> <1207268072.379391.7.camel@localhost> <02D8FA59-0FF5-444C-BAAF-17A4BEA847AF@telegraphics.com.au> <47F67A5B.1010903@emc.com> <A857947A-0C94-4804-B8B4-7D05CCB63AE4@telegraphics.com.au> <47F77135.1000701@emc.com> <9BF9A69F-F5D1-4A58-B3AA-719799E225A9@telegraphics.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <9BF9A69F-F5D1-4A58-B3AA-719799E225A9@telegraphics.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Toby Thain <toby@telegraphics.com.au>
Cc: Zan Lynx <zlynx@acm.org>, Jeff Mahoney <jeffm@suse.com>, Christian Kujau <lists@nerdbynature.de>, kgp <jyotiv@tataelxsi.co.in>, reiserfs-devel@vger.kernel.org

Toby Thain wrote:
> 
> On 5-Apr-08, at 8:31 AM, Ric Wheeler wrote:
>> Toby Thain wrote:
>>> On 4-Apr-08, at 2:58 PM, Ric Wheeler wrote:
>>>>
>>>> Toby Thain wrote:
>>>>> On 3-Apr-08, at 8:14 PM, Zan Lynx wrote:
>>>>>> On Tue, 2008-04-01 at 15:51 -0400, Jeff Mahoney wrote:
>>>>>>
>>>>>>> Ric's right about disk drives, though. They'll remap the bad sectors
>>>>>>> automatically at the hardware level. When you start to see bad 
>>>>>>> sectors
>>>>>>> at the file system level, it means that the sectors reserved for
>>>>>>> remapping have been exhausted and you should replace the disk.
>>>>>>
>>>>>> There are a couple of cases where you can see bad block errors on 
>>>>>> a good
>>>>>> drive.
>>>>>>
>>>>>> If a block is written with a bad CRC for some reason...the write head
>>>>>> got a freak blip or it lost power as it was writing, or the data went
>>>>>> corrupt while sitting on disk, then it will read as a bad block, but
>>>>>> rewriting would fix it.
>>>>>>
>>>>>> A RAID media verify or a badblocks -n run can usually fix these.
>>>>> Only if your RAID uses CRCs (most don't).
>>>>> ZFS is the real answer to undetected corruption.
>>>>> --Toby
>>>>
>>>> Zan is right - even on a local drive, a write can repair some 
>>>> sectors with bad protection bits. All disks have per sector data 
>>>> protection (reed solomon encoding, etc) and there are lots of those 
>>>> bits per sector.
>>> That does not protect against writing bad data, only some errors 
>>> internal to drive. There is a long way to travel between CPU and 
>>> drive. Cable, controller, RAM, etc, etc, etc. ZFS protects the entire 
>>> data path.
>>> --Toby
>>
>> If you want to protect the entire data path, you are looking at 
>> something like DIF which protects even more of the data path than ZFS 
>> since it adds a check from application space to the IO stack ;-)
>>
>> ZFS does not export its protection bits up the stack.
> 
> Correct, but it protects everything up to the system call. RAID does not 
> even get close, even with perfect error reporting (which doesn't really 
> exist anyway). :)
> 
> --Toby
> 

When you look in detail at how data is lost in working systems, it is 
always interesting to look at the big buckets of common failures and 
make sure that we balance the complexity and cost (in money or in 
performance) against the realized improvement.

What RAID does well is to protect against the leading and really, really 
common error case which is single or few sector errors on a disk drive. 
Those errors are almost always reported as IO errors and RAID systems 
(including our MD software RAID) will do the right thing when only one 
sector in a stripe is bad with a media error.

The interesting question is what failure is the second most common.

That, from what I see, is normally application/SW errors. It can be bugs 
in the fs or IO stack, but also it is also common to lose data from bad 
applications.

I don't have first hand experience with ZFS, but in any complicated 
system you have a danger to increase the error rate (certainly for early 
adopters ;-)) while the developers try to figure out how their 
implementation differs from their pristine design (or what the design 
concept missed).

My measured results of the reliability of reiserfs (v3) over a really 
large population show that we do quite well (when you use barriers or 
disable the write cache).

It will be interesting to look for the first ZFS study (like the CMU 
paper by Bianca on disk failure, the google paper on failures and the 
recent NetApp/UWisc papers on IO stack failures) to see how ZFS does in 
the wild.

ric
