From: Bas van Schaik <bas@tuxes.nl>
Subject: Re: Problems with "--rebuild-tree" on network (ENBD) storage
Date: Fri, 06 Oct 2006 15:10:45 +0200
Message-ID: <452655D5.7090009@tuxes.nl>
References: <4524BD36.1090002@tuxes.nl> <200610060223.23700.vs@namesys.com> <4525893C.1060405@tuxes.nl> <200610061639.21377.vs@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30014-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200610061639.21377.vs@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: ReiserFS list <reiserfs-list@namesys.com>

Hi Vladimir,
>>> ok, may I ask you to run badblocks on that device? reiserfsck wants to be able to read and write filesystem device.
>>> badblocks will show us whether your device is in good shape. 
>>>       
>> Of course you may ask me this, but I really don't think it's relevant.
>> ReiserFS is on top of (in this specific order) CryptoLoop, LVM, RAID5
>> and ENBD. If there are bad blocks on one of the 12 (!) disks, then one
>> of my storage servers in the ENBD-cluster would report a bunch of I/O
>> errors, RAID5 would drop the device and ReiserFS won't even notice that
>> a hard drive failed.
>> Furthermore, every RAID5 device has had a resync since the filesystem
>> resize operation, which implies that every bit has been checked at least
>> once.
>>
>> I think the problem lies within the way reiserfsck reads and writes to
>> the underlying block device. Maybe reiserfsck isn't opening the device
>> in direct I/O (O_DIRECT) mode? 
>>     
> Yes, it does not. But why would it have to?
>
>   
>> I think it should, because it's safer, 
>> though slower. Maybe O_DIRECT can be set optionally on (or off) using a
>> commandline switch?
>>
>>     
> Maybe O_DIRECT should be used, I do not argue. But there is nothing wrong in not using O_DIRECT.
> Why would user land application make a computer unusable?
> reiserfsck uses standard libc's low level i/o functions to read and write a device, it also analyses and modify read data before writing them back.
> The worst thing reiserfsck can do is 100% CPU consumption. But that also should not hurt a system.
>
> I hope you understand what I mean: if user land application makes a box unusable - something is wrong in kernel.
> I have never dealt with setup like yours. There are so many layers, why there can not be any errors?
>   
That's true, of course. But there's (at least) one place in the kernel
where userland touches kernel space: buffering. In my case, I think
reiserfsck is causing starvation of my TCP buffers, because it doesn't
use direct I/O but buffered I/O. Of course, this is a normal (and maybe
wise) thing to do when the bottom layer is ATA or SATA (or something
like that), but in my case there's a network somewhere between
reiserfsck and ATA/SATA. So, I don't expect reiserfsck to use direct I/O
by default, but it would be a nice feature for me (and the few others
with the same problem?) if direct I/O can be enabled by a commandline
switch.

> Can you dd_rescue your filesystem to a spare device which has less underlaying layers (linear raid or oven plain hard disk)
> and try reiserfsck --rebuild-tree oin it?
I'm sorry, the system is built upon 12 harddrives, with a total of more
than 3TB of disk space. I don't have that amount of drives available for
creating a backup!

Thanks for you thoughts,

  -- Bas

