From: Joe Cooper <joe@swelltech.com>
Subject: Re: duplicate files and recent changes
Date: Sat, 08 Jun 2002 08:04:15 -0500
Message-ID: <3D0200CF.1050604@swelltech.com>
References: <Pine.WNT.4.43.0206060127230.1296-100000@fanatic> <1023440037.971.6.camel@kakapo> <20020608125053.GA11270@blueyonder.co.uk> <3D01FCFF.7020307@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10686-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Debian User <mtoseland@blueyonder.co.uk>, Heinz-Josef Claes <hjclaes@web.de>, reiserfs-list@namesys.com

Hans Reiser wrote:
 > Debian User wrote:
 >
 >> On Fri, Jun 07, 2002 at 10:53:57AM +0200, Heinz-Josef Claes wrote:
 >>
 >>
 >>>
 >>> But I've written a well tested tool for backing up directories on
 >>>  another disk which uses md5 sums to recognize same files (even
 >>> in one backup) and hard links them. By this way, it combines the
 >>> advantages of full and incremental backup. It also uses
 >>> compression and has a lot of other options and optimisations. It
 >>> runs best with reiserfs, because reiserfs has no preconfigured
 >>> number of inodes and is fast with hard linking. So, if you need
 >>> to backup, try http://sourceforge.net/projects/storebackup
 >>>
 >>
 > Would anyone care to check this tool out, and post a review?
 >
 > Hans

Not to discount the work Heinz-Josef has done, but rdiff-backup may be a 
better way to achieve a similar goal.  It does not have the benefit of 
being "best with reiserfs" but it works great on ReiserFS partitions (as 
well as ext2/3 and probably anything else).

http://www.stanford.edu/~bescoto/rdiff-backup/

Binary diffs are fun.  I'd be surprised if an MD5/hardlink system could 
match it for compression of increments over time, or beat the 
flexibility of being able to keep potentially weeks or months worth of 
daily diffs in a very small space.  I may be wrong, of course.  But 
rdiff-backup is working great for me.
-- 
Joe Cooper <joe@swelltech.com>
Web caching appliances and support.
http://www.swelltech.com

