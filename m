From: Adrian Bunk <bunk@stusta.de>
Subject: Re: 2.6.19-rc3-git7: Oops on shutdown: do_remount_sb (reiserfs)
Date: Sat, 4 Nov 2006 07:57:08 +0100
Message-ID: <20061104065708.GQ13381@stusta.de>
References: <45469414.4090108@rtr.ca>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-30098-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <45469414.4090108@rtr.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Lord <lkml@rtr.ca>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, reiserfs-list@namesys.com

On Mon, Oct 30, 2006 at 07:08:52PM -0500, Mark Lord wrote:
> The system is a Core2duo with SATA drives, with a SLES10 install,
> and a linux-2.6.19-rc3-git7 kernel.  All I did was a fresh boot to
> the gdm prompt, and then selected "reboot" from the menu.
> 
> Just as it was closing up shop, an Oops appeared on the screen.
> I took a photo of it, and transcribed this portion (below).
> The photograph is available on request.

Is this reproducible and still present in the latest -git?

If yes, please send a photograph made from the latest -git.

> devpts unmounted
> sysfs unmounted
> BUG: unable to handle kernel paging request at virtual address 3a4e5355
> printing eip:
> c0177ebc
> *pde = 00000000
> Oops: 0000 [#1]
> SMP
> Modules linked in: cpufreq_ondemand cpufreq_userspace cpufreq_powersave 
> speedstep_centrino freq_table button battery ac dm_mod ahci edd fan thermal 
> processor
> CPU:    0
> EIP:    0060:[<c0177ebc>]       Not tainted VLI
> EFLAGS: 00010213   (2.6.19-rc3-git7-ml #7)
> EIP is at shrink_dcache_sb+0x3c/0x100
> ...
> Process umount (pid ... )
> ...
> Call Trace:
> [<c0167d69>] do_remount_sb+0x29/0x160
> [<c017d22e>] sys_umount+0x20e/0x220
> [<c017d259>] sys_oldumount+0x19/0x20
> [<c0102f4d>] sysenter_past_esp+0x56/0x8d
> [<b7f4e410>] 0xb7f4e410
> Code: e8 ca 6b 1e 00 a1 ...
> EIP: [<c0177ebc>] shrink_dcache_sb+0x3c/0x100 SS:ESP 0068:f68e3efc
> -

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

