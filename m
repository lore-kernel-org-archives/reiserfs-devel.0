From: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>
Subject: Re: Catastrophe with mailboxes on ReiserFS
Date: Thu, 10 Oct 2002 01:07:53 +0200
Message-ID: <m3u1jvw6ra.fsf@merlin.emma.line.org>
References: <20021009094215.B11954@namesys.com>
	<Pine.LNX.4.44.0210091041350.880-100000@fii.fi.tartu.ee>
	<20021009121811.A22948@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11638-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021009121811.A22948@namesys.com> (Oleg Drokin's message of
 "Wed, 9 Oct 2002 12:18:11 +0400")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Oleg Drokin <green@namesys.com> writes:

> BTW, I just remembered that until you apply Chris' Mason "data logging" patches,
> there is a certain window where system crash would lead to "deleted" 
> data appearing at the end of files that were appended before the
> crash.

I'd like to see these patches merged. I hurt myself several times with
reiserfs, when the computer locked up during heavy file system activity,
with NUL blocks in files, files mixed up and the like. I've never seen
this on any data=ordered or data=journal file system, regardless of ext3
or reiserfs.

Of course, write caches must be turned of or write barrier patches be
applied to be safe in case of a power blackout.

-- 
Matthias Andree
