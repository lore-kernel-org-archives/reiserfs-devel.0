From: David Masover <ninja@slaphack.com>
Subject: Re: Solaris ZFS on Linux [Was: Re: the " 'official' point of view"
 expressed by kernelnewbies.org regarding reiser4 inclusion]
Date: Mon, 31 Jul 2006 23:24:23 -0500
Message-ID: <44CED777.5080308@slaphack.com>
References: <20060801034726.58097.qmail@web51311.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29363-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060801034726.58097.qmail@web51311.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: tdwebste2@yahoo.com
Cc: Theodore Tso <tytso@mit.edu>, Nate Diller <nate.diller@gmail.com>, David Lang <dlang@digitalinsight.com>, Adrian Ulrich <reiser4@blinkenlights.ch>, "Horst H. von Brand" <vonbrand@inf.utfsm.cl>, ipso@snappymail.ca, reiser@namesys.com, lkml@lpbproductions.com, jeff@garzik.org, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Timothy Webster wrote:
> Different users have different needs.

I'm having trouble thinking of users who need an FS that doesn't need a 
repacker.

The disk error problem, though, you're right -- most users will have to 
get bitten by this, hard, at least once, or they'll never get the 
importance of it.  But it'd be nice if it's not too hard, and we can 
actually recover most of their files.

Still, I can see most people who are aware of this problem using RAID, 
backups, and not caring if their filesystem tolerates bad hardware.

> The problem I see is managing disk errors.

I see this kind of the same way.  If your disk has errors, you should be 
getting a new disk.  If you can't do that, you can run a mirrored RAID 
-- even on SATA, you should be able to hotswap it.

Even for a home/desktop user, disks are cheap, and getting cheaper all 
the time.  All you have to do is run the mean time between failure 
numbers by them, and ask them if their backup is enough.

> And perhaps a
> really good clustering filesystem for markets that
> require NO downtime. 

Thing is, a cluster is about the only FS I can imagine that could 
reasonably require (and MAYBE provide) absolutely no downtime. 
Everything else, the more you say it requires no downtime, the more I 
say it requires redundancy.

Am I missing any more obvious examples where you can't have enough 
redundancy, but you can't have downtime either?
