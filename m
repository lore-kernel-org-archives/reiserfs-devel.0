From: Arend Freije <afreije@inn.nl>
Subject: Re: RAID-1 and Reiser4 issue: umount hangs
Date: Wed, 31 May 2006 11:06:49 +0200
Message-ID: <447D5CA9.3080707@inn.nl>
References: <447B56C1.80608@inn.nl> <200605301553.34815.zam@namesys.com> <447C9AFA.90400@inn.nl> <200605311113.48131.zam@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28701-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200605311113.48131.zam@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alexander Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com, "E.Gryaznova" <grev@namesys.com>, Vladimir Saveliev <vs@namesys.com>, Hans Reiser <reiser@namesys.com>

Alexander Zarochentsev wrote:
> On Tuesday 30 May 2006 23:20, Arend Freije wrote:
>   
>> Alexander Zarochentsev wrote:
>>     
>>> Hello,
>>>
>>> On Tuesday 30 May 2006 00:17, Arend Freije wrote:
>>>       
>>>> Hi,
>>>>
>>>> I'm using Reiser4 for my filesystems on disk (/dev/sda) , and it
>>>> works just fine. Recently I bought a second disk (/dev/sdb) for
>>>> RAID-1 mirroring. With mdadm I created a degraded raid-1 array  on
>>>> /dev/md/0, devices missing,/dev/sdb1. After that I created a
>>>> Reiser4 filesystem on /dev/md/0 and mounted it at /mnt. Then I
>>>> copied the data from /dev/sda1 to /mnt.
>>>>         
>>> would it work better with "no_write_barrier" mount option?
>>>       
>> It would indeed. What's the purpose of this option?
>>     
>
> It disables write barrier support in reiser4 which may be buggy.  It is 
> not necessary that reiser4 code has a bug, but the elevator, md device 
> or disk driver code.
>   
Alexander,

You're probably right. I found several posts on the linux-kernel list
involving problems with write barrier support in combination with SATA
and ext3 . So I tried:

# mkfs -t ext3 /dev/md/0
# mount -o barrier=1 /dev/md/0 /mnt
# cp -a $src /mnt
# umount /mnt

And indeed, umount hangs now as well.
So it seems to be a linux-kernel issue after all...

If write-barrier support is a known problem, wouldn't it be better to
disable it in the Reiser4 driver by default, as in the ext3-driver ?

Kind Regards,

Arend Freije


