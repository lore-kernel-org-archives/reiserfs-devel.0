From: Jake Maciejewski <maciejej@msoe.edu>
Subject: Re: making reiser4/AMD64 hardlock
Date: Tue, 07 Dec 2004 15:46:58 -0600
Message-ID: <1102456018.17113.3.camel@localhost>
References: <1099472359.8158.36.camel@localhost>
	 <20041103201825.GY30438@hvs.envisage.co.za>
	 <1099561964.1492.20.camel@tribesman.namesys.com>
	 <1100073674.31776.21.camel@localhost>
	 <1100102927.1659.64.camel@tribesman.namesys.com>
	 <1100115940.16965.3.camel@localhost>
	 <20041207122043.GI5368@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22711-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20041207122043.GI5368@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alex Zarochentsev <zam@namesys.com>
Cc: Vladimir Saveliev <vs@namesys.com>, reiserfs-list@namesys.com

With this patch get

reiser4[cc1(10284)]: check_blocks_bitmap
(fs/reiser4/plugin/space/bitmap.c:1174)[zam-623]:
code: -2 at fs/reiser4/search.c:1285
reiser4 panicked cowardly: assertion failed: reiser4_find_next_zero_bit(bnode_working_data(bnode), end_offset, start_offset) >= end_offset

details at
http://people.msoe.edu/~maciejej/patches/AMD64_reiser4_debug/12-07-04/zam-patch/

which is pretty much the same thing documented in 11-20-04/sync_mount/ ,
11-10-04/with_bitmap.c.diff/ , 11-09-04/ , 11-08-04/test2/ ,
11-04-04/all-R4/ , and 11-04-04/R3-R4/


When I also used Vladimir's "10 Nov 2004 19:08:47 +0300" bitmap.c.diff,
my logs filled (~1.7 million lines) with 

WARNING: Wrong level found in node: 1 != 0
reiser4[cc1(11554)]: parse_node40
(fs/reiser4/plugin/node/node40.c:767)[nikita-494]:
code: -2 at fs/reiser4/search.c:1312

see 12-07-04/both-patches/

The only other time I've seen an error like this was 11-08-04/test1/
repeating

WARNING: Failed to delete file body 84672
reiser4[make(22140)]: parse_node40
(fs/reiser4/plugin/node/node40.c:767)[nikita-494]:
code: -2 at fs/reiser4/search.c:1278


If you want, I'll run it again and probably hit the
reiser4_find_next_zero_bit error instead. I didn't bother with
fsck.reiser4 --build-fs and --check because now that I think about it,
this isn't the sort of thing fsck needs to be able to fix. If fsck
should be able to handle these cases, someone speak up and I'll provide
more reports like 11-20-04/sync_mount/corruption/.

On Tue, 2004-12-07 at 15:20 +0300, Alex Zarochentsev wrote:
> On Wed, Nov 10, 2004 at 01:45:40PM -0600, Jake Maciejewski wrote:
> > Does this show what you want?
> > http://people.msoe.edu/~maciejej/patches/AMD64_reiser4_debug/11-10-04/with_bitmap.c.diff/
> 
> Please apply the patch below. it definitely fixes one reiser4/amd64 bug. 
> 
> 
> ===== plugin/space/bitmap.c 1.183 vs edited =====
> --- 1.183/plugin/space/bitmap.c	Wed Oct 13 17:22:01 2004
> +++ edited/plugin/space/bitmap.c	Sun Dec  5 00:18:55 2004
> @@ -170,7 +170,7 @@
>  static int
>  find_next_zero_bit_in_word(ulong_t word, int start_bit)
>  {
> -	unsigned int mask = 1 << start_bit;
> +	ulong_t mask = 1 << start_bit;
>  	int i = start_bit;
>  
>  	while ((word & mask) != 0) {
> @@ -234,7 +234,7 @@
>  /* search for the first set bit in single word. */
>  static int find_last_set_bit_in_word (ulong_t word, int start_bit)
>  {
> -	unsigned bit_mask;
> +	ulong_t bit_mask;
>  	int nr = start_bit;
>  
>  	assert ("zam-965", start_bit < BITS_PER_LONG);
-- 
Jake Maciejewski <maciejej@msoe.edu>

