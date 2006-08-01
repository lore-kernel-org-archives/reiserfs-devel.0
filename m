From: David Masover <ninja@slaphack.com>
Subject: Re: Solaris ZFS on Linux [Was: Re: the " 'official' point of view"expressed
 by kernelnewbies.org regarding reiser4 inclusion]
Date: Tue, 01 Aug 2006 12:03:05 -0500
Message-ID: <44CF8949.707@slaphack.com>
References: <20060801034726.58097.qmail@web51311.mail.yahoo.com> <44CED777.5080308@slaphack.com> <Pine.LNX.4.63.0607312133080.15179@qynat.qvtvafvgr.pbz> <20060801064837.GB1987@thunk.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29406-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060801064837.GB1987@thunk.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Theodore Tso <tytso@mit.edu>, David Lang <dlang@digitalinsight.com>, David Masover <ninja@slaphack.com>, tdwebste2@yahoo.com, Nate Diller <nate.diller@gmail.com>, Adrian Ulrich <reiser4@blinkenlights.ch>, "Horst H. von Brand" <vonbrand@inf.utfsm.cl>, ipso@snappymail.ca, reiser@namesys.com, lkml@lpbproductions.com, jeff@garzik.org, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Theodore Tso wrote:

> Ah, but as soon as the repacker thread runs continuously, then you
> lose all or most of the claimed advantage of "wandering logs".
[...]
> So instead of a write-write overhead, you end up with a
> write-read-write overhead.

This would tend to suggest that the repacker should not run constantly, 
but also that while it's running, performance could be almost as good as 
ext3.

> But of course, people tend to disable the repacker when doing
> benchmarks because they're trying to play the "my filesystem/database
> has bigger performance numbers than yours" game....

So you run your own benchmarks, I'll run mine...  Benchmarks for 
everyone!  I'd especially like to see what performance is like with the 
repacker not running, and during the repack.  If performance during a 
repack is comparable to ext3, I think we win, although we have to amend 
that statement to "My filesystem/database has the same or bigger 
perfomance numbers than yours."
