From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: ReiserFS V3 and linux-kernel-2.6
Date: Thu, 10 Feb 2005 11:01:22 +0300
Message-ID: <20050210080122.GO7482@backtop.namesys.com>
References: <139119350.20050209110514@kgpa.ru> <20050209144446.GK7482@backtop.namesys.com> <8510493009.20050209170924@kgpa.ru> <20050209155626.GL7482@backtop.namesys.com> <749879259.20050210083605@kgpa.ru>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <749879259.20050210083605@kgpa.ru>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Oleg O. Ossovitskii" <oleg@kgpa.ru>
Cc: ReiserFS-List <reiserfs-list@namesys.com>

On Thu, Feb 10, 2005 at 08:36:05AM +0200, Oleg O. Ossovitskii wrote:
> Hello, Alex!
> 
> Wednesday, February 9, 2005, 5:56:26 PM, you wrote:
> 
> >> >>   VFS: Cannot open root device "hdc8" or unknown-block(0,0)
> >> >>   Please append a correct "root=" boot option
> >> >>   Kernel panic - not syncing: VFS: Unable to mount root fs on
> >> >>   unknown-block(0,0)
> >>
> >> AZ> please make sure that the rootfs block device driver (IDE disk) was compiled
> >> AZ> into the kernel.
> 
> yes it compiled in the kernel
> 
> AZ> can you try to following?
> 
> AZ> 1) boot w/o devfs
> 
> No, my /dev directory is empty without devfs. It's mountpoint only
> 
> AZ> 2) check that the block device driver is loaded successfully
> AZ>    and partition table is read properly
> AZ>    (look at kernel boot messages)
> 
> As I can see (messages disappears too fast and Ctrl-PgUp don't work)
> ide driver loaded, but I'm not sure. How can I see kernel messages
> after kernel panic?

1. serial console.
2. netconsole  (linux-src/Documentation/networking/netconsole.txt)

-- 
Alex.
