From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH CFT] tons of logging patches
Date: 03 Jul 2002 16:56:11 -0400
Message-ID: <1025729771.5878.598.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10912-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <1025633764.5878.432.camel@tiny>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com

On Tue, 2002-07-02 at 14:16, Chris Mason wrote:
> 
> Hello again,
> 
> Yet another data logging patch is available (once the mirror updates)
> at:
> 
> ftp.suse.com/pub/people/mason/patches/data-logging
> 
> We're getting closer to stability here, so I'm very interested in
> workloads where the patch performs poorly.
> 
> New in 03-beta-data-logging-13.diff:

And a buffer list corruption bug of some kind.  I've pulled
beta-data-logging-13.diff until I track the bug down.  I'm heading off
to the mountains for the 4th of July holiday, so it be fixed until
monday.

-chris


