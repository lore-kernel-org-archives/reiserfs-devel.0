From: Chris Mason <mason@suse.com>
Subject: Re: data=ordered patch for 2.6.5?
Date: Mon, 05 Apr 2004 09:00:30 -0400
Message-ID: <1081170030.3547.377.camel@watt.suse.com>
References: <20040404234544.GA9905@zero>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17718-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040404234544.GA9905@zero>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tom Vier <tmv@comcast.net>
Cc: reiserfs-list@namesys.com

On Sun, 2004-04-04 at 19:45, Tom Vier wrote:
> i looked through all linus's changelogs for .4->.5. i see a few fixes, but
> nothing about ordering. i thought it was going in soon. will it be in .6? i
> guess for .5 i'll have to wait for chris mason to make a patch set.

Right, these are in testing in the -mm tree only right now.  Since there
hasn't been a single bug report, it might be time to send them in during
2.6.5-pre.  I'll ask Andrew how he feels about it.

-chris


