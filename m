From: Domenico Andreoli <cavok@tiscali.it>
Subject: reiser4progs 0.5.4 build error (was Re: fsck.reiser4 can't fix 1 fixable corruption)
Date: Wed, 21 Apr 2004 15:30:55 +0200
Sender: Domenico Andreoli <cavok@libero.it>
Message-ID: <20040421133055.GA29283@raptus.homelinux.org>
References: <200404201733.51809.rmeijer@internet.gr> <200404211255.41388.vitaly@namesys.com> <200404211259.01802.rmeijer@internet.gr> <200404211547.08993.vitaly@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18116-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200404211547.08993.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Wed, Apr 21, 2004 at 03:51:56PM +0400, Vitaly Fertman wrote:
> 
> I have put another internal reiser4progs snapshot with some more 
> fixes into the www.namesys.com/snapshots/2004.04.21-internal.testing/
> I have no problems with it, try it please.
> 

bad news, you must have forgotten something. there is no obj40_repair.h
in reiser4progs tarball :/

 i386-linux-gcc -DHAVE_CONFIG_H -I. -I. -I../../.. -I../../../include -D_REENTRANT -D_FILE_OFFSET_BITS=64 -DENABLE_SYMLINKS -DENABLE_SPECIAL -DENABLE_R5_HASH -DENABLE_FNV1_HASH -DENABLE_RUPASOV_HASH -DENABLE_TEA_HASH -DENABLE_DEG_HASH -DENABLE_LARGE_KEYS -DENABLE_SHORT_KEYS -O0 -g -W -Wall -Wno-unused-parameter -Wredundant-decls -MT libobj40_static_la-obj40_repair.lo -MD -MP -MF .deps/libobj40_static_la-obj40_repair.Tpo -c obj40_repair.c -o libobj40_static_la-obj40_repair.o
obj40_repair.c:8:26: obj40_repair.h: No such file or directory
[all sort of errors]

cheers
domenico

-----[ Domenico Andreoli, aka cavok
 --[ http://filibusta.crema.unimi.it/~cavok/gpgkey.asc
   ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50
