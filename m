From: Tom Vier <tmv@comcast.net>
Subject: Re: Plugin for corruption resistance?
Date: Fri, 11 Feb 2005 15:53:50 -0500
Message-ID: <20050211205350.GA13345@zero>
References: <e692861c05021110583585f84e@mail.gmail.com>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <e692861c05021110583585f84e@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gregory Maxwell <gmaxwell@gmail.com>
Cc: reiserfs-list@namesys.com

On Fri, Feb 11, 2005 at 01:58:59PM -0500, Gregory Maxwell wrote:
> 1. Lots of applications today (such a P2P sharing systems) need the
> hashes of files.. it's inefficient to keep recomputing them.  The file
> system always knows when a file changes, so it can be setup to always
> return the correct hash.

That should be done in userland, imho. Especially since different apps use
lots of different hashes.

I was thinking about this kind of stuff (ECC plugin for r4) not too long
ago. Hashing the whole file is too slow; if you update a single block, the
whole file has to be read in to recalculate. Adding, say, one sector of crc
for each block would be a lot more feasible.

I think the best way to do this though, would be to write a virtual blk
driver that works like loop back (ie, uses a backing file/dev), and shortens
the overall size by one sector * number of blocks. Actually, you could
probably copy the raid5 md code and rewrite it to only use one device. I'd
try that first.

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0x15741ECE
