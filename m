From: Chris Mason <mason@suse.com>
Subject: Re: slow stat() ?
Date: Mon, 01 Dec 2003 12:57:34 -0500
Message-ID: <1070301453.12807.100.camel@tiny.suse.com>
References: <Pine.LNX.4.10.10312011242140.8175-100000@alpha.bernztech.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16196-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.10.10312011242140.8175-100000@alpha.bernztech.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: bernz@bernztech.org
Cc: reiserfs-list@namesys.com

On Mon, 2003-12-01 at 12:43, David Bernick wrote:
> > My guess is the stats are being done across a large directory tree and
> > this is generating lots of atime updates.  You could mount -o
> > noatime,nodiratime, which will reduce the amount of work reiserfs does
> > on each stat.
> 
> thanks for the quick response. i'll try this tonight and report back. i
> totally didn't even think of doing that. that really might help a great
> deal.
> 
> Any other suggestions? 

The profile results would really allow us to pinpoint the problem.

-chris


