From: Hans Reiser <reiser@namesys.com>
Subject: Reiser4 status: benchmarked vs. V3 (and ext3)
Date: Thu, 24 Jul 2003 01:02:19 +0400
Message-ID: <3F1EF7DB.2010805@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15014-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-kernel@vger.kernel.org, reiserfs mailing list <reiserfs-list@namesys.com>, Linus Torvalds <torvalds@transmeta.com>, Marcelo Tosatti <marcelo@conectiva.com.br>

Please look at http://www.namesys.com/benchmarks/v4marks.html

In brief, V4 is way faster than V3, and the wandering logs are indeed 
twice as fast as fixed location logs when performing writes in large 
batches.

We are able to perform all filesystem operations fully atomically, while 
getting dramatic performance improvements.  (Other attempts at 
introducing transactions into filesystems are said to have failed for 
performance reasons.)

Balancing at flush time works well, not using blobs works well, 
allocating at flush time works well.  CPU time is good enough to get by, 
and it will improve over the next few months as we tweak a lot of little 
details, but the IO performance is what matters, and this performance is 
quite good enough to use.  In all the places where V3 sacrifices 
performance to save disk space, V4 saves more disk space and gains 
rather than loses performance. 

The plugin infrastructure works well, expect lots of plugins over the 
next year or two.

Look for a repacker to come out in a few weeks that will make these 
numbers especially good for filesystems that have 80% of their files 
unmoving for long periods of time (which is to say most systems), and 
might otherwise suffer from fragmentation.

These benchmarks mean to me that our performance is now good enough to 
ship V4 to users (which means we need persons willing to try to crash it 
so that the stability can become good enough to ship to users).  
Sometime during the next week or two we will probably send a patch in, 
and ask for inclusion.  We need to run another round of stress tests 
after our latest tweaks, and kill off two bugs that got added just 
recently, and then we will ask for testers. 

I will be going to Budapest to discuss filesystem semantics with Peter 
Foldiak for a week, so V4 may get sent in for inclusion by members of my 
team while I am absent.  If so, please include it in 2.5/2.6.

-- 
Hans


