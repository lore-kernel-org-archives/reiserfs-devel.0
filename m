From: "E. Gryaznova" <grev@namesys.com>
Subject: Re: reiser filesystem crashed
Date: Thu, 13 Nov 2003 21:15:34 +0300
Sender: grev
Message-ID: <3FB3CA46.3090C1EF@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16077-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

Hello,
could you please answer on the following questions :
1. what kernel version do you use?
2. what reiserfsprogs version du you use?
3. did you use fdisk for resizing /dev/hda6 ?

Thanks,
Lena

> Hi, friends:

> My copmputer has a hard disk with the following partition schema:


>        /dev/hda1               windows backup
>        /dev/hda2               windows xp ntfs

> /dev/hda3               win95 ext'd (LBA)
>        /dev/hda5               linux swap
>        /dev/hda6               linux  - resiserfs

> The linux partition crashed (my suspicions are after opening a 5MB pdf
file).
> Following are the messages given by reiserfsck:


> #reiserfs --check /dev/hda6
> Bad root block 4294967295

> #reiserfs --rebuild-tree /dev/hda6
> .....
> Pass 0:
> ##### Pass 0 #####
> Loading on-disk bitmap .. ok, 963801 blocks marqued used
> Skipping 8406 blocks (superblock, journal.....) 955395 blocks will be
read
> 0%                                                      left  955077,
318 /sec
> bread: Cannot read a block # 13236

> Aborted

> #reiserfsck --rebuild-sb /dev/hda6  ----> OK
> #reiserfs --rebuild-tree /dev/hda6    -------->  same error as above.


> The information in the linux partition is very important, so:
> - Is there any way to recover it, to rebuild to filesystem or
whatever?

> Any help would be appreciated.

> Thanks in advance.



