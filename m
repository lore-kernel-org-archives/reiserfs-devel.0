From: Anders Widman <andewid@tnonline.net>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Thu, 20 Feb 2003 10:03:44 +0100
Message-ID: <192422937.20030220100344@tnonline.net>
References: <3E50B398.306B0AC7@interface-ag.com> <86isvfg2rr.fsf@trasno.mitica>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12844-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <86isvfg2rr.fsf@trasno.mitica>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com



> that 5-10% is there not for the superuser (with today disks, that is
> a lot of space).  I was also going to reduce the percentage, but then
> somebody explained me that this porcentange needs to be free at all
> times to maintain the fragmentation low.  And that makes a lot of
> sense, the bigger the disk, the more free space you need to have low
> fragmentation.

That   is   "free"  space  that  needs  to  be  free  to  lessen  the
fragmentation.  All  the users won't see this free space - and you end
up with high fragmentation anyway?





