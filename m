From: Hans Reiser <reiser@namesys.com>
Subject: status of reiser4
Date: Tue, 25 Oct 2005 15:23:03 -0700
Message-ID: <435EB047.1040001@namesys.com>
References: <435E75AC.8090500@namesys.com> <200510251658.48802.rjoffe@yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26640-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200510251658.48802.rjoffe@yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ron Joffe <rjoffe@yahoo.com>
Cc: reiserfs-list@namesys.com

Ron Joffe wrote:

>On Tuesday 25 October 2005 14:13, Hans Reiser wrote:
>  
>
>>If yes, what steps did you take to do it?
>>    
>>
>
>Not quite there yet, but would like to test it out.
>
>Hans, could you give a status of Reiser4. I have seen allot of different 
>issues on the maillist, but not a "status" of where the overall project 
>stands.
>
>Thanks,
>
>Ron
>
>  
>
vs is working on a major update that he will release any day now.  It
contains many bug fixes.  It should deturkey our latest reiser4 release,
sorry about that guys.

Nate did a mongo benchmark on an older reiser4, -mm1 or some such, and
the surprising thing we discovered was that reiser4 is now more cpu
efficient than ext3 for mongo.  I guess all those memory copy avoiding
balancing algorithms that made the  code so hairy and added so much to
the coding time are now paying off.;-)  We should do some detailed
profiling, and careful benchmark comparisons over time, and see if
memory copies are now the big remaining hogs and reiser4 is being more
space efficient in RAM thus going faster, or if ext3 is just doing
something wasteful.

We should do fresh benchmarks on the latest reiser4 also.
