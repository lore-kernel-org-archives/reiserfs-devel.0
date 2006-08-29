From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiser4 und LZO compression
Date: Tue, 29 Aug 2006 10:56:59 -0700
Message-ID: <44F47FEB.9060005@namesys.com>
References: <20060827003426.GB5204@martell.zuzino.mipt.ru> <44F322A6.9020200@namesys.com> <20060828173721.GA11332@hello-penguin.com> <44F332D6.6040209@namesys.com> <1156801705.2969.6.camel@nigel.suspend2.net> <20060829045937.GA9181@localhost.hsdv.com> <op.te1sixuycigqcu@apollo13> <20060829143814.GA21868@hello-penguin.com> <op.te1yjbp7cigqcu@apollo13>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29738-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <op.te1yjbp7cigqcu@apollo13>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: PFC <lists@peufeu.com>
Cc: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

PFC, thanks for giving us some real data.  May I post it to the lkml thread?

In essence, LZO wins the benchmarks, and the code is hard to read.  I
guess I have to go with LZO, and encourage people to take a stab at
dethroning it.

Hans

PFC wrote:
>
>     I have made a little openoffice spreadsheet with the results.
>     You can have fun entering stuff and seeing the results.
>
> http://peufeu.free.fr/compression.ods
>
>     Basically, a laptop having the same processor as my PC and a
> crummy 15 MB/s drive (like most laptop drives) will get a 2.5x speedup
> using lzf, while using 40% CPU for compression and 15% CPU for
> decompression. I'd say it's a clear, huuuuge win.
>
>     A desktop computer with a modern IDE drive doing 50 MB/s will
> still get nice speedups (1.8x on write, 2.5x on read) but of course,
> more CPU will be used because of the higher throughput. In this case
> it is CPU limited on compression and disk limited on decompression.
> However soon everyone will have dual core monsters so...
>
>     A big ass RAID will not get much benefit unless :
>     - the buffer cache stores compressed pages, so compression
> virtually doubles the RAM cache
>     - or the CPU is really fast
>     - or you put one of these neat FPGA modules in a free Opteron
> socket and upload a soft-hardware LZF in it with a few gigabytes/s
> throughput
Or you look the sysadmin in the eyes, and say, your file servers have
more out of disk space problems than load problems, yes?
>
>     ...
>
>

