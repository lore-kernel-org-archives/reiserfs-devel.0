From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: [ANNOUNCE]: reiser4
Date: Wed, 30 Oct 2002 12:41:50 +0300
Message-ID: <15807.43358.522511.933144@laputa.namesys.com>
References: <15806.51536.985203.709475@laputa.namesys.com>
	<20021030022944.GE31928@willow.seitz.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11837-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021030022944.GE31928@willow.seitz.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ross Vandegrift <ross@willow.seitz.com>
Cc: Reiserfs-List@namesys.com

Ross Vandegrift writes:
 > On Tue, Oct 29, 2002 at 08:45:52PM +0300, Nikita Danilov wrote:
 > > It is still crasheable. Do not put critical data on it.
 > 
 > How crashable?  I'd like to play around with this on the /home partition
 > on my personal workstation.

You can untar and compile kernel on it (this exercises file system quite
a bit), run various stress tests (like fsx and fsstress), but not others
(like mongo).

It still has rough corners under memory pressure. Deadlocks are still
possible under highly concurrent access.

 > 
 > Is it resiliant enough to be used if I have a cron job make backups
 > every 12 hours?  How about every 2 hours?

As for using it for your home directory, you have to judge yourself. :-)

Err, one more bit: fsck is non-existent yet, so, if it crashes---data
are lost for ever.

 > 
 > Sounds like it'll be cool - thanks for the coolest filesystem on the
 > planet.
 > 

Nikita.
