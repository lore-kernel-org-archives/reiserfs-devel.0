From: Dieter =?unknown-8bit?q?N=FCtzel?= <dieter.nuetzel@hamburg.de>
Subject: Re: Re: File System shootout...
Date: Fri, 10 Oct 2003 13:55:47 +0200 (CEST)
Message-ID: <1239031.1065786947952.JavaMail.nobody@franzjosef>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15833-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nikita@Namesys.COM
Cc: linux-kernel@vger.kernel.org, mikeb@netnation.com, Reiserfs-List@Namesys.COM

> Mike Benoit writes:
>  > To all those who are interested, here are the results of the benchmarks
>  > I've been running over the last week between all the major file systems
>  > (and there different mount options) using both Bonnie++ and IOzone. More
>  > tests are currently underway, so the results will be updated as they
>  > come in. 
>  > 
>  > Hopefully these results will give you a good comparative overview of each of the
>  > different file systems strengths and weaknesses.
>  > 
>  > http://fsbench.netnation.com/
> 
> I should probably add that I am getting quite different bonnie++ results
> for reiser4 vs. ext3:
> 
> on the box with 128M of ram:

Why no numbers for ReiserFS 3.xx plus data-logging patch (odered/journal/writeback, e.g. current code) like ext3?

Greetings,
   Dieter
