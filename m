From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: Separating Indexing and Searching (was silent semantic changes
 with reiser4)
Date: Mon, 30 Aug 2004 22:33:54 -0400 EDT
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <96515990355-BeMail@cr593174-a>
References: <4133DAFD.9060704@pobox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <4133DAFD.9060704@pobox.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Will Dyson <will_dyson@pobox.com>
Cc: linux-fsdevel@vger.kernel.org, reiserfs-list@namesys.com

Will Dyson wrote on Mon, 30 Aug 2004 21:57:17 -0400:
> I had a look. Cool stuff!

Thanks!

> That is a pretty awesome idea. It should be done in its own specialized
> filesystem though. QueryFS. If the change-notification mechanism in the
> kernel was robust enough (a big if), the rest could be done with a
> userspace filesystem (via FUSE). Mount a query, cd into it, run grep,
> write a little bash script... Very unixy.

That brings up a good point, should the queries be allowed to run across
file systems or be restricted to just one?  BeOS was restricted to one
file system (the query evaluation code was file system specific) and
faked it for multiple ones at the user level by repeating the query on
each FS.  A separate Query FS wouldn't have that limit (or could fake
it at the kernel level), if the kernel/FSs exported their indices and
change notifications.

- Alex
