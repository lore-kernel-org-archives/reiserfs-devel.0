From: Oleg Drokin <green@namesys.com>
Subject: Re: New reiser4 snapshot (2003.09.12) is out
Date: Sat, 13 Sep 2003 12:52:01 +0400
Message-ID: <20030913085201.GA13272@namesys.com>
References: <20030913063124.GJ2123@backtop.namesys.com> <Pine.LNX.4.44.0309130437320.30756-100000@localhost.localdomain>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15643-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0309130437320.30756-100000@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: Alex Zarochentsev <zam@namesys.com>, Mike Benoit <mikeb@netnation.com>, reiserfs-list@namesys.com

Hello!

On Sat, Sep 13, 2003 at 04:38:01AM -0400, Robert P. J. Day wrote:

> > It is because of paranoid -Werror flag.  
> > ./configure --disable-werror will help you.
> > However, if your system will have readline (as on systems which are used by
> > reiser4progs developers :-) headers that warning disappear.
> my system definitely has readline installed, and i get the same error.

On the other hand, you need not only readline itself, but also its header files.
Lots of distributions (e.g. redhat-alike) form another package called (usuaully) readline-devel,
that contains this necessary stuff.

Bye,
    Oleg
