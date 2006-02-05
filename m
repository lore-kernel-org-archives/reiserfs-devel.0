From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 grub patch
Date: Sat, 04 Feb 2006 18:53:25 -0800
Message-ID: <43E568A5.3080401@namesys.com>
References: <200602031237.06515.xxlucas@seznam.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28019-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200602031237.06515.xxlucas@seznam.cz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: luc <xxlucas@seznam.cz>
Cc: reiserfs-list@namesys.com, Vitaly Fertman <vetalf@inbox.ru>

Vitaly, lots of people are having trouble with the grub patch, please
investigate.  See later email about gcc version also.

Hans

luc wrote:

>Hi,
>
>i have a big trouble with the grub with reiser4 patch. Look here:
>
>./install.sh:
>
>grub> root (hd0,0)
> Filesystem type is ext2fs, partition type 0x83
>grub> setup (hd0)
> Checking if "/boot/grub/stage1" exists... yes
> Checking if "/boot/grub/stage2" exists... yes
> Checking if "/boot/grub/e2fs_stage1_5" exists... yes
> Running "embed /boot/grub/e2fs_stage1_5 (hd0)"...  15 sectors are 
>embedded.
>succeeded
> Running "install /boot/grub/stage1 (hd0) (hd0)1+15 p 
>(hd0,0)/boot/grub/stage /boot/grub/menu.lst"... failed
>                                                        should be 
>stage2  ^^^^^^
>
>
>without reiser4 patch works perfectly
>
>
>  
>

