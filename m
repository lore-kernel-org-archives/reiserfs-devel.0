From: Oleg Drokin <green@namesys.com>
Subject: Re: vpf-10680, minor corruptions
Date: Sat, 28 Jun 2003 15:53:43 +0400
Message-ID: <20030628115343.GA21256@namesys.com>
References: <3EFC361A.4030009@g-house.de> <20030627122556.GA8753@namesys.com> <3EFC396A.7080808@g-house.de> <20030627123800.GA9214@namesys.com> <20030627161344.GA13908@namesys.com> <3EFC9919.8020308@g-house.de> <20030627211416.GA16091@namesys.com> <3EFCC72F.9020100@g-house.de> <20030628095847.GA19610@namesys.com> <3EFD7FF5.7020305@g-house.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14776-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3EFD7FF5.7020305@g-house.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Kujau <evil@g-house.de>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Hello!

On Sat, Jun 28, 2003 at 01:45:57PM +0200, Christian Kujau wrote:

> your patch applied with no warnings, i really seem to have _not_ applied 
> the patch last time (sorry!),  because now i get a compiler error:
>   LD      fs/proc/proc.o
>   LD      fs/proc/built-in.o
>   CC      fs/ramfs/inode.o
>   LD      fs/ramfs/ramfs.o
>   LD      fs/ramfs/built-in.o
>   CC      fs/reiserfs/bitmap.o
> fs/reiserfs/bitmap.c: In function `old_hashed_relocation':
> fs/reiserfs/bitmap.c:593: error: long, short, signed or unsigned used 
> invalidly for `hash_in'
> make[3]: *** [fs/reiserfs/bitmap.o] Error 1
> make[2]: *** [fs/reiserfs] Error 2
> make[1]: *** [fs] Error 2
> make: *** [vmlinux] Error 2

Aha, there is "u32 long" in line 593 in fs/reiserfs/bitmap.c file.
Remove the "long" word and it should compile.
Strange enough that it compiles with gcc 2.95 and gcc 3.2.2

Hm, interesting that I compiled gcc 2.95.3 on my alpha and still the kernel
built with this gcc dies aprox at a time when starting init too (jumps to zero again).

Thank you.

Bye,
    Oleg
