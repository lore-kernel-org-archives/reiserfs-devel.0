From: Christian Iversen <chrivers@iversen-net.dk>
Subject: Re: The situation at hand and in the future
Date: Sat, 5 Jun 2004 12:07:43 +0200
Message-ID: <200406051207.43706.chrivers@iversen-net.dk>
References: <20040527200127.GS4990@nysv.org> <40C1510F.5020608@slaphack.com> <200406050730.i557UouE026516@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19032-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200406050730.i557UouE026516@turing-police.cc.vt.edu>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Saturday 05 June 2004 09:30, Valdis.Kletnieks@vt.edu wrote:
> On Fri, 04 Jun 2004 23:50:23 CDT, David Masover said:
> > Or suppose we simply don't want people to have to wait 2-3 times as long
> > for a level to load, or for the game to load.  Games tend to be huge
> > apps these days (or at least have a huge amount of content to load at
> > once).  Every few minutes (or 5-10 mins) in ut2004, the server changes
> > levels.  The levels currently take 15-30 seconds to load, most of it
> > pure disk activity.
>
> Proper programming would probably render encryption almost-zero overhead.
> Except for really high-end disk subsystems, you're not going to get an
> *effective* (i.e. after seeks and rotational delay and all that) throughput
> of much over 40 megabytes/second - and encrypting/decrypting at 40
> megabytes/second on modern hardware should be a no-brainer if you are
> sensible about key scheduling and the like.
>
> The only remaining point is to make sure you overlap the CPU and I/O
> operations. If you wait for it to read in all 14 megabytes and then
> decrypt, it will be slow. If you have enough sense to decrypt the first 64K
> while the next 64K is reading, and so on, it should be nearly un-noticable.

This will fix the problem of throughput, but wont it give a significant 
latency?

-- 
Regards,
Christian Iversen
