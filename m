From: David Masover <ninja@slaphack.com>
Subject: Re: has anyone installed SuSE 10.0 on reiser4?
Date: Tue, 25 Oct 2005 16:50:33 -0500
Message-ID: <435EA8A9.4090807@slaphack.com>
References: <435E75AC.8090500@namesys.com> <200510251658.48802.rjoffe@yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26638-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200510251658.48802.rjoffe@yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ron Joffe <rjoffe@yahoo.com>
Cc: reiserfs-list@namesys.com

Ron Joffe wrote:
> On Tuesday 25 October 2005 14:13, Hans Reiser wrote:
> 
>>If yes, what steps did you take to do it?
> 
> 
> Not quite there yet, but would like to test it out.
> 
> Hans, could you give a status of Reiser4. I have seen allot of different 
> issues on the maillist, but not a "status" of where the overall project 
> stands.

Status:  Released, for awhile now.

Not for mission-critical apps, as it hasn't been hammered by millions of 
users for a couple of years the way Reiser3 and ext3 have.

Missing a few features, some due to time constraints, some due to 
attempts to get into the mainstream kernel.  Probably all of them will 
get in eventually, it will just take some time.

No idea on kernel inclusion progress.  I've been out of the loop on that 
for some time, due to a fried network card in my mailserver and a 
general lack of interest.

On-disk format is stable, or if it's not, it's backwards-compatible, 
because I haven't formatted for months.

Main performance issues are fsync and the lack of a repacker.

Hans (and others), correct me if I'm wrong about any of that.




For my purposes, it's stable enough for me to use for all of my FSes, 
except NTFS for Windows and HFS+ for OS X.  The biggest problem I've 
ever had since release was related to both hardware and my own 
stupidity, and the undelete feature got me back on my feet pretty 
quickly.  I think the net loss was my copy of Star Wars.
