From: Chris Mason <mason@suse.com>
Subject: Re: Data-logging and md as / fs bug
Date: 07 May 2003 08:34:00 -0400
Message-ID: <1052310840.14616.344.camel@tiny.suse.com>
References: <3EB30852.6090402@netscape.net>
	 <200305062134.42520.christian.mayrhuber@gmx.net>
	 <1052250298.14612.235.camel@tiny.suse.com>
	 <200305062253.11535.christian.mayrhuber@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13983-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200305062253.11535.christian.mayrhuber@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On Tue, 2003-05-06 at 16:53, Christian Mayrhuber wrote:

> > Interesting, this isn't a known bug.  Could you please try two things:
> >
> > 1) try to reproduce without any patches past 06-write_times.diff applied
> > (in other words, without the quota)
> >
> > 2) try to reproduce with only 02-akpm-b_journal_head-1.diff and
> > 03-2.4.21-rc1-relocation-6.diff applied.

> The bug already appears in case 2) with akpm and relocation only applied.

I'd like to make sure I'm tracking the right problem.  Could you please
send me the exact kernel messages from the failed shutdown?

-chris


