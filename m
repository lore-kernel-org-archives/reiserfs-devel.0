From: Oleg Drokin <green@namesys.com>
Subject: Re: BTW: 2.4.19-patches-to-come?
Date: Wed, 8 May 2002 17:08:45 +0400
Message-ID: <20020508170845.A3020@namesys.com>
References: <3CD72AB1.6010607@netscape.net> <20020507092207.A6678@namesys.com> <3CD82C76.2080706@netscape.net> <20020508093044.A32071@namesys.com> <1020863090.32044.202.camel@tiny>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10285-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <1020863090.32044.202.camel@tiny>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <mason@suse.com>
Cc: Manuel Krause <manuelkrause@netscape.net>, reiserfs-list <reiserfs-list@namesys.com>

Hello!

On Wed, May 08, 2002 at 09:04:50AM -0400, Chris Mason wrote:
> > > I don't find this information very explicative. And I really don't know
> > > enough about reiserfs code to interprete these lines. BTW, can we have a
> > > "ReiserFS: " in front of these messages?
> > In fact I think these messages should not be printed at all, there is no
> > useful information given to the user.
> I like a summary line: completed X number of truncates and N number of
> deletes.

This one can stay, but I am not yet sure we need it anyway.
I think we should only print this stuff (keys of individual deleted objects
and total number of late deletions/truncates) if CONFIG_REISERFS_CHECK
was enabled, what do you think?

Bye,
    Oleg
