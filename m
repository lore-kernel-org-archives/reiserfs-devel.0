From: Chris Mason <mason@suse.com>
Subject: Re: fsync() Performance Issue
Date: 06 May 2002 22:04:56 -0400
Message-ID: <1020737096.988.86.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10273-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <3CD72B37.2010408@mb.tu-ilmenau.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list <reiserfs-list@namesys.com>

On Mon, 2002-05-06 at 21:17, Manuel Krause wrote:
> On 05/07/2002 12:57 AM, Chris Mason wrote:
>
> 
> Hi, Chris & Hans!
> 
> Don't think this somekind of destructive discussion would lead to 
> anything useful for now, can you post a diff for 
> 2.4.19-pre7+latest-related-pending +compound-patch-from-ftp?
> 
> I'll try it and report if that leads to more security and/or less 
> performance on my every day use with NS6 and so on if there is any.

The current data logging patches are at:

ftp.suse.com/pub/people/mason/patches/data-logging

They are against 2.4.19-pre7, and contain versions of the major (stable)
speedups.  The patch is pretty big, so I'm not likely to merge with the
namesys pending directories.  The namesys guys add things frequently,
and I think it would get confusing for people trying to figure out which
patches to apply.

The data logging stuff is beta code, if you have a good test bed where
it's ok if things go wrong I can make you a special patch with the
pending stuff merged.

-chris




