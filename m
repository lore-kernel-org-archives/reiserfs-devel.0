From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Bitmap alignment issues....
Date: Wed, 16 Feb 2005 07:55:40 +0300
Message-ID: <20050216045540.GX7482@backtop.namesys.com>
References: <20050215183011.GU7482@backtop.namesys.com> <3pan5q$2kae4@smtp04.mrf.mail.rcn.net>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3pan5q$2kae4@smtp04.mrf.mail.rcn.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Evans <tom@23palmer.net>
Cc: reiserfs-list@namesys.com

On Tue, Feb 15, 2005 at 04:37:29PM -0500, Tom Evans wrote:
> 
> >do you see aligment faults in the bitmap code after my patch?
> 
> The patch that was presented a few days ago caused corruption of the volume.
> I used a "patch" I did that simply used the unaligned macros.

did you apply the patch (see below) which i sent to amd64 guys?

--------------------------------------------------
diff -Nru a/plugin/space/bitmap.c b/plugin/space/bitmap.c
--- a/plugin/space/bitmap.c     Wed Feb 16 07:53:36 2005
+++ b/plugin/space/bitmap.c     Wed Feb 16 07:53:36 2005
@@ -165,7 +165,7 @@
 static int
 find_next_zero_bit_in_word(ulong_t word, int start_bit)
 {
-       ulong_t mask = 1 << start_bit;
+       ulong_t mask = 1UL << start_bit;
        int i = start_bit;

        while ((word & mask) != 0) {
@@ -235,7 +235,7 @@
        assert ("zam-965", start_bit < BITS_PER_LONG);
        assert ("zam-966", start_bit >= 0);

-       bit_mask = (1 << nr);
+       bit_mask = (1UL << nr);

        while (bit_mask != 0) {
                if (bit_mask & word)

--------------------------------------------------

> 
> I will try the new patch this evening.
> 
> Thanks,
> 
> ...tom
> 

-- 
Alex.
