From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: ReiserFS V3 and linux-kernel-2.6
Date: Fri, 11 Feb 2005 00:12:05 +0300
Message-ID: <20050210211205.GQ7482@backtop.namesys.com>
References: <139119350.20050209110514@kgpa.ru> <20050209144446.GK7482@backtop.namesys.com> <8510493009.20050209170924@kgpa.ru> <20050209155626.GL7482@backtop.namesys.com> <1318959983.20050210165729@kgpa.ru>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1318959983.20050210165729@kgpa.ru>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Oleg O. Ossovitskii" <oleg@kgpa.ru>
Cc: ReiserFS-List <reiserfs-list@namesys.com>

On Thu, Feb 10, 2005 at 04:57:29PM +0200, Oleg O. Ossovitskii wrote:
> Hello, Alex!
> 
> Wednesday, February 9, 2005, 5:56:26 PM, you wrote:
> 
> AZ> 2) check that the block device driver is loaded successfully
> AZ>    and partition table is read properly
> AZ>    (look at kernel boot messages)
> 
> You're rigth! This is reason why I can't boot kernel 2.6.10
> 
> I have next HDD & DVD:
> hda - IDE NEC DVD-RW ND-2500A
> hdb - IDE Western Digitall (old 850 GB drive)
> hdc - SATA (in legacy mode) Maxtor 80 GB (here Linux is placed)
> 
> I can boot from hdc Windows 2000, qnx4, linux-2.4.27, but when I try to boot to
> linux-2.6.10 I got something like
> 
> ide: 0x170-0x1F0 is busy
> 
> and so on... I can't give full error message, until I receive it via
> serial console
> 
> Sorry, it's not a ReiderFS bug, but I don't understand how grub-0.92
> can take kernel from /dev/hdc2 and why kernel can't read /dev/hdc8???
> 
> May be it's a wrong kernel config, or wrong kernel option?

I would turn SATA (CONFIG_BLK_DEV_IDE_SATA) support off.

> 
> --- grub's menu.lst ---
> ....
> # For booting GNU/Linux
> title  GNU/Linux-2.6.x
> kernel (hd0,1)/vmlinuz root=/dev/hdc8 rw devfs=mount
> 
> title  GNU/Linux-2.4.x
> kernel (hd0,1)/vmlinuz-2.4 root=/dev/hdc8 rw devfs=mount
> ....
> -----------------------
> 
> My harware list:
> CPU: Pentium4 2.80 GHz
> RAM: 512MB
> MB:  ASUS P4P800
> 
> 
> Best regards, Oleg O. Ossovitskii
> chief programmer, KGPA Ltd., West Russia
> tel: +7(0112)46-23-40, fax: +7(0112)43-64-96, cell: +79022193956
> mailto:oleg@kgpa.ru, icq# 33366588


-- 
Alex.
