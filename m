From: Oleg Drokin <green@namesys.com>
Subject: Re: New reiser4 snapshot (2003.09.12) is out
Date: Sat, 13 Sep 2003 23:21:23 +0400
Message-ID: <20030913192123.GA24770@namesys.com>
References: <20030913063124.GJ2123@backtop.namesys.com> <Pine.LNX.4.44.0309130437320.30756-100000@localhost.localdomain> <20030913085201.GA13272@namesys.com> <3F632446.30004@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15653-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3F632446.30004@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: "Robert P. J. Day" <rpjday@mindspring.com>, Alex Zarochentsev <zam@namesys.com>, Mike Benoit <mikeb@netnation.com>, reiserfs-list@namesys.com

Hello!

On Sat, Sep 13, 2003 at 06:05:58PM +0400, Hans Reiser wrote:
> >>my system definitely has readline installed, and i get the same error.
> >On the other hand, you need not only readline itself, but also its header 
> >files.
> >Lots of distributions (e.g. redhat-alike) form another package called 
> >(usuaully) readline-devel,
> >that contains this necessary stuff.
> did you adjust our headers to be redhat compatible?  If not, please do.

The problem turned out to be that RedHat's readline was compiled with ncurses
dynamically, so when you link in readline, you need to link ncurses too.

Vitaly will release the fix to configure script shortly, I believe.

Bye,
    Oleg
