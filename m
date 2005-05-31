From: Dan Oglesby <doglesby@teleformix.com>
Subject: Re: Reiserfs 1300G partition on lvm problem ...
Date: Tue, 31 May 2005 10:09:58 -0500
Message-ID: <429C7E46.9090507@teleformix.com>
References: <1117392967.29669.ezmlm@namesys.com>            <429A1742.8030504@mh.be> <200505292137.j4TLbarw017197@turing-police.cc.vt.edu> <429AAFDC.4050208@mh.be> <429C6BE8.4090906@teleformix.com> <429C7153.8000008@mh.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24230-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <429C7153.8000008@mh.be>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matthias Barremaecker <info@mh.be>
Cc: Valdis.Kletnieks@vt.edu, reiserfs-list@namesys.com

Matthias Barremaecker wrote:
> Hi Dan,
> 
> My recovery goes rather well...
> 
> Does the badblocks count or anything ? With me it counted.
> 

So far, I haven't seen any bad blocks written to my output file.  I'm 
not in front of the machine (remote location), so I can't see what's on 
the console, where I'm actually running the command.

> You have to write the bad block no's to a file and feed that to the 
> reiserfschk.
> 

Yeah, that's what I'm doing.

> I didn't completed a full badblock check coz I knew the badblocks could 
> only be at the beginning of the lvm 'array', but I excpect it to take as 
> long as a reiserfsck --tree-rebuild.
> 
> If you don't see anything counting -- start worrying.
> 

I have no idea if there are even real bad blocks on my array.  I think 
the controller's BIOS/firmware was so old, it didn't know how to deal 
with the power outage in a sane manner.  The last reiserfsck failed 
after a day of running, so I'm thinking if I have a problem, it's 
towards the end of my array.  Time will tell.

> Good luck to you to.
> 
> I have still 18 hours to go... I realy hope I can mount the dam thing 
> after that and then I can start looking for the bad disk.
> 

Thanks, and same here...  :-)

> And I'm not using any type of raid for that data.
> 

JBOD?

--Dan

> kind regardes,
> 
> Matthias.
> 
> Dan Oglesby wrote:
> 
>> Matthias Barremaecker wrote:
>>
>>> Hi,
>>>
>>> Thanx for your reply.
>>>
>>> The data is not THAT importend, all our importend data is backuped 4 
>>> times, inc. original (well, 3 times now, since the 1300gig machine is 
>>> broke).
>>>
>>> I did a bit furtur reasearch and maybe this is something to think 
>>> about if you use reiserfs :
>>>
>>> I did a bad block check and I have 10 bad blocks of 4096bytes on 
>>> 1300Gig and ... that is the reason reiserfs will not work anymore.
>>>
>>> I guess this sux. I rather have that the data on the bad blocks is 
>>> just corupted but the rest is accesseble.
>>>
>>> I'm doing a --rebuild-tree with the bad block list. Hopes this works.
>>>
>>>
>>> Aren't there any tools to substract data from a broken reiserfs 
>>> partition ?
>>>
>>>
>>> kind regardes,
>>>
>>> Matthias.
>>>
>>>
>>>
>>
>>
>> I'm currently in a similar situation:  1TB (RAID-5) ReiserFS 
>> filesystem running on RedHat 7.2 with a Promise SX6000 controller.  
>> Everything was running stock version/firmware/BIOS, and it suddently 
>> developed 39 bad blocks after a power outage.
>>
>> reiserfsck --rebuild-tree (version 3.6.4, the latest for RH 7.2) 
>> failed to complete after the controller kept hard locking/crashing.
>>
>> So, I've compiled a plain 2.4.30 kernel (from kernel.org, not RedHat), 
>> updated the BIOS/Firmware on the SX6000, and compiled and installed 
>> the latest reiserfsprogs (3.6.19, I believe?), and have been running 
>> badblocks (non-destructive) for the last four days.  Nothing has 
>> turned up so far.
>>
>> I'm hoping the next time I run a --rebuild-tree, it will be able to 
>> complete.  I really do need to get the data off of this filesystem.
>>
>> Good luck with your recovery.
>>
>> --Dan
>>
>>
>>
>>
>>> Valdis.Kletnieks@vt.edu wrote:
>>>
>>>> On Sun, 29 May 2005 21:25:54 +0200, Matthias Barremaecker said:
>>>>
>>>>
>>>>> but that sais it is a fysical drive error
>>>>
>>>>
>>>>
>>>>
>>>>
>>>> Physical drive errors.  Your hardware is broken.  Isn't much that 
>>>> Reiserfs
>>>> can do about it.
>>>>
>>>>
>>>>> What can I do.
>>>>
>>>>
>>>>
>>>>
>>>>
>>>> 1) Call whoever you get hardware support from.
>>>>
>>>> 2) Be ready to restore from backups.
>>>>
>>>> 3) If you didn't have RAID-5 (or similar) set up, or a good backup, 
>>>> consider
>>>> it a learning experience.
>>>>
>>>> If your data is important enough that you'll care if you lose it, 
>>>> you should take
>>>> steps to make sure you won't lose it... It's that simple.
>>>>
>>>> (Just for the record, if we have important info, it gets at least 
>>>> RAID5, a
>>>> backup to tape or other device, *and* a *second* backup off-site.  
>>>> And my shop
>>>> is far from the most paranoid about such things.)
>>>>
>>>
>>
>>
>>
> 

