From: Brian Tinsley <btinsley@emageon.com>
Subject: Re: what do you do that stresses your filesystem?
Date: Fri, 27 Dec 2002 23:27:43 -0600
Message-ID: <3E0D364F.1010008@emageon.com>
References: <3E06F360.7000708@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12250-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS <reiserfs-list@namesys.com>
Cc: Hans Reiser <reiser@namesys.com>

I'm late replying to this one, but I've been on vacation :)

Any possible optimizations for the following would be beneficial:
  * interaction with the Linux NFS server
  * SMP machines
  * apps like grep, awk, and sed

Any optimizations for the following application characteristics would be 
beneficial:

  * Our applications perform multi-threaded streaming I/O 
(network-to-disk and vice versa) with read/write block sizes varying 
from 16KB to 64KB; we have files ranging in size from 32KB to 500MB+ 
(this top end will likely grow into several GB in the near future).
  * Our directory structure is very broad, but not very deep and files 
are stored in leaf nodes only.
  * When a file is created and completely written to disk, it is often 
re-read in its entirety at least two times within a couple of minutes.
  * Our database app performs lots of block-based random I/O and fsyncs 
within a dozen or so large files.



Hans Reiser wrote:

> We were discussing how to optimize reiser4 best, and came to realize 
> that us developers did not have a good enough intuition for what users 
> do that stresses their filesystem enough that they care about its 
> performance.
>
> If you just do edits of files it probably does not matter too much 
> what fs you use.
>
> Booting the machine seems like one activity that many users end up 
> waiting on the FS for.  Yes?
>
> Starting up complex and big applications like xemacs and mozilla would 
> be another.  Yes?
>
> Others?
>
> Hans
>
> PS
>
> reiser4 performance is up a lot recently, and within two weeks I think 
> cp -r will have been optimized as much as is worth doing.  cp -r 
> accesses files in readdir order, and that does indeed seem worth 
> optimizing, but soon we will need to optimize more sophisticated 
> access patterns than that.....
>
> Hans


-- 

-[========================]-
-[      Brian Tinsley     ]-
-[ Chief Systems Engineer ]-
-[        Emageon         ]-
-[========================]-



