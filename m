From: Juan Quintela <quintela@mandrakesoft.com>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Thu, 20 Feb 2003 02:27:20 +0100
Message-ID: <86isvfg2rr.fsf@trasno.mitica>
References: <3E50B398.306B0AC7@interface-ag.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12842-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E50B398.306B0AC7@interface-ag.com> (Dirk Schenkewitz's
 message of "Mon, 17 Feb 2003 11:04:08 +0100")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dirk Schenkewitz <Dirk.Schenkewitz@interface-ag.com>
Cc: Reiserfs List <reiserfs-list@namesys.com>

>>>>> "dirk" == Dirk Schenkewitz <Dirk.Schenkewitz@interface-ag.com> writes:

Hi

dirk> Not at my system - I have (for example) a 16 Gig partition with
dirk> ext3 on it which is 100% full and has now 6100 kilobytes free space.
dirk> No Problem (with getting ENOSPC, I mean :-)).
dirk> Oh - wait a sec: do you usually reserve 5%-10% for the superuser?
dirk> That might explain why you get ENOSPC at 95%-90%, because that
dirk> reserved space is not taken into account... I normally tune the
dirk> fs to reserve 0% for the superuser. I never needed the reserved
dirk> space anyway.

that 5-10% is there not for the superuser (with today disks, that is
a lot of space).  I was also going to reduce the percentage, but then
somebody explained me that this porcentange needs to be free at all
times to maintain the fragmentation low.  And that makes a lot of
sense, the bigger the disk, the more free space you need to have low
fragmentation.

Later, Juan.

-- 
In theory, practice and theory are the same, but in practice they 
are different -- Larry McVoy
