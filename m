From: David Bernick <bernz@alpha.bernztech.org>
Subject: Re: slow stat() ?
Date: Mon, 1 Dec 2003 12:43:18 -0500 (EST)
Message-ID: <Pine.LNX.4.10.10312011242140.8175-100000@alpha.bernztech.org>
References: <1070299845.12809.98.camel@tiny.suse.com>
Reply-To: bernz@bernztech.org
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16194-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1070299845.12809.98.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Cc: reiserfs-list@namesys.com

> My guess is the stats are being done across a large directory tree and
> this is generating lots of atime updates.  You could mount -o
> noatime,nodiratime, which will reduce the amount of work reiserfs does
> on each stat.

thanks for the quick response. i'll try this tonight and report back. i
totally didn't even think of doing that. that really might help a great
deal.

Any other suggestions? 

d

