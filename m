From: "Marius Reiner" <news.mr@gmx.net>
Subject: Re: badblocks blocksize setting
Date: Sat, 15 Mar 2003 12:38:23 +0100
Message-ID: <001801c2eae7$63932d90$55c7a8c0@mariusw2k>
References: <006b01c2ea87$20046a40$55c7a8c0@mariusw2k> <20030315111600.A24872@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13276-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> Hello!
>
> On Sat, Mar 15, 2003 at 01:09:19AM +0100, Marius Reiner wrote:
>
> > not really a reiserfs issue:
> > When following the FAQ everything is fine, I set blocksize zu 4096 as
> > debugreiserfs told me, and don't get any bad blocks.
>
> Good.
>
> > Nevertheless I'm a bit concerned about the ones, badblocks reports, when
> > being invoked without the -b option. How does this happen?
>
> Can you please show the command line and the resulting output with
badblocks?
> Also what is in dmesg output after such a run?

# badblocks /dev/hdc8 -b 4096
# dmesg -c
invalidate: busy buffer
# badblocks /dev/hdc8
979932
# dmesg
invalidate: busy buffer
attempt to access beyond end of device
16:08: rw=0, want=979936, limit=979933
attempt to access beyond end of device
16:08: rw=0, want=979936, limit=979933

So using the -b option has the side-effect of not accessing the partition
beyond its end? I'm running a vanilla 2.4.20 kernel, actually it's the
kernels task to refuse those accesses, isn't it?
However, what I'm missing in the FAQ, is a short note about _why_ one should
use the -b option, so no worries arise when getting bad blocks without it.
Thanks
Marius

