From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiser4 / Reiserfs bonnie++ performance comparison
Date: Fri, 09 Jul 2004 22:17:57 -0700
Message-ID: <40EF7C05.8080604@namesys.com>
References: <20040709165924.27fabe63@philou.gramoulle.local> <1089406483.10745.3.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19569-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1089406483.10745.3.camel@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: redeeman@metanurb.dk
Cc: Reiserfs Mailinglist <reiserfs-list@namesys.com>

So one of the things that does not make sense to me in these benchmarks 
is that reiser4 with extents only is much slower than reiserfs V3 with 
notails at deletes.

Ideas anyone?

Is it maybe because V3 puts the directory entries for multiple 
directories near each other?  What happens when you delete one huge 
directory instead of a tree?
