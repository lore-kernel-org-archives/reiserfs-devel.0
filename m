From: Hans Reiser <reiser@namesys.com>
Subject: Re: Why is Reiser4 slower then ReiserFS v3
Date: Tue, 28 Dec 2004 13:42:04 -0800
Message-ID: <41D1D32C.1020407@namesys.com>
References: <231dafb5041227123867a2c873@mail.gmail.com> <20041228195239.3a1531d5.reiser4@blinkenlights.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22929-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20041228195239.3a1531d5.reiser4@blinkenlights.ch>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Adrian Ulrich <reiser4@blinkenlights.ch>
Cc: reiserfs-list@namesys.com

Adrian Ulrich wrote:

>I also noticed some odd slowness of reiser4
>
>(Running 2.6.10 using the latest 2.6.10-rcsomething reiser4 patch)
>  
>
There was a read slowdown, in latest release of reiser4, see patch I 
cc'd this list on a few emails ago.

That said, try extents only option of reiser4 for faster deletes.

Because reiser4 has larger files stored in tails, it packs things more 
tightly than reiser3, but pays a price in delete speed to do it.  With 
extents only, no tight packing, fast deletes.

reiser3 also puts directory entries for multiple directories close to 
each other, and farther from the filebodies for them, compared to 
reiser4.  This may explain some of the find speed advantage.

Still, I am curious to see more measurements in this area if you have 
time for it.

Did you time the sync command or?  How large was the fileset created 
compared to RAM?

>
>What i did:
>
> I created a small script wich creates MANY (= 195075) directories
> like this: 1/[1-3]/[1-255]/[1-255]
>
> After this, i ran 'sync && find . > /dev/null && rm -rf *'
>
> Well, it's not a good test, but compare the speed of 
> the 'find' and 'rm -rf' part beteween ReiserFS and Reiser4 :-/
>
>reiser3
>
>#./mkdirs.pl
>real    5m21.194s
>user    1m12.323s
>sys     4m6.740s
>
>#find . > /dev/null
>real    0m6.419s
>user    0m0.940s
>sys     0m5.159s
>
>#rm -rf *
>real    0m24.357s
>user    0m1.558s
>sys     0m22.797s
>
>reiser4
>
>#./mkdirs.pl
>real    6m21.996s
>user    1m13.395s
>sys     5m8.233s
>
>#find . > /dev/null
>real    0m16.006s
>user    0m3.323s
>sys     0m12.676s
>
>#rm -rf *
>real    5m58.963s  <-- OUCH!
>user    0m7.962s
>sys     5m50.870s
>
>
>
>  
>

