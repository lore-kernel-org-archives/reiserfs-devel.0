From: Oleg Drokin <green@namesys.com>
Subject: Re: using reiserfs as a DB
Date: Mon, 22 Apr 2002 17:20:09 +0400
Message-ID: <20020422172009.A1109@namesys.com>
References: <20020421205328.GA8407@vega.ipal.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10120-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020421205328.GA8407@vega.ipal.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Phil Howard <phil-reiserfs@ipal.net>
Cc: reiserfs-list@namesys.com

Hello!

On Sun, Apr 21, 2002 at 03:53:28PM -0500, Phil Howard wrote:
> Given the balanced tree directory structure of reiserfs, it seems it
> could be usable as a DB in place of a DB library (such as Berkeley DB).
> Has anyone done any timing/benchmarks of reiserfs used as a replacement
> for a DB library, as compared to one such as Berkeley DB?  There would
> be an advantage to using conventional file tools to access the data
> instead of having to code some up for a DB library.  The issue would
> certainly involve the open/read/close timings for reiserfs for each
> piece of data accessed.  The uses for which I have an interest in doing
> this would most be small data, usually less than 128 bytes, and almost
> always less than 512 bytes.  For example, one use involves indexing a
> lot of (100s to maybe even 1000000) URLs under special short keywords.

I do not have any numbers, but take in account that while DB database
generally have to updata atime/mtime/ctime on only 3 files (or even 2),
in case of a filesystem each file accessed will change atime and/or mtime/ctime.

(you can turn off atime updates of course). Also directory lookups ain't going
to be free either.
I've not heard of a test like you are describing, so feel free to implement
one that will suit all your needs.

But I remember that squid people decided lookup/open/close operations are
too expensive for them and raw reiserfs access was born, where you was able
directly access filesystems objects by the keys. 

Bye,
    Oleg
