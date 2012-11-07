From: "Michael W. Bombardieri" <mb@ii.net>
Subject: Re: [PATCH] reiserfscore/hashes.c
Date: Wed, 7 Nov 2012 08:37:44 +0800
Message-ID: <20121107003744.GA4194@bom.nom.co>
References: <20121106154905.GA11281@bom.nom.co>
 <5099694F.8060502@gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5099694F.8060502@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org, Jeff Mahoney <jeffm@suse.com>

On Tue, Nov 06, 2012 at 08:47:27PM +0100, Edward Shishkin wrote:
> Hello Michael,
> 
> Your changes look OK to me.
> 
> TBH, I don't like the fact that the pow is set to 1 by such tricky ways in
> the mentioned nested loops: it might indicate mistakes in the original
> code.

I agree. Something doesn't look right about the nested loops
not being entered. This could well point to the code being
incorrect. IMHO, the developer would not bother adding the
loops if he didn't want them to be used.

> Generally I think that this hash is not heavily used: everyone uses either
> r5, or tea hash, so...

I suppose this would raise the question, is it worth patching
yura_hash() or is it better to scrap the function altogether
if the two other hash functions are sufficient?

> A??ked-by: Edward Shishkin <edward.shishkin@gmail.com>
> 
> Thanks,
> Edward.
> P.S. This is a git repository of Jeff Mahoney, the reiserfs maintainer, so
> don't forget cc him ;)
> 
> 
> 
> >- Michael
> >
> >
> >--- hashes.c	Tue Nov  6 23:21:09 2012
> >+++ hashes_new.c	Tue Nov  6 23:26:26 2012
> >@@ -175,37 +175,26 @@
> >  u32 yura_hash (const signed char *msg, int len)
> >  {
> >-    int j, pow;
> >-    u32 a, c;
> >-    int i;
> >-
> >-    for (pow=1,i=1; i < len; i++) pow = pow * 10;
> >-
> >-    if (len == 1)
> >-	a = msg[0]-48;
> >-    else
> >-	a = (msg[0] - 48) * pow;
> >-
> >-    for (i=1; i < len; i++) {
> >-	c = msg[i] - 48;
> >-	for (pow=1,j=i; j < len-1; j++) pow = pow * 10;
> >-	a = a + c * pow;
> >-    }
> >-
> >-    for (; i < 40; i++) {
> >-	c = '0' - 48;
> >-	for (pow=1,j=i; j < len-1; j++) pow = pow * 10;
> >-	a = a + c * pow;
> >-    }
> >-
> >-    for (; i < 256; i++) {
> >-	c = i;
> >-	for (pow=1,j=i; j < len-1; j++) pow = pow * 10;
> >-	a = a + c * pow;
> >-    }
> >-
> >-    a = a << 7;
> >-    return a;
> >+	int i, j, pow;
> >+	u32 a;
> >+
> >+	a = msg[0] - 48;
> >+	if (len != 1) {
> >+		for (i = 1, pow = 1; i < len; i++)
> >+			pow *= 10;
> >+		a *= pow;
> >+	}
> >+	for (i = 1; i < len; i++) {
> >+		for (j = i, pow = 1; j < len - 1; j++)
> >+			pow *= 10;
> >+		a += pow * (msg[i] - 48);
> >+	}
> >+	for (; i < 40; i++)
> >+		a += '0' - 48;
> >+	for (; i < 256; i++)
> >+		a += i;
> >+	a <<= 7;
> >+	return a;
> >  }
> 
