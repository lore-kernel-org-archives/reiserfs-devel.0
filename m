From: Chris Mason <mason@suse.com>
Subject: Re: BTW: 2.4.19-patches-to-come?
Date: 08 May 2002 09:16:15 -0400
Message-ID: <1020863775.32044.208.camel@tiny>
References: <3CD72AB1.6010607@netscape.net>
	<20020507092207.A6678@namesys.com> <3CD82C76.2080706@netscape.net>
	<20020508093044.A32071@namesys.com> <1020863090.32044.202.camel@tiny> 
	<20020508170845.A3020@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10287-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020508170845.A3020@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: Manuel Krause <manuelkrause@netscape.net>, reiserfs-list <reiserfs-list@namesys.com>

On Wed, 2002-05-08 at 09:08, Oleg Drokin wrote:
> Hello!
> 
> On Wed, May 08, 2002 at 09:04:50AM -0400, Chris Mason wrote:
> > > > I don't find this information very explicative. And I really don't know
> > > > enough about reiserfs code to interprete these lines. BTW, can we have a
> > > > "ReiserFS: " in front of these messages?
> > > In fact I think these messages should not be printed at all, there is no
> > > useful information given to the user.
> > I like a summary line: completed X number of truncates and N number of
> > deletes.
> 
> This one can stay, but I am not yet sure we need it anyway.
> I think we should only print this stuff (keys of individual deleted objects
> and total number of late deletions/truncates) if CONFIG_REISERFS_CHECK
> was enabled, what do you think?

I like the single line summary, it helps for things like Dirk Mueller's
problem report.  'every time my system <explodes into a ball of flame>,
it is preceded by messages about some number of completed truncates or
unlinks'.

It might point us in the wrong direction, but it is still good
information to have.

-chris


