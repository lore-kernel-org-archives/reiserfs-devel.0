From: David Nielsen <david@graveyard.dk>
Subject: Re: Formatted over NTFS
Date: Wed, 03 Mar 2004 23:52:44 +0000
Message-ID: <40466FCC.1050508@graveyard.dk>
References: <40463550.8050203@graveyard.dk> <40465235.90904@matchmail.com> <40465ADB.4020603@graveyard.dk> <40465D1C.60105@matchmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17059-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40465D1C.60105@matchmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mike Fedyk <mfedyk@matchmail.com>
Cc: reiserfs-list@namesys.com

Mike Fedyk wrote:

> David Nielsen wrote:
>
> [ David, please keep this on the list... ]
>
>> Mike Fedyk wrote:
>>
>>> David Nielsen wrote:
>>>
>>>> Hi..
>>>> i was installing gentoo the other day, and by mistake did a 
>>>> mkreiserfs /dev/hda1 instred of /dev/hdc1 :(
>>>>
>>>> /dev/hda1 was a NTFS file system with a lot of data that i dont wat 
>>>> to lose , is there any way to "unformat" the new reiserfs 
>>>> filesystem i made or any way to just restore the files on the disk ?
>>>
>>>
>>>
>>>
>>> mkreiserfs doesn't write a lot to the disk, so maybe you can just 
>>> mount it as ntfs and see what you can recover (unless mkreiserfs 
>>> wrote over your MBT file...)
>>>
>
> Try the userspace ntfs tools, or even windows >= NT
>
Ok........
Now it doesnt matter.....

I took it out and into another machine temporarily, but.. now the disk 
doesnt power up(on any of the machines)
Its an old disk so...

Shit, Shit, Shit...
Backup, Backup, Backup......

but thanks anyway.

David.
