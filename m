From: Isaac Chanin <chanin@WPI.EDU>
Subject: Re: AMD64/Reiser4 testing and problems
Date: Wed, 08 Dec 2004 03:04:07 -0500
Message-ID: <41B6B577.4080904@wpi.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22717-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hey Alex,

Thanks for the patch, I wish there was more I could say, but so far I 
haven't been able to produce any problems whatsoever with this new patch 
on reiser4/amd64.  The things I tried were Jake Maciejewski's kernel 
compiling command which I modified slightly to better suit my system. 
The following ran for at least 30 minutes and a couple of iterations of 
kernel compiling: for i in `seq 1 20` ; do make mrproper ; cat 
/boot/2.6.10-r4-mm-config > .config ; make ; echo $i ; done & for i in 
`seq 1 5` ; do dd; if=/dev/zero of=large_file bs=1M count=20k ; rm 
large_file ; echo $i ; done

I also tried filling the filesystem, and testing for data retention from 
forced umounts.  For fun I also tried running ext2 and a second resier4 
mounted on files inside the reiser4 filesystem.  Everything worked fine, 
I was unable to produce a single error in the logs.

The only thing that could possibly have been said to have gone wrong, 
was when I tried force umounting with open file handles, that didn't 
work out quite as well - however, for all sane usage resier4 seems 
rather stable on amd64 to me.

I will try running an entire linux system on it once I get the time, and 
perhaps then will be able to give you some more feedback.

So once again, thanks for the patch, and best of luck with resier4,

Isaac


Alex Zarochentsev wrote:

 > Hello Isaac
 >
 > On Thu, Dec 02, 2004 at 06:13:39PM -0500, Isaac Chanin wrote:
 >
 >> Hi,
 >>
 >> I did some testing with Resier4 on AMD and was wondering if perhaps 
debug information or anything on this could help with getting Resier4 
stable and working on AMD64.
 >>
 >> I have read that if AMD would give an AMD64 cpu that would be a big 
help, but it doesn't seem inheriantly impossible to fix the problem from 
error reports and such.
 >>
 >> Anyways, here are the results for my testing.  I used a mm 
2.6.10-rc2 kernel and the filesystem was in a file mounted by loopback.
 >>
 >> http://users.wpi.edu/~chanin/r4log.txt
 >
 >
 >
 > thanks a lot for the report.  can you try the following patch?
 >
 > ===== plugin/space/bitmap.c 1.183 vs edited =====
 > --- 1.183/plugin/space/bitmap.c    Wed Oct 13 17:22:01 2004
 > +++ edited/plugin/space/bitmap.c    Sun Dec  5 00:18:55 2004
 > @@ -170,7 +170,7 @@
 >  static int
 >  find_next_zero_bit_in_word(ulong_t word, int start_bit)
 >  {
 > -    unsigned int mask = 1 << start_bit;
 > +    ulong_t mask = 1 << start_bit;
 >      int i = start_bit;
 >
 >      while ((word & mask) != 0) {
 > @@ -234,7 +234,7 @@
 >  /* search for the first set bit in single word. */
 >  static int find_last_set_bit_in_word (ulong_t word, int start_bit)
 >  {
 > -    unsigned bit_mask;
 > +    ulong_t bit_mask;
 >      int nr = start_bit;
 >
 >      assert ("zam-965", start_bit < BITS_PER_LONG);
 >

