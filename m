From: Ookhoi <ookhoi@humilis.net>
Subject: Re: mkreiserfs -s 1024 makes unmountable partitions
Date: Mon, 27 Jan 2003 05:49:04 +0100
Message-ID: <20030127054903.D976@humilis>
References: <20030118080941.B5575@humilis> <20030118115142.B21932@namesys.com> <20030117221535.GA945@Kadath> <20030118080941.B5575@humilis> <20030118115724.GA946@Kadath> <20030121213336.GA6756@hell.mine.nu> <20030122065712.D5575@humilis> <20030122100342.GA14100@hell.mine.nu> <20030124222823.GA15643@hell.mine.nu> <20030126181816.GA1274@Kadath>
Reply-To: ookhoi@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12492-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030126181816.GA1274@Kadath>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Francois-Rene Rideau <fare@tunes.org>
Cc: reiserfs-list@namesys.com

Francois-Rene Rideau wrote (ao):
> Hi! No hard disk crash today (I'm just disabling the DMA )-" )
> However, I've tried to make small reiserfs partitions,
> and was annoyed at the journal taking a significant size of the disk:
> 32MB is 50% of my 64MB /boot partition, and 40% of the whole
> of my server's 80MB harddisk.

I would not make more than one partition on a 80MB harddisk.

When I cleaned my room I found an old IBM 386 with a 150MB harddisk and
6MB ram. I think I put ext2 on it as it has less cpu overhead. It will
be a terminal anyway so I don't care about filechecks (a pitty I won't
be able to use a ramdisk).

Yours might be old too. Maybe ext2 is a better option?
(Don't worry, I have reiserfs on all my other systems ;-)

> I saw that mkreiserfs had an option -s to select the size of the journal,
> and tried to use it to make a 4MB journal:
> 	mkreiserfs -s 1024 /dev/hdc1
> However, whereas mkreiserfs didn't complain, the resulting partition
> was unmountable by linux. In the syslogs, the kernel complains:
> read_super_block: can't find a reiserfs filesystem on (dev 16:01, block 128, size 512)
> read_super_block: can't find a reiserfs filesystem on (dev 16:01, block 16, size 512)
> 
> I there a way to make a reiserfs partition with a small journal?
> 32MB is really a waste, on some partitions. Would a small kernel
> patch do it? In any case, I think that it is a bug that mkreiserfs
> doesn't check the consistency of its parameters with what the kernel
> is able to handle.

According to the manpage it should work:
-s | --journal-size N
 N is size of journal in blocks. When journal is to be on a separate
 device - its size defaults to number of blocks that device has. When
 journal is to be on a host device - its size defaults 8193 and maximal
 possible value is 32749 (for blocksize 4k). Minimun is 513 for both
 cases.

I've played with it a bit. It seems it never can mount if I did
mkreiserfs with the -s option (1024, 2048, 8193 (default), 10240). I can
if I mkreiserfs without -s (or others).

> PS: I'm using debian's reiserfsprogs 1:3.6.4-2 and linux kernel 2.4.20.

reiserfsprogs 3.6.5-pre1 and 2.4.18-rc4
