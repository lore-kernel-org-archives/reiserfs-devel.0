From: Oleg Drokin <green@namesys.com>
Subject: Re: Problem with Kernel 2.4.19, reiser on sw-raid5 and rsync
Date: Wed, 5 Mar 2003 17:20:29 +0300
Message-ID: <20030305172029.A32305@namesys.com>
References: <833151992.20030305132356@edo.uni-dortmund.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13070-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <833151992.20030305132356@edo.uni-dortmund.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oliver Heering <Heering@edo.uni-dortmund.de>
Cc: reiserfs-list@namesys.com

Hello!

On Wed, Mar 05, 2003 at 01:23:56PM +0100, Oliver Heering wrote:

> we've got a big problem with one of our servers using Kernel 2.4.19
> (SuSE 8.1 standard kernel), rsync and reiserfs on a software-raid5
> array consisting of 6x75GB (= 375GB usable capacity) harddrives.

I suppose this is 2.4.19 shipped with SuSE? Is this the last version available from SuSE?
This is SuSE 8.1, I presume?
(and rpm -qa | grep k_i386 output please)

> --------------- snip ---------------
> kernel: kernel BUG at journal.c:592!
> kernel: invalid operand: 0000 2.4.19-4GB #1 Fri Sep 13 13:19:15 UTC 2002
> kernel: CPU:    0
> kernel: EIP:    0010:[joydev:__insmod_joydev_O/lib/modules/2.4.19-4GB/kernel/drivers/inp+-32654158/96]    Not tainted
> kernel: EIP:    0010:[<c1ddfcb2>]    Not tainted
> kernel: EFLAGS: 00010282
> kernel: eax: e2931fc8   ebx: 00000900   ecx: e28cb000   edx: 00001964
> kernel: esi: 00000001   edi: 012c8000   ebp: 00000000   esp: d1459c20
> kernel: ds: 0018   es: 0018   ss: 0018
> kernel: Process rsync (pid: 1098, stackpage=d1459000)
> kernel: Stack: 00000000 e28cb000 00001000 00008000 00000259 09008ccc 00001000 00000000
> kernel:        00000000 00000000 c1dc03a5 c1b66800 00000900 012c8000 00001000 00000001
> kernel:        d1459c78 00000000 00001000 00008000 c2de89c0 00000259 00000000 c1b66800
> kernel: Call Trace:    [joydev:__insmod_joydev_O/lib/modules/2.4.19-4GB/kernel/drivers/inp+-32783451/96] [joydev:__insmod_joydev_O/lib/modules/2.4.19-4GB/kernel/drivers/inp+-32783121/96] [joydev:__insmod_joydev_O/lib/modules/2.4.19-4GB/kernel/drivers/inp+-32782641/96] [joydev:__insmod_joydev_O/lib/modules/2.4.19-4GB/kernel/drivers/inp+-32781493/96] [joydev:__insmod_joydev_O/lib/modules/2.4.19-4GB/kernel/drivers/inp+-32750223/96]
> kernel: Call Trace:    [<c1dc03a5>] [<c1dc04ef>] [<c1dc06cf>] [<c1dc0b4b>] [<c1dc8571>]
> kernel:   [joydev:__insmod_joydev_O/lib/modules/2.4.19-4GB/kernel/drivers/inp+-32745617/96] [joydev:__insmod_joydev_O/lib/modules/2.4.19-4GB/kernel/drivers/inp+-32678239/96] [joydev:__insmod_joydev_O/lib/modules/2.4.19-4GB/kernel/drivers/inp+-32744544/96] [__block_prepare_write+399/800] [block_prepare_write+57/144] [joydev:__insmod_joydev_O/lib/modules/2.4.19-4GB/kernel/drivers/inp+-32751312/96]
> kernel:   [<c1dc976f>] [<c1dd9ea1>] [<c1dc9ba0>] [<c01480df>] [<c01489b9>] [<c1dc8130>]
> kernel:   [joydev:__insmod_joydev_O/lib/modules/2.4.19-4GB/kernel/drivers/inp+-32736026/96] [joydev:__insmod_joydev_O/lib/modules/2.4.19-4GB/kernel/drivers/inp+-32751312/96] [do_generic_file_write+963/1936] [generic_file_write+154/208] [joydev:__insmod_joydev_O/lib/modules/2.4.19-4GB/kernel/drivers/inp+-32731463/96] [sys_write+163/304]
> kernel:   [<c1dcbce6>] [<c1dc8130>] [<c01366b3>] [<c0136b1a>] [<c1dcceb9>] [<c0145523>]
> kernel:   [system_call+51/56]
> kernel:   [<c010907f>]
> kernel: Modules: [(reiserfs:<c1dc0060>:<c1def390>)]

The decoded output is just a mess.
You seem to need to restart klogd after reiserfs module was loaded, so that it will
find new module and it's symtab. (or even better: run dmesg | ksymoops immediately
after oops have happened). That info would be very useful.

Also what will pop up if you'd run reiserfsck on that device? Are there any weird errors?

> We're virtually out of ideas right now but if you take a look at...
> http://groups.google.com/groups?hl=en&lr=&ie=UTF-8&oe=utf-8&threadm=avuid5%242kgl%241%40FreeBSD.csie.NCTU.edu.tw&rnum=1&prev=/groups%3Fq%3Dsoftware%2Braid%2Breiserfs%2Bkernel%2Bpanic%26hl%3Den%26lr%3D%26ie%3DUTF-8%26oe%3Dutf-8%26selm%3Davuid5%25242kgl%25241%2540FreeBSD.csie.NCTU.edu.tw%26rnum%3D1
> ...there must be some other people who have the same problem.

Hm. This man never came to us, though.

> The last suspect I have is, that 2 of the 6 harddrivers are different
> models but with around the same (a bit more) capacity. Could this be
> the cause, too?

Not likely.

> Or are there any known bugs when using rsync in combination with
> reiserfs and software-raid5 ?

Not that I have heard of. I suppose you do not have power failures from time to time?

Bye,
    Oleg
