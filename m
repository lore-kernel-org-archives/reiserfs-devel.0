From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: ReiserFS V3 and linux-kernel-2.6
Date: Wed, 9 Feb 2005 18:56:26 +0300
Message-ID: <20050209155626.GL7482@backtop.namesys.com>
References: <139119350.20050209110514@kgpa.ru> <20050209144446.GK7482@backtop.namesys.com> <8510493009.20050209170924@kgpa.ru>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <8510493009.20050209170924@kgpa.ru>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Oleg O. Ossovitskii" <oleg@kgpa.ru>
Cc: ReiserFS-List <reiserfs-list@namesys.com>

On Wed, Feb 09, 2005 at 05:09:24PM +0200, Oleg O. Ossovitskii wrote:
> Hello, Alex!
> 
> Wednesday, February 9, 2005, 4:44:46 PM, you wrote:
> 
> >>
> >>   --------------------------------
> >>   # For booting GNU/Linux
> >>   title  GNU/Linux-2.6.x
> >>   kernel (hd0,1)/vmlinuz root=/dev/hdc8 rw devfs=mount
> >>
> >>   title  GNU/Linux-2.4.x
> >>   kernel (hd0,1)/vmlinuz-2.4 root=/dev/hdc8 rw devfs=mount
> >>  ----------------------------------
> >>
> >>   I can boot into 2.4.x kernel, but when I try to boot to 2.6.10
> >>   kernel I get error message & kernel panic:
> >>
> >>
> >>   VFS: Cannot open root device "hdc8" or unknown-block(0,0)
> >>   Please append a correct "root=" boot option
> >>   Kernel panic - not syncing: VFS: Unable to mount root fs on
> >>   unknown-block(0,0)
> 
> AZ> please make sure that the rootfs block device driver (IDE disk) was compiled
> AZ> into the kernel. 

can you try to following?

1) boot w/o devfs
2) check that the block device driver is loaded successfully 
   and partition table is read properly
   (look at kernel boot messages)

btw, I have no troubles switching my system between 2.4.x and 2.6.x

-- 
Alex.
