From: Mike Fedyk <mfedyk@matchmail.com>
Subject: Re: Formatted over NTFS
Date: Wed, 03 Mar 2004 13:46:29 -0800
Message-ID: <40465235.90904@matchmail.com>
References: <40463550.8050203@graveyard.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17053-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40463550.8050203@graveyard.dk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Nielsen <david@graveyard.dk>
Cc: reiserfs-list@namesys.com

David Nielsen wrote:
> Hi..
> i was installing gentoo the other day, and by mistake did a mkreiserfs 
> /dev/hda1 instred of /dev/hdc1 :(
> 
> /dev/hda1 was a NTFS file system with a lot of data that i dont wat to 
> lose , is there any way to "unformat" the new reiserfs filesystem i made 
> or any way to just restore the files on the disk ?

mkreiserfs doesn't write a lot to the disk, so maybe you can just mount 
it as ntfs and see what you can recover (unless mkreiserfs wrote over 
your MBT file...)
