From: Christian Kujau <evil@g-house.de>
Subject: Re: vpf-10680, minor corruptions
Date: Sat, 28 Jun 2003 13:45:57 +0200
Message-ID: <3EFD7FF5.7020305@g-house.de>
References: <3EFAE933.6040206@g-house.de> <20030627092821.GA29715@namesys.com> <3EFC361A.4030009@g-house.de> <20030627122556.GA8753@namesys.com> <3EFC396A.7080808@g-house.de> <20030627123800.GA9214@namesys.com> <20030627161344.GA13908@namesys.com> <3EFC9919.8020308@g-house.de> <20030627211416.GA16091@namesys.com> <3EFCC72F.9020100@g-house.de> <20030628095847.GA19610@namesys.com>
Reply-To: evil@g-house.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14775-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030628095847.GA19610@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS List <reiserfs-list@namesys.com>
Cc: Oleg Drokin <green@namesys.com>

hi,

your patch applied with no warnings, i really seem to have _not_ applied 
the patch last time (sorry!),  because now i get a compiler error:


   LD      fs/proc/proc.o
   LD      fs/proc/built-in.o
   CC      fs/ramfs/inode.o
   LD      fs/ramfs/ramfs.o
   LD      fs/ramfs/built-in.o
   CC      fs/reiserfs/bitmap.o
fs/reiserfs/bitmap.c: In function `old_hashed_relocation':
fs/reiserfs/bitmap.c:593: error: long, short, signed or unsigned used 
invalidly for `hash_in'
make[3]: *** [fs/reiserfs/bitmap.o] Error 1
make[2]: *** [fs/reiserfs] Error 2
make[1]: *** [fs] Error 2
make: *** [vmlinux] Error 2

real	32m56.960s
user	26m37.120s
sys	1m44.777s
lila:/usr/src/linux-2.5#

this is still with gcc-3.3, and:

lila:/usr/src/linux-2.5# ld -V
GNU ld version 2.14.90.0.4 20030523 Debian GNU/Linux
   Supported emulations:
    elf64alpha
    alpha


i could use another compiler, though, if that would be helpful.

Thank you,
Christian.

