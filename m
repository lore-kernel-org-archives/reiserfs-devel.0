From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Wed, 31 Mar 2004 18:16:16 +0200
Message-ID: <200403311816.16425.christian.mayrhuber@gmx.net>
References: <20040331155859.5866.qmail@web25009.mail.ukl.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17624-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040331155859.5866.qmail@web25009.mail.ukl.yahoo.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Wednesday 31 March 2004 17:58, Narcoleptic Electron wrote:

> No one in this thread has commented on "+" as the
> default meta directory name (one of the final
> contenders in our previous thread on the subject).
> Again, the reasons:
> - Short (one character)
> - Makes sense in all languages (meaning "additional
> information")
I don't agree. It only makes sense if you know that you a
searching for additional information.
If a novice user encounters a directory called '+' for the first time, not 
knowing there is meta information available in reiser4, this will result in
a bug report, for sure.

If I had to choose between '+' and 'metas' I'd go with 'metas'.

-- 
lg, Chris
