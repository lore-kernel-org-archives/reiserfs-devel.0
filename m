From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: ReiserFS V3 and linux-kernel-2.6
Date: Wed, 9 Feb 2005 17:44:46 +0300
Message-ID: <20050209144446.GK7482@backtop.namesys.com>
References: <139119350.20050209110514@kgpa.ru>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <139119350.20050209110514@kgpa.ru>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Oleg O. Ossovitskii" <oleg@kgpa.ru>
Cc: ReiserFS-List <reiserfs-list@namesys.com>

On Wed, Feb 09, 2005 at 11:05:14AM +0200, Oleg O. Ossovitskii wrote:
> Hello!
> 
> 
> I run self compiled kernel 2.4.27 w/devfs and want to upgrade to
> 2.6.10 w/devfs. All kernels without using initrd
> 
> /dev/hdc2 - /boot - ext2
> /dev/hdc8 - /     - ReiserFS V3
> 
> gcc 3.4.3, modultils-2.4.21, glibc-2.3.4
> 
> I installed
>   module-init-tools-3.1.tar.bz2
>   sysfsutils-1.1.0.tar.bz2
>   hotplug-2004_09_23.tar.bz2
>   udev-051
> 
>   and all that I found in Changes from kernel-2.6.10
> 
>   In the grub config i have:
> 
>   --------------------------------
>   # For booting GNU/Linux
>   title  GNU/Linux-2.6.x
>   kernel (hd0,1)/vmlinuz root=/dev/hdc8 rw devfs=mount
> 
>   title  GNU/Linux-2.4.x
>   kernel (hd0,1)/vmlinuz-2.4 root=/dev/hdc8 rw devfs=mount
>  ----------------------------------
> 
>   I can boot into 2.4.x kernel, but when I try to boot to 2.6.10
>   kernel I get error message & kernel panic:
> 
> 
>   VFS: Cannot open root device "hdc8" or unknown-block(0,0)
>   Please append a correct "root=" boot option
>   Kernel panic - not syncing: VFS: Unable to mount root fs on
>   unknown-block(0,0)

please make sure that the rootfs block device driver (IDE disk) was compiled
into the kernel.  

-- 
Alex.
