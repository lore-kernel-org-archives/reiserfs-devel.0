From: Matt Stegman <matts@ksu.edu>
Subject: Re: Question on Reiser4 regarding power failures
Date: Mon, 29 Nov 2004 12:15:51 -0600 (CST)
Message-ID: <Pine.GSO.4.44L.0411291207020.615-100000@unix2.cc.ksu.edu>
References: <200411291025.11004.BernhardPrell@vantagefilm.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22618-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200411291025.11004.BernhardPrell@vantagefilm.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernhard Prell <BernhardPrell@vantagefilm.com>
Cc: reiserfs-list@namesys.com


> Will this really help to protect against partially written sectors and from
> there resulting read-errors (If a disk loses power while writing a sector the
> CRC-Check will fail and the disk reports an read-error that's not caused by a
> real hardware defect)? Changing the write cache strategy just "moves" the
> problem "in time" - maybe the propability that something happens is lower,
> because the amount of data that gets written at a certain point of time is
> smaller.

Aren't sector writes (512-byte sectors) on hard drives atomic?  I believe
they are, either all 512 bytes are written or none are.  The problem with
write caching is that when the kernel asks the drive to write sectors,
those sectors will end up in the write cache instead of going to disk, but
the disk will report them as written.  This is fast, but if the power is
lost before the cache is written to disk, then you've just lost your data
- up to the size of your drive's cache, anywhere from 256kB or less up to
8MB caches on late model drives - and the write cache makes no ordering
guarantees at all.  This pretty much negates the security of a journalling
filesystem, since it relies on knowing whether certain data was written to
the disk or not.

-- 
Matt Stegman


