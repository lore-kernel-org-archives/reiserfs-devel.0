From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4: discard support
Date: Wed, 30 Apr 2014 19:55:06 +0200
Message-ID: <536138FA.3070602@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=A5U2EZ/Nl3JYKKByN2N+ttCd755CR8HUmkPJEOZHE8A=;
        b=u14UvEPm6Sl8NcvtBCQSD3fb3GIKJJNx65QpD5akeMFMyhQNs2GPadTsoyko5RwrtM
         YiL417r5+rGFXfgqKhpPqWAYqGysD/I3RTGvxCo3mdAVgo+Y3yBymNsrQdiHQoE6Awxa
         CssuD+dorflj4FLwFUKYSj9aiGOPizidiANm/r57a5HGMdnPh+6X0Le1RU8u8Ka9e7nY
         z/qEFXrWRe1ox2Cze9BvtDqGwvTY3kiuUxuI2UgJ1BKt2ZG94S9QYQuMwDu4AHFaK5AD
         GIj4cQTdE9XJID+XM2JZr5hy4oQI05CVT/0Qu4JjIiRUNb9C/oDlpqwo1GDFxOUHIuKq
         IKpQ==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS Development mailing list <reiserfs-devel@vger.kernel.org>

On 04/30/2014 05:04 PM, Ivan Shapovalov wrote:
[...]
 >> There is a ready implementation of rb-trees in the kernel (see 
./lib/rbtree.c,
 >> ./lib/rbtree_test.c). Could you please take a look at this?
 >
 > I've checked it already. Well, in case of trees:
 > - combined extent insertion+adjacent extent merge complexity is 
O(n*log(n))

Actually, this is:

1) Add n extents one-by-one to empty tree:
log(1) + log(2) + ... + log(n-1)

2) Merge 2 trees of n extents:
log(n) + log(n+1) + ... + log(2n-1)

Total: log(1*2*...*2n-1) = log((2n-1)!)

in accordance with Stirling's formula:

log((2n)!) = log(((2n)^(1/2))*(2n/e)^n) =
= (1/2)*log(2n) + n*log(2n/e) < n + n*log(n)

Since atoms can be merged in parallel, we have that
trees work better than lists. Also tree of extents has
better memory consumption because of merging extents.


 >  against O(n+n*log(n)) in lists;
 > - joining two trees is not less than O(log(n)) against O(1) in lists.
 >
 > So I can't see any benefit in using trees, and join performance is a 
downside of these. Am I missing something?
 >
 >>
 >>>
[...]
 > Why after reiser4_invalidate_list()? I thought that it should be 
called between reiser4_write_logs(), but before reiser4_invalidate_list().

OK, insert before. I think, it doesn't matter, since we don't look
at this list when issuing discard requests, no? :)

 >
 > And why not after all reiser4_invalidate_list() calls?
 >
 >>
 >> Thanks,
 >> Edward.
 >> P.S.: You'll need to set up a debugging environment. Take a look at 
this:
 >> http://bipinkunal.blogspot.cz/2012/05/kgdb-tutorial.html
 >> Do you have a second machine with a serial port?
 >
 > No, I don't. Will a VM suffice?

Yes, if it works for you..

Thanks,
Edward.
