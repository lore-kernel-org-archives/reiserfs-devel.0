From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: reiser4 on alpha
Date: Sat, 26 Jun 2004 10:41:31 +0400
Message-ID: <20040626064131.GN5080@backtop.namesys.com>
References: <20040626015101.3c47427d.pegasus@nerv.eu.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19406-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040626015101.3c47427d.pegasus@nerv.eu.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jure Pe??ar <pegasus@nerv.eu.org>
Cc: reiserfs-list@namesys.com

On Sat, Jun 26, 2004 at 01:51:01AM +0200, Jure Pe??ar wrote:
> 
> Hi all,
> 
> i tought someone might be interested in the following compiler warnings and
> error:
> 
>   LD      fs/reiser4/built-in.o
>   CC [M]  fs/reiser4/debug.o
> {standard input}: Assembler messages:
> {standard input}:5: Warning: setting incorrect section attributes for .got

Does only reiser4 produce the above warning?

>   CC [M]  fs/reiser4/stats.o
> {standard input}: Assembler messages:
> {standard input}:5: Warning: setting incorrect section attributes for .got
>   CC [M]  fs/reiser4/jnode.o
> {standard input}: Assembler messages:
> {standard input}:5: Warning: setting incorrect section attributes for .got
>   CC [M]  fs/reiser4/znode.o
> fs/reiser4/znode.c: In function `zget':
> fs/reiser4/znode.c:565: warning: long long unsigned int format, long
> unsigned int arg (arg 2)
> {standard input}: Assembler messages:
> {standard input}:5: Warning: setting incorrect section attributes for .got
>   CC [M]  fs/reiser4/key.o
> fs/reiser4/key.c: In function `sprintf_key':
> fs/reiser4/key.c:150: warning: long long unsigned int format, oid_t arg (arg
> 3)
> fs/reiser4/key.c:150: warning: long long unsigned int format, __u64 arg (arg
> 5)
> fs/reiser4/key.c:150: warning: long long unsigned int format, __u64 arg (arg
> 6)
> fs/reiser4/key.c:150: warning: long long unsigned int format, oid_t arg (arg
> 7)
> fs/reiser4/key.c:150: warning: long long unsigned int format, __u64 arg (arg
> 8)
> fs/reiser4/key.c:157: warning: long long unsigned int format, oid_t arg (arg
> 3)
> fs/reiser4/key.c:157: warning: long long unsigned int format, __u64 arg (arg
> 5)
> fs/reiser4/key.c:157: warning: long long unsigned int format, oid_t arg (arg
> 6)
> fs/reiser4/key.c:157: warning: long long unsigned int format, __u64 arg (arg
> 7)
> {standard input}: Assembler messages:
> {standard input}:5: Warning: setting incorrect section attributes for .got
>   CC [M]  fs/reiser4/pool.o
> {standard input}: Assembler messages:
> {standard input}:5: Warning: setting incorrect section attributes for .got
>   CC [M]  fs/reiser4/tree_mod.o
> fs/reiser4/tree_mod.c: In function `new_node':
> fs/reiser4/tree_mod.c:62: warning: long long unsigned int format,
> reiser4_block_nr arg (arg 2)
> {standard input}: Assembler messages:
> {standard input}:5: Warning: setting incorrect section attributes for .got
>   CC [M]  fs/reiser4/estimate.o
> {standard input}: Assembler messages:
> {standard input}:5: Warning: setting incorrect section attributes for .got
>   CC [M]  fs/reiser4/carry.o
> {standard input}: Assembler messages:
> {standard input}:5: Warning: setting incorrect section attributes for .got
>   CC [M]  fs/reiser4/carry_ops.o
> {standard input}: Assembler messages:
> {standard input}:5: Warning: setting incorrect section attributes for .got
>   CC [M]  fs/reiser4/lock.o
> {standard input}: Assembler messages:
> {standard input}:5: Warning: setting incorrect section attributes for .got
>   CC [M]  fs/reiser4/tree.o
> {standard input}: Assembler messages:
> {standard input}:5: Warning: setting incorrect section attributes for .got
>   CC [M]  fs/reiser4/context.o
> {standard input}: Assembler messages:
> {standard input}:5: Warning: setting incorrect section attributes for .got
>   CC [M]  fs/reiser4/tap.o
> {standard input}: Assembler messages:
> {standard input}:5: Warning: setting incorrect section attributes for .got
>   CC [M]  fs/reiser4/coord.o
> fs/reiser4/coord.c: In function `coords_equal':
> fs/reiser4/coord.c:598: error: duplicate case value
> fs/reiser4/coord.c:598: error: previously used here
> {standard input}: Assembler messages:
> {standard input}:5: Warning: setting incorrect section attributes for .got
> make[2]: *** [fs/reiser4/coord.o] Error 1
> make[1]: *** [fs/reiser4] Error 2
> make: *** [fs] Error 2
> 
> Looking at fs/reiser4/debug.h suggest that this is something done on purpose
> to guard against other problems.

yes, "duplicated case value" is a result of our compile-time assertion if it fails.

But the assertion is wrong because the assumtion that struct coord has no
implicit padding is wrong on alpha.

> Gcc 3.3.4 on debian/alpha, reiser4-2004.06.24-19.36-linux-2.6.7 snapshot.

Thanks for the report

> -- 
> Jure Pe??ar

-- 
Alex.
