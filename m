From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Reiser4 installation & kernel patching
Date: Thu, 19 Jun 2003 15:37:30 +0400
Message-ID: <200306191537.30489.vitaly@namesys.com>
References: <000e01c33621$2ced8490$0200a8c0@xpstation>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14622-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <000e01c33621$2ced8490$0200a8c0@xpstation>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Fred -- Speed Up -- <speedup@free.fr>, ReiserFS ML <reiserfs-list@namesys.com>

On Thursday 19 June 2003 09:11, Fred -- Speed Up -- wrote:
> Hello !

Hi,

> I just downloaded the 2.5.72 kernel sources and applied the -mm1 patch, now
> I'd want to include Reiser4 in my kernel. I tried to compile the
> reiserprogs sources from the bk repositery, but autoconf and then
> ./configure failed. I don't really know how to patch the kernel though ...
> do I simply have to copy the reiser4 folder in the kernel's /fs folder, and
> then apply the linux-[...].patch ? This one does not work on my kernel, and
> I don't know if it's the right way to go. I'd just like you to make a
> little howto to merge reiser4 into an existing kernel (I don't want to
> download the whole Reiser4 kernel tree ...) and then correctly compile the
> reiser4progs.

regarding reiser4progs - they are supposed to be used from snapshots for now
from from packages in the future with ready-to-use configure script, not from bk 
repository where you need to make it by you yourself and need some last 
autoconf version for that. Probably you will prefere to get some snapshot from 
http://thebsh.namesys.com/snapshots. And you will need libaal installed before
reiser4progs compiling.

> PS : What are the lilo and grub patches in the reiserprogs source tree for
> ? Do they bring boot support for reiser4 partitions, so that grub for
> instance will be able to fetch its menu.lst file from a reiser4 partition ?

No they are reiser3 related. Have a look into mentioned snapshot directory
on our web server for reiser4 patches.

-- 
Thanks,
Vitaly Fertman
