From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Any new patches against 2.6.6 available?
Date: Wed, 12 May 2004 19:29:29 +0300
Message-ID: <20040512162929.GP29226@nysv.org>
References: <200405101635.05839.matthias.wieser@hiasl.net> <20040510152746.GV29226@nysv.org> <20040510165859.GW29226@nysv.org> <200405111014.21208.rmeijer@internet.gr>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18630-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200405111014.21208.rmeijer@internet.gr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Raymond A. Meijer" <rmeijer@internet.gr>
Cc: reiserfs-list@namesys.com

On Tue, May 11, 2004 at 10:14:21AM +0300, Raymond A. Meijer wrote:
>
>Can't we get it through ftp/http?

I succumbed and downloaded the free-ish crippleware version of BK
and did pulls on the URLs

bk://bk.namesys.com/bk/reiser4-linux-2.5
bk://bk.namesys.com/bk/reiser4

And there's all sorts of puzzling stuff:

--- drivers/char/ftape/zftape/zftape-eof.c      2004-05-12 19:16:11.000000000
+0300
+++ /usr/src/linux-2.6.6-rc3-mm2/drivers/char/ftape/zftape/zftape-eof.c
2004-05-12 18:50:46.000000000 +0300
@@ -123,7 +123,7 @@
        while (ptr + 3 < limit) {
 
                if (get_unaligned((__u32*)ptr)) {
-                       ++(__u32*)ptr;
+                       ptr += sizeof(__u32);
                } else {
                        return ptr;
                }

Is this for real by Namesys or just a sign that the bk pull was really old?

What's the policy, should I just copy everything over on top of my
linux-2.6.6-rc3-mm2 directory and hope it works?

I sort of think the name -2.5 is a remnant from a former era, but I'd rather
not waste my time on some olde wylde goose chase.

The reiser4 repository apparently doesn't contain any core changes, so,
what's up? Or am I too stupid to see something obvious?-)

-- 
mjt

