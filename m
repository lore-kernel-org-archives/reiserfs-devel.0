From: Laurynas Biveinis <Laurynas.Biveinis@mif.vu.lt>
Subject: Re: Partial data loss with reiserfs3
Date: Mon, 14 Feb 2005 18:38:29 +0200
Message-ID: <1108399109.4210d40511ea6@webmail.vu.lt>
References: <1108315756.420f8e6ce67b0@webmail.vu.lt> <200502141544.34513.vitaly@namesys.com> <1108392048.4210b87003405@webmail.vu.lt> <200502141921.58903.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200502141921.58903.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

Cituojant Vitaly Fertman <vitaly@namesys.com>:

> > [root@laurynas-pc ~]# mkfs -t reiserfs /dev/hda6
> 
> did you shrink ntfs under win and reboot?

NTFS was shrinked several reboots ago under Linux with
ntfsresize/fdisk.

> what happened between the last boot and mkfs? 

I do not remember well and .bash_history isn't very helpful there. It's
very likely that mkfs was the first thing after boot.

> did you run fdisk then? did you reboot after that fdisk run?

I'm not sure what does "then" mean? After "mkfs -t reiserfs /dev/hda6"?
No, I didn't run fdisk or reboot then - I copied data.

--
Thanks,
Laurynas

