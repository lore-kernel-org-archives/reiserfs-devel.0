From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Wed, 31 Mar 2004 10:27:30 +0200
Message-ID: <200403311027.30359.christian.mayrhuber@gmx.net>
References: <20040330123546.GA5229@nysv.org> <200403301513.01851.christian.mayrhuber@gmx.net> <87hdw5vifk.fsf@uhoreg.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17614-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87hdw5vifk.fsf@uhoreg.ca>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Wednesday 31 March 2004 04:50, Hubert Chan wrote:
> >>>>> "Christian" == Christian Mayrhuber <christian.mayrhuber@gmx.net>
> >>>>> writes:
>
> Christian> What about introducing an separator for meta information,
> Christian> like it is / for directories.  This separator could be turned
> Christian> into a mount option to avoid breakage of some apps.
>
> Christian> My suggestion is "@" to become the default separator, because
> Christian> XPath uses it for attributes and it is THE accepted standard
> Christian> so far.  Filesystems are just a new domain. ...
>
> That effectively kills all filenames that contain @, much worse than
> just a "metas" conflict IMHO.

Well, that's a matter of taste.
The most important thing is that once there is an access pattern to meta
information it is the same for all filesystems on Linux.

-- 
lg, Chris
