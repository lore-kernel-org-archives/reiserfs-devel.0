From: PFC <lists@peufeu.com>
Subject: Re: Relocating files for faster boot/start-up on reiser(fs/4)
Date: Mon, 18 Sep 2006 11:36:44 +0200
Message-ID: <op.tf2ibi00cigqcu@apollo13>
References: <200609131451.42474.lists@qutek.net> <4509D65D.7040908@slaphack.com> <54E99998-88D2-4E0D-8970-1C3DA365DBE0@smartgames.ca> <200609151520.39826.lists@qutek.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29921-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200609151520.39826.lists@qutek.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: reiserfs-list@namesys.com


	Windows already does this.

	It has a service which monitors filesystem usage, and writes data to disk  
; the defragmenter uses this data to lay the files on disk so that boot is  
very fast.

	However think it optimizes only the time to the login screen ; so windows  
boot is extremely fast ; of course, once you have logged in, you have to  
wait forever until all the crap system tray apps launch themselves and eat  
all your RAM...

	My own repacker is very simple, and it handles any filesystem !

- boot from Kanotix CD
- tar cv /mnt/my_disk | lzop -c | ssh -c blowfish other_machine "cat  
>backup.tar.lzo"
- umount, mkfs, mount
- ssh -c blowfish other_machine "cat backup.tar.lzo" | lzop -cd | tar xv

	You can also use an USB disk, or other disks in the machine. The effects  
are pretty visible.
	I do the first part often to make a full disk backup to a USB harddrive.

	Anyway, IMHO the best way to have a super responsive system would be :

Have a daemon which monitors which files, or parts of files, are read, and  
in what context :

- boot to fully loaded KDE/Gnome
- launching an application

You already have this apparently...

The repacker would then use this information to lay files on disk (just  
like windows does).

Then, the daemon would trigger readahead, when booting or detecting the  
launch of an application, and read everything in (which would be a nice  
sequential read)...

