From: Casey Callendrello <cdc2107@columbia.edu>
Subject: Re: can't ls, then rebuild-tree fails, no hardware error (kow)
Date: Mon, 07 Jun 2004 11:51:14 -0400
Message-ID: <40C48EF2.3080006@columbia.edu>
References: <40C3FC52.2050404@columbia.edu> <200406071332.55981.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19066-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200406071332.55981.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

Vitaly Fertman wrote:

>Is this /dev/hdb1 the original /home ?
>So you had it mountable and you could cat some files there but could
>not ls the root of the /home, getting no error into the syslog (?) and
>then you run reiserfsck --rebuild-tree and it found no metadata?
>
>It looks like before rebuilding the partition table was altered. Did 
>you use some partition editor or another program that could change 
>the partition table? To tell for sure I need to look at the partition itself.
>
>  
>
I figured out what is probably the error.
The drive is 180 gigs, but the mobo only recognizes 137.  However, linux 
recognized 180 gigs through and through...
and now is only recognizing 137.

However, Soyo says it should be readable.  I guess not.  I'm going to 
try an -S and give up otherwise, creating a new 137 gig partition.

Thanks, Casey.
