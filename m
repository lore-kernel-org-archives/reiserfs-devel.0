From: Matthias Andree <ma@dt.e-technik.uni-dortmund.de>
Subject: Re: fsync() Performance Issue
Date: Mon, 29 Apr 2002 19:56:59 +0200
Message-ID: <m3adrmz8us.fsf@merlin.emma.line.org>
References: <93F527C91A6ED411AFE10050040665D0049BF961@corpusmx1.us.dg.com>
	<20020429162020.92AD93EA8@lyta.coker.com.au>
	<6tsqcu0887p2396p14cn2krqrhh1o0dhfk@4ax.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10199-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <6tsqcu0887p2396p14cn2krqrhh1o0dhfk@4ax.com> (Toby Dickenson's
 message of "Mon, 29 Apr 2002 17:32:39 +0100")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Toby Dickenson <tdickenson@geminidataloggers.com> writes:

> write to file A
> write to file B
> write to file C
> sync

Be careful with this approach. Apart from syncing other processes' dirty
data, sync() does not make the same guarantees as fsync() does.

Barring write cache effects, fsync() only returns after all blocks are
on disk. While I'm not sure if and if yes, which, Linux file systems are
affected, but for portable applications, be aware that sync() may return
prematurely (and is allowed to!).

-- 
Matthias Andree
