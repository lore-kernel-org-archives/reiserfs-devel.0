From: Eric Whiting <ewhiting@amis.com>
Subject: Re: Linux 2.4 -> 2.6 migration
Date: Fri, 07 Nov 2003 08:29:30 -0700
Sender: ewhiting@amis.com
Message-ID: <3FABBA5A.EFE7B017@amis.com>
References: <m3ptg42t8l.fsf@toyland.sauerland.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16006-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sebastian Kaps <seb-keyword-reiserfs.0462a0@toyland.sauerland.de>
Cc: reiserfs-list@namesys.com

I was running 2.6.0test6 on my desktop. 

I installed suse9 and ran their 2.4.21-99 kernel and had a lot of reiserfs
corruption on a existing partition. I also had to --rebuild-tree on that
parition. I'm runnning 2.6.0-test9 right now.

2.6->2.4 was not a happy thing for my box..

I thought it was something in how I did the upgrade. But maybe something else is
happening here... Somewhere in my logs I see this:

eric




Nov  4 15:32:13 windriver kernel: vs-6030: check_internal_block_head: invalid
item number level=2, nr_items=
170, free_space=65520 rdkey kernel BUG at prints.c:334!
Nov  4 15:32:13 windriver kernel: invalid operand: 0000 2.4.21-99-athlon #1 Wed
Sep 24 13:34:32 UTC 2003
Nov  4 15:32:13 windriver kernel: CPU:    0
Nov  4 15:32:13 windriver kernel: EIP:   
0010:[st:__insmod_st_O/lib/modules/2.4.21-99-athlon/kernel/drivers
/s+4275657781/96]    Not tainted
Nov  4 15:32:13 windriver kernel: EIP:    0010:[<c1995c35>]    Not tainted
Nov  4 15:32:13 windriver kernel: EFLAGS: 00010292
Nov  4 15:32:13 windriver kernel: eax: 00000069   ebx: 00000000   ecx:
c037e4d0   edx: 00000001
Nov  4 15:32:13 windriver kernel: esi: cc018000   edi: c49d0b40   ebp:
cc018de0   esp: cd9f9a14
Nov  4 15:32:13 windriver kernel: ds: 0018   es: 0018   ss: 0018
Nov  4 15:32:13 windriver kernel: Process rm (pid: 2382, stackpage=cd9f9000)
Nov  4 15:32:13 windriver kernel: Stack: c19b2f1a c19b3960 00000000 000000aa
c199696e 00000000 c19afcc0 c49d
0b40
Nov  4 15:32:13 windriver kernel:        00000240 cd957188 cc018ab8 c199a2b3
c49d0b40 c192e000 c49d0b40 cc01
8000
Nov  4 15:32:13 windriver kernel:        cd957000 00000093 00000093 c49d0b40
00000018 c497be40 cd9f9adc 0000
0000
Nov  4 15:32:13 windriver kernel: Call Trace:   
[st:__insmod_st_O/lib/modules/2.4.21-99-athlon/kernel/drive
rs/s+4275777306/96]
[st:__insmod_st_O/lib/modules/2.4.21-99-athlon/kernel/drivers/s+4275779936/96]
[st:__ins
mod_st_O/lib/modules/2.4.21-99-athlon/kernel/drivers/s+4275661166/96]
[st:__insmod_st_O/lib/modules/2.4.21-9
9-athlon/kernel/drivers/s+4275764416/96]
[st:__insmod_st_O/lib/modules/2.4.21-99-athlon/kernel/drivers/s+427
5675827/96]
Nov  4 15:32:13 windriver kernel: Call Trace:    [<c19b2f1a>] [<c19b3960>]
[<c199696e>] [<c19afcc0>] [<c199a
2b3>]
Nov  4 15:32:13 windriver kernel:  
[st:__insmod_st_O/lib/modules/2.4.21-99-athlon/kernel/drivers/s+42756762
06/96]
[st:__insmod_st_O/lib/modules/2.4.21-99-athlon/kernel/drivers/s+4275676775/96]
[st:__insmod_st_O/lib/
modules/2.4.21-99-athlon/kernel/drivers/s+4275677974/96]
[st:__insmod_st_O/lib/modules/2.4.21-99-athlon/kern
el/drivers/s+4275680270/96]
[st:__insmod_st_O/lib/modules/2.4.21-99-athlon/kernel/drivers/s+4275634609/96] [
st:__insmod_st_O/lib/modules/2.4.21-99-athlon/kernel/drivers/s+4275639202/96]
Nov  4 15:32:13 windriver kernel:   [<c199a42e>] [<c199a667>] [<c199ab16>]
[<c199b40e>] [<c19901b1>] [<c1991
3a2>]


Sebastian Kaps wrote:
> 
> Hi!
> 
> Is there something concerning ReiserFS I should know when migrating from
> Linux 2.4 to Linux 2.6?
> 
> I'm asking because a few days ago I downloaded and compiled 2.6.0-test9
> just for curiosity. It booted fine and I went back to my "standard"
> kernel, which was 2.4.23-pre5 at that time. Right after booting the
> 2.4.x kernel, I got lots of the following messages in my logs:
> ,----
> | kernel: ide2(33,3):vs-4080: reiserfs_free_block: free_block (2103:463529)[dev:blocknr]: bit already cleared
> `----
> The block number always differed. Gladly, "reiserfsck --rebuild-tree"
> helped to cure that, but there were lots of unusable files after that
> (e.g. parts of files overwritten with parts of other files).
> 
> Is this suppose to happen? What caused this error?
> 
> Another thing: I had to "hard reboot" my system a few times in the last
> few months. I also experienced that sometimes parts of files were
> overwritten with 0x00s or parts of other files. Can someone explain to
> me how this can happen?
> 
> --
> Ciao, Sebastian
