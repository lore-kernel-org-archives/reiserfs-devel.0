From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: AMD64 progress?
Date: Mon, 7 Feb 2005 16:29:35 +0300
Message-ID: <20050207132934.GA7482@backtop.namesys.com>
References: <20050114201751.GB5883@backtop.namesys.com> <Pine.LNX.4.44.0501152102230.10167-100000@ccc7.wpi.edu>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="UlVJffcvxoiEqYs2"
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0501152102230.10167-100000@ccc7.wpi.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Isaac Chanin <chanin@WPI.EDU>
Cc: reiserfs-list@namesys.com

--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

On Sat, Jan 15, 2005 at 09:26:01PM -0500, Isaac Chanin wrote:
> 
> Also tested this patch, similar results as to what I've been getting - 
> ie. working for awhile (more than a few hours even this time, but that 
> could just be coincidence, i suppose) and then going down with the normal 
> reiser4_find_next_zero_bit(bnode_working_data(bnode), end_offset, 
> start_offset) >= end_offset error.  For the exact message see 
> http://users.wpi.edu/~chanin/r4newpatch.txt.
> 

please try attached patch (it is for fs/reiser4 subtree)

-- 
Alex.

--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="bitmap-amd64-fix-2.diff"

===== plugin/space/bitmap.c 1.186 vs edited =====
--- 1.186/plugin/space/bitmap.c	Wed Jan 19 18:52:52 2005
+++ edited/plugin/space/bitmap.c	Mon Feb  7 16:18:37 2005
@@ -165,7 +165,7 @@
 static int
 find_next_zero_bit_in_word(ulong_t word, int start_bit)
 {
-	ulong_t mask = 1 << start_bit;
+	ulong_t mask = 1UL << start_bit;
 	int i = start_bit;
 
 	while ((word & mask) != 0) {
@@ -235,7 +235,7 @@
 	assert ("zam-965", start_bit < BITS_PER_LONG);
 	assert ("zam-966", start_bit >= 0);
 
-	bit_mask = (1 << nr);
+	bit_mask = (1UL << nr);
 
 	while (bit_mask != 0) {
 		if (bit_mask & word)

--UlVJffcvxoiEqYs2--
