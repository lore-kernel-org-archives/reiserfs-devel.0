From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: AMD64/Reiser4 testing and problems
Date: Sun, 5 Dec 2004 00:27:05 +0300
Message-ID: <20041204212705.GE5368@backtop.namesys.com>
References: <41AFA1A3.1040509@wpi.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22668-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <41AFA1A3.1040509@wpi.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Isaac Chanin <chanin@WPI.EDU>
Cc: reiserfs-list@namesys.com

Hello Isaac

On Thu, Dec 02, 2004 at 06:13:39PM -0500, Isaac Chanin wrote:
> Hi,
> 
> I did some testing with Resier4 on AMD and was wondering if perhaps 
> debug information or anything on this could help with getting Resier4 
> stable and working on AMD64.
> 
> I have read that if AMD would give an AMD64 cpu that would be a big 
> help, but it doesn't seem inheriantly impossible to fix the problem from 
> error reports and such.
> 
> Anyways, here are the results for my testing.  I used a mm 2.6.10-rc2 
> kernel and the filesystem was in a file mounted by loopback.
> 
> http://users.wpi.edu/~chanin/r4log.txt

thanks a lot for the report.  can you try the following patch?

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
