From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfsck --rebuild-tree Aborted
Date: Thu, 30 Sep 2004 12:36:02 +0400
Message-ID: <200409301236.02219.vitaly@namesys.com>
References: <20040930092442.40ee8189@xor.ttknn.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21966-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040930092442.40ee8189@xor.ttknn.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Molchanov Alexander <a.molchanov@transtelecom-nn.ru>, reiserfs-list@namesys.com
Cc: noc@ttknn.net

On Thursday 30 September 2004 09:24, Molchanov Alexander wrote:
> Hello.

Hello,

> I have a big trouble.
>
>
> Yesterday diskspace on a server of my company the place was terminated.
> After reboot and reiserfsck --fix-fixable has corrected not all mistakes.
> After that the server has worked a little more (I have removed some files
> for clearing a place) and I have noticed, that it is impossible to get
> access to some files and even to remove. After reloading with LiveCD and
> attempts --rebuild-tree it has turned out log:
>
> @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
>
> # reiserfsck --rebuild-tree /dev/sda2
> reiserfsck 3.6.17 (2003 www.namesys.com)

[skipped]

> Pass 1 (will try to insert 846943 leaves):
> Looking for allocable blocks .. finished
> 0%....20%....40%....60%....80%....100%                        left 0, 2785
> /sec Flushing..finished
>         846943 leaves read
>                 33146 inserted
>                 813797 not inserted

are you sure that you have not copied a reiserfs to a file on this 
reiserfs and not left it there in not encrypted/compressed form? 
or probably you unpacked reiserfs metadata (debugreiserfs -u, 
or the program unpack in older version) to a file again w/out 
encryption/compression?
the problem that reiserfs does not allow to distinguish the host fs 
metadata from the metadata that are kept in a file on this fs. and 
at least xor encryption is needed for such a file.

> Pass 2:
> 0%....20%....40%..                                       left 818621, 4280
> /sec Not enough allocable blocks, checking bitmap...there are 0 allocable
> blocks, btw
>
> @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
>
> I have undertaken some attempts and received the same result. On a hard
> disk of badblocks is not present (I has checked up the utility dd and
> dd_rescue - on other partition the image of a disk was copied). Here has
> laid out result of work "debugreiserfs -p /dev/sda2 > sda2.1.dump; bzip2 -9
> sda2.1.dump": http://public.nnov.net/tmp/ibm2/sda2.1.dump.bz2
>
> Kernel is	2.4.25-gentoo-r2 on Hard drive
> and		2.4.26-gentoo-r6 on LiveCD
>
> /dev/sda - is SCSI hardware Raid5 massive
>
> Can you help me rebuild partition ? :(
> If it is required it is possible to remove (for clearing a diskspace):
> /var/lib/oops/ - here there is a file in 512Mb
> 	and directories:
> /bin
> /lib
> /sbin
> /opt
> /usr, excluding "/usr/local" !

usually this problem is solved in one of the following ways:
if you do not need the next partition then you can 
- zero it first with 
	dd if=/dev/zero of=/dev/sda3
- repartition sda with fdisk, 
- then run
	reiserfsck --rebuild-sb /dev/sda2
to enlarge the fs on the enlarged partition and 
- finally re-run tree rebuilding.

Another way is to copy the problem partition to another larger one
and repeat the reiserfsck steps above. Or probably to a file on another 
partition, enlarge the file and reiserfsck the file (--rebuild-sb, and then 
--rebuild-tree). this is more relable way as the original partition is
not changed and you can easily repeat an attempt on a larger partition.

I am looking on your metadata now to figure out what partition size 
is enough and what was a reason of this problem.

-- 
Thanks,
Vitaly Fertman

