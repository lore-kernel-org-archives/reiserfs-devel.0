From: Oleg Drokin <green@namesys.com>
Subject: Re: badblocks blocksize setting
Date: Sat, 15 Mar 2003 14:44:26 +0300
Message-ID: <20030315144426.A30661@namesys.com>
References: <006b01c2ea87$20046a40$55c7a8c0@mariusw2k> <20030315111600.A24872@namesys.com> <001801c2eae7$63932d90$55c7a8c0@mariusw2k>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13277-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <001801c2eae7$63932d90$55c7a8c0@mariusw2k>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marius Reiner <news.mr@gmx.net>
Cc: reiserfs-list@namesys.com

Hello!

On Sat, Mar 15, 2003 at 12:38:23PM +0100, Marius Reiner wrote:

> > Can you please show the command line and the resulting output with
> badblocks?
> > Also what is in dmesg output after such a run?
> # badblocks /dev/hdc8 -b 4096
> # dmesg -c
> invalidate: busy buffer
> # badblocks /dev/hdc8
> 979932
> # dmesg
> invalidate: busy buffer
> attempt to access beyond end of device
> 16:08: rw=0, want=979936, limit=979933
> attempt to access beyond end of device
> 16:08: rw=0, want=979936, limit=979933

Hm, is 979936 looks like size of your device in kilobytes (+-3)?
If so, this is known kernel bug/problem, where it cannot access parts
of device at the end sometimes. This is somehow related to setblocksize.
This can be ignored, then.

> However, what I'm missing in the FAQ, is a short note about _why_ one should
> use the -b option, so no worries arise when getting bad blocks without it.

-b is needed so block output by bad blocks have the same bad blocks as
in reiserfs. (4096 bytes in size, without -b, badblocks
defaults to 1024 bytes blocks, so you need to divide its output by 4).

Bye,
    Oleg
