From: Soeren Sonnenburg <reiserfs@nn7.de>
Subject: Re: How to build a big file server
Date: 05 Jun 2003 19:01:10 +0200
Message-ID: <1054832470.3652.75.camel@localhost>
References: <1054800852.1997.15.camel@wusel.schnulli.de>
	 <20030605090435.GE7950@namesys.com>
	 <1054804624.1997.39.camel@wusel.schnulli.de>
	 <200306052029.41437.russell@coker.com.au>
	 <1054809903.1995.83.camel@wusel.schnulli.de>  <3EDF7424.7010003@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14457-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EDF7424.7010003@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>
Cc: Heinz-Josef Claes <hjclaes@web.de>, Russell Coker <russell@coker.com.au>, reiserfs-list@namesys.com

On Thu, 2003-06-05 at 18:47, Carl-Daniel Hailfinger wrote:
> Heinz-Josef Claes wrote:
> >From the debian web page:
> >
> > http://packages.debian.org/testing/utils/storebackup.html
> >
> > File comparisons are done with MD5 checksums, so no changes go
> > unnoticed.
> 
> If you believe the last sentence, I have a bridge to sell.
> 
> To be more exact: MD5 is a 128=2^7 bit hash. Assuming a file length of 4kB
> = 2^8*4096=2^20 bits, approximately 2^(2^(20-7))= 2^8192= 10^2457
> different files have the same hash.
> 
> That's right: for a given MD5 hash, there are more different files with
> 4kB size sharing the same hash than the count of atoms in the whole
> universe. If the files are larger, it gets worse.
> 
> md5sum(1) is not diff(1). Most of the time, it will suffice as el cheapo
> replacement, but for backups it's definitely horrible. You don't store
> your backup tapes in the microwave, do you?

you forget one thing: how likely is it that a file with MD5SUM A turns
into a a file which has the same MD5SUM A. I would guess that that kind
of file corruption has a likelihood of very close to zero.

S.

