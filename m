From: Newsmail <newsmail@satimex.tvnet.hu>
Subject: Re: [BK] ReiserFS file write bug fix for 2.4
Date: Thu, 12 Sep 2002 18:40:10 +0100
Message-ID: <5.1.1.6.2.20020912183504.01d24f60@pop.tvnet.hu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11435-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

 > The mount option (-o alloc=prealloc min=4:preallocsize=9) only or better
 > a "reformat"?
 >
 > Those mount options are no longer needed starting from 2.4.20-pre6.
 > They are default. Reformat is not needed, but all the blocks allocated by
 > old allocator will remain at their old places of course.
 >
 > Bye,
 > Oleg
I use 2.4.20-pre4 without these mount options. So apparently reiserfs is 
much slower than the optimal am I right? (if my memory is good this is 
about some speed optimization right?).
greg


