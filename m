From: Ookhoi <ookhoi@humilis.net>
Subject: Re: rfs4, 2.5.53: jnode_flush failed with err = -12
Date: Mon, 6 Jan 2003 12:55:01 +0100
Message-ID: <20030106125500.B19841@humilis>
References: <20030106122217.A19841@humilis> <20030106143058.A9262@namesys.com>
Reply-To: ookhoi@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12280-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030106143058.A9262@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: Ookhoi <ookhoi@humilis.net>, reiserfs-list@namesys.com

Oleg Drokin wrote (ao):
> On Mon, Jan 06, 2003 at 12:22:17PM +0100, Ookhoi wrote:
> 
> > With kernel 2.5.53 and reiserfs4 snapshot of 24 Dec 2002 I get the
> > following error when I try to untar a file on it.
> > jnode_flush failed with err = -12
> 
> Errno 12 means "Out of Memory".
> How much RAM do you have on your test box?

512MB.
I don't have swap space. Could that be a problem?
The ramdisk of the bootfloppy is only 10MB unzipped.

sysrq-m says:
Mem-info:
DMA per-cpu:
cpu 0 hot: low 2, high 6, batch 1
cpu 0 cold: low 0, high 2, batch 1
Normal per-cpu:
cpu 0 hot: low 32, high 96, batch 16
cpu 0 cold: low 0, high 32, batch 16
HighMem per-cpu: empty

Free pages:      442720kB (0kB HighMem)
Active:3155 inactive:13374 dirty:12963 writeback:0 free:110680
DMA free:14352kB min:128kB low:256kB high:384kB active:0kB inactive:0kB
Normal free:428368kB min:1020kB low:2040kB high:3060kB active:12620kB inactive:53496kB
HighMem free:0kB min:0kB low:0kB high:0kB active:0kB inactive:0kB
DMA: 2*4kB 1*8kB 2*16kB 3*32kB 2*64kB 4*128kB 3*256kB 1*512kB 2*1024kB 1*2048kB 2*4096kB = 14352kB
HighMem: empty
Swap cache: add 0, delete 0, find 0/0, race 0+0
Free swap:            0kB
131072 pages of RAM
0 pages of HIGHMEM
1794 reserved pages
14081 pages shared
0 pages swap cached


> Currently reiser4 is somewhat memory-hungry and the logic that deals
> with sort-memory situations is not implemented nicely yet.
> 
> Thank you for trying out reiser4 (and for reporting problems of course).

Very welcome.
