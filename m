From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: New reiser4 snapshot (2003.09.12) is out
Date: Sat, 13 Sep 2003 22:12:45 -0400 (EDT)
Message-ID: <Pine.LNX.4.44.0309132208340.20356-100000@localhost.localdomain>
References: <20030913192123.GA24770@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15659-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030913192123.GA24770@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: Reiser FS mailing list <reiserfs-list@namesys.com>

On Sat, 13 Sep 2003, Oleg Drokin wrote:

> The problem turned out to be that RedHat's readline was compiled with ncurses
> dynamically, so when you link in readline, you need to link ncurses too.
> 
> Vitaly will release the fix to configure script shortly, I believe.

just to try to keep up with the adjustments so far, as i read it, there
are three fixes coming:

1) the above, to handle the ncurses link
2) a change to Kconfig, to prevent building reiser 4 as modules
3) a short patch to the reiser4progs file libmisc/exception.c

is it worth waiting for an updated snapshot directory at namesys?

rday

