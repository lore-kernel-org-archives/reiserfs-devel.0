From: Sebastian Hyrwall <sh@keff.org>
Subject: Re: Negative blocks in rebuild-tree
Date: Sun, 09 Jan 2011 03:09:25 +0100
Message-ID: <4D2918D5.2010503@keff.org>
References: <4D28674A.60603@keff.org> <4D290828.8050304@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4D290828.8050304@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Jeff Mahoney <jeffm@suse.com>, reiserfs-devel@vger.kernel.org

Hi

On 01/09/11 01:58, Edward Shishkin wrote:
> On 01/08/2011 02:31 PM, Sebastian Hyrwall wrote:
>> Hi
> 
> Hello.
> 
>>
>> I am getting a negative block-number with reiserfsck when doing
>> --rebuild-tree -S (or without -S). This causes a segmentation fault
>> later (pass 2) in the check because it tries to read a "non-existant
>> block". My rebuild takes 3 days and i didn't copy the stdout-info the
>> first time so I will post some more info as soon as it becomes available.
>>
>> Pass 0:
>> ####### Pass 0 #######
>> The whole partition (-710934672 blocks) is to be scanned
>> Skipping 117586 blocks (super block, journal, bitmaps)
> 
> 
> So you do have a ~16T partition. Correct?
> 

Disk /dev/mapper/a1: 14680.2 GB, 14680197689344 bytes
255 heads, 63 sectors/track, 1784765 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 524288 bytes / 6815744 bytes
Alignment offset: 520192 bytes
Disk identifier: 0x00000000


> 
>  -711052258 blocks
> 
> 
>> will be read
>>
>> Does anyone have any idea on how to fix this?
>>
>> On a 64-bit system.
> 
> 
> It looks like you have encountered an overflow/truncation fsck bug
> specific to giant volumes.
> 
> I would first ask Jeff: AFAIK he is planning to enable 16T files
> in reiserfs.
> Jeff, do you have any non-published fixups for such problems?
> 
> Thanks,
> Edward.
> 

If you need any more info like debugreiserfs or something let me know.
If not I will try to provide some more info as the fsck progresses,

####### Pass 0 #######
The whole partition (-710934672 blocks) is to be scanned
Skipping 117586 blocks (super block, journal, bitmaps) -711052258 blocks
will be read
0%....                                              left 2936300517,
16334 /sec


First being able to create the filesystem but then finding out later I
can't fsck it hurts :)

I tried going through the code looking for the possibly use of the wrong
data type but it's hard to debug when it takes ~3 days before hitting
the bug.

> 
>>
>> Sincerely,
>> Sebastian H
>> -- 
>> To unsubscribe from this list: send the line "unsubscribe
>> reiserfs-devel" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at http://vger.kernel.org/majordomo-info.html
> 

Sincerely,
Sebastian H
