From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: reiserfsck aborts when rebuilding filesystem
 tree
Date: Sat, 14 Sep 2002 00:51:30 +0200
Message-ID: <3D826BF2.3010307@mb.tu-ilmenau.de>
References: <87admlk2ri.fsf@zealot.fluidsignal.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11440-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Luis Bustamante <luferbu@fluidsignal.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 09/13/2002 11:17 PM, Luis Bustamante wrote:
> Hi list,
> 
> I got my partition table deleted, but I knew the exact size of each
> partition, so I created again the table. But I was unable to mount one

Hi Luis!

Did you reboot after recreating your partition table?! If you knew the 
exact values for the meant partitions and the table parameters there 
should be no problem later after reboot (I only worked with Linux fdisk 
for exactly the same purposes some months ago).

I had lost some filesystems in the beginning of my linux&reiserfs 
experience until I found that "remarkable advantage of rebooting" ;-) 
(before reiserfs-team or fdisk included that hint it into their docs 
and/or program output).


If that doesn't apply to you, I hope the reiserfs guys have more help 
for you based on your metadata file -- more than/except to 
http://www.reiserfs.org/support.html (user error?).

Good luck,

Manuel


> ReiserFS partition (/home duh!), I got the error "read_super_block:
> can't find a reiserfs file system", so I rebuilded the superblock with
> --rebuild-sb option without problems. After that I'm trying to rebuild
> the entire filesystem tree using:
> reiserfsck --logfile rebuild.log --rebuild-tree /dev/hda8
> but it aborts with the message "No reiserfs metadata found". I'm able to
> dump the metadata with the command: 
> debugreiserfs -p /dev/hda8 |gzip -c > metadata.gz
> and it's about 33Mb compressed. Any ideas why I can't rebuild the
> filesystem tree? it seems metadata is still there, if you want I can
> put the dump of debugreiserfs somewhere so you can have a look. I'm
> using reiserfsprogs 3.6.3 (default Debian unstable package) and kernel
> 2.4.18.
> 
> Cheers,
> 



