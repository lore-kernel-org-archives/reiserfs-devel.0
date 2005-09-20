From: Theodore Ts'o <tytso@mit.edu>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Tue, 20 Sep 2005 13:57:28 -0400
Message-ID: <20050920175727.GA17820@thunk.org>
References: <200509182004.j8IK4JNx012764@inti.inf.utfsm.cl> <432E5024.20709@namesys.com> <20050920075133.GB4074@elf.ucw.cz> <43301FA0.7030906@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-26140-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <43301FA0.7030906@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: Pavel Machek <pavel@suse.cz>, Hans Reiser <reiser@namesys.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, thenewme91@gmail.com, Christoph Hellwig <hch@infradead.org>, Denis Vlasenko <vda@ilport.com.ua>, chriswhite@gentoo.org, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

On Tue, Sep 20, 2005 at 09:41:36AM -0500, David Masover wrote:
> And personally, if it was my FS, I'd stop working on fsck after it was 
> able to "check".  That's what it's for.  To fix an FS, you wipe it and 
> restore from backups.

If that's Reiser4's philosophy, just make sure you tell all of your
prospective users about ahead of time.  Is it really an explicit goal
that performance is so important beyond all other considerations that
it's OK if the filesystem is extremely fragile and that if anything
goes wrong, you have to wipe things and recover from backups?!?

I just want to make sure that's the official word and reflects the
official philosophy of the reiser4 designers before I start telling
users that this is a good reason to avoid reiser4 like the plague.
(Ted's Observation of PC-Class Hardware: Most PC-Class hardware is
sh*t.)  I know of many very ext3 filesystem users that choose it
_precisely_ because it does its best to keep as much data safe as
possible after hardware failures or kernel bugs.

(And yes, I tell them to keep backups, etc., but unfortunately backups
are not always as up to date as we would like.  And RAID doesn't help
if you have raid controller failures or kernel bugs or memory
problems.)

I'm not saying that this is a reason not to accept resier4 into
mainline; there are people who don't mind doing backups every 3 hours
or something like that (although I would wonder if the need to do
frequent backups because a filesystem is fragile would interfere with
performance in real-life situations).  But people should know about
such tradeoffs before selecting for their own use.

						- Ted
