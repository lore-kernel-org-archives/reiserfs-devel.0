From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: making reiser4/AMD64 hardlock
Date: Tue, 7 Dec 2004 15:20:43 +0300
Message-ID: <20041207122043.GI5368@backtop.namesys.com>
References: <1099472359.8158.36.camel@localhost> <20041103201825.GY30438@hvs.envisage.co.za> <1099561964.1492.20.camel@tribesman.namesys.com> <1100073674.31776.21.camel@localhost> <1100102927.1659.64.camel@tribesman.namesys.com> <1100115940.16965.3.camel@localhost>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22704-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1100115940.16965.3.camel@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jake Maciejewski <maciejej@msoe.edu>
Cc: Vladimir Saveliev <vs@namesys.com>, reiserfs-list@namesys.com

On Wed, Nov 10, 2004 at 01:45:40PM -0600, Jake Maciejewski wrote:
> Does this show what you want?
> http://people.msoe.edu/~maciejej/patches/AMD64_reiser4_debug/11-10-04/with_bitmap.c.diff/

Please apply the patch below. it definitely fixes one reiser4/amd64 bug. 


===== plugin/space/bitmap.c 1.183 vs edited =====
--- 1.183/plugin/space/bitmap.c	Wed Oct 13 17:22:01 2004
+++ edited/plugin/space/bitmap.c	Sun Dec  5 00:18:55 2004
@@ -170,7 +170,7 @@
 static int
 find_next_zero_bit_in_word(ulong_t word, int start_bit)
 {
-	unsigned int mask = 1 << start_bit;
+	ulong_t mask = 1 << start_bit;
 	int i = start_bit;
 
 	while ((word & mask) != 0) {
@@ -234,7 +234,7 @@
 /* search for the first set bit in single word. */
 static int find_last_set_bit_in_word (ulong_t word, int start_bit)
 {
-	unsigned bit_mask;
+	ulong_t bit_mask;
 	int nr = start_bit;
 
 	assert ("zam-965", start_bit < BITS_PER_LONG);
