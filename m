From: Isaac Chanin <chanin@WPI.EDU>
Subject: Re: AMD64 progress?
Date: Sat, 15 Jan 2005 21:26:01 -0500 (EST)
Message-ID: <Pine.LNX.4.44.0501152102230.10167-100000@ccc7.wpi.edu>
References: <20050114201751.GB5883@backtop.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23155-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050114201751.GB5883@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com


Also tested this patch, similar results as to what I've been getting - 
ie. working for awhile (more than a few hours even this time, but that 
could just be coincidence, i suppose) and then going down with the normal 
reiser4_find_next_zero_bit(bnode_working_data(bnode), end_offset, 
start_offset) >= end_offset error.  For the exact message see 
http://users.wpi.edu/~chanin/r4newpatch.txt.

As an aside, I've also been trying to fix this problem in my own 
haphazard/change-random-things way and have tried a few things that might 
be somewhat useful to know, a few less things to try, at least:

Tried removing the #define's for find_next_zero_bit and 
find_first_zero_bit in bitops.h so that those functions instead definitely 
call what's in bitops.c.  Same errors with or without them.

Tried changing the asm in bitops.c for find_next_zero_bit to use the 
same opcodes as the x86 version (well, slightly different, quadwords and 
all, but you get the idea,) which didn't help.

And, I wrote a little c program to test the find_next_zero_bit function, 
with and without the redefining of the functions (as is done in bitops.h)
and couldn't get the x86_64 code to behave differently from the x86 code. 
Though, to be fair, it wasn't very good code, so it probably didn't test 
the function very well.

I realize that my testing is not the best, but it doesn't seem like it
would hurt to hypothesize that perhaps find_next_zero_bit is not the
problem, but instead, the find_next_zero_bit error is manifesting itself
because of some other problem elsewhere in the code?

By the way, I tested the new patch on 2.6.10-mm2 and 2.6.11_rc1-mm1 both 
of which gave similar error messages (the one i linked to is from the 
11_rc1 version.


On Fri, 14 Jan 2005, Alex Zarochentsev wrote:

> On Wed, Jan 12, 2005 at 11:33:27PM -0600, Jake Maciejewski wrote:
> > There was mention of Namesys getting an AMD64 machine. Do you guys have
> > it yet? Has there been any progress on my reiser4 bug(s), particularly
> > the "reiser4_find_next_zero_bit(bnode_working_data(bnode), end_offset,
> > start_offset) >= end_offset" problem?
> 
> can you test the following patch? I know that amd64 does not require
> strong word aligment, but may be amd64 bitops coded in assembler 
> do that?
> 
> ===== plugin/space/bitmap.c 1.185 vs edited =====
> --- 1.185/plugin/space/bitmap.c	Sun Dec  5 19:49:52 2004
> +++ edited/plugin/space/bitmap.c	Fri Jan 14 23:15:53 2005
> @@ -57,13 +57,15 @@
>  
>  #define CHECKSUM_SIZE    4
>  
> +#define BYTES_PER_LONG   (sizeof(long))
> +
>  #if BITS_PER_LONG == 64
>  #  define LONG_INT_SHIFT (6)
>  #else
>  #  define LONG_INT_SHIFT (5)
>  #endif
>  
> -#define LONG_INT_MASK (BITS_PER_LONG - 1)
> +#define LONG_INT_MASK (BITS_PER_LONG - 1UL)
>  
>  typedef unsigned long ulong_t;
>  
> @@ -182,12 +184,41 @@
>  
>  #include <asm/bitops.h>
>  
> +#if BITS_PER_LONG == 64
> +
> +#define OFF(addr)  (((ulong_t)(addr) & (BYTES_PER_LONG - 1)) << 3)
> +#define BASE(addr) ((ulong_t*) ((ulong_t)(addr) & ~(BYTES_PER_LONG - 1)))
> +
> +static inline void reiser4_set_bit(int nr, void * addr)
> +{
> +	ext2_set_bit(nr + OFF(addr), BASE(addr));
> +}
> +
> +static inline void reiser4_clear_bit(int nr, void * addr)
> +{
> +	ext2_clear_bit(nr + OFF(addr), BASE(addr));
> +}
> +
> +static inline int reiser4_test_bit(int nr, void * addr)
> +{
> +	return ext2_test_bit(nr + OFF(addr), BASE(addr));
> +}
> +static inline int reiser4_find_next_zero_bit(void * addr, int maxoffset, int offset) 
> +{
> +	int off = OFF(addr);
> +
> +	return ext2_find_next_zero_bit(BASE(addr), maxoffset + off, offset + off) - off;
> +}
> +
> +#else
> +
>  #define reiser4_set_bit(nr, addr)    ext2_set_bit(nr, addr)
>  #define reiser4_clear_bit(nr, addr)  ext2_clear_bit(nr, addr)
>  #define reiser4_test_bit(nr, addr)  ext2_test_bit(nr, addr)
>  
>  #define reiser4_find_next_zero_bit(addr, maxoffset, offset) \
>  ext2_find_next_zero_bit(addr, maxoffset, offset)
> +#endif
>  
>  /* Search for a set bit in the bit array [@start_offset, @max_offset[, offsets
>   * are counted from @addr, return the offset of the first bit if it is found,
> 
> 
> 
> 

