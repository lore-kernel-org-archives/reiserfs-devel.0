From: Oleg Drokin <green@namesys.com>
Subject: Re: Sleeping harddrives?
Date: Mon, 3 Jun 2002 14:02:01 +0400
Message-ID: <20020603140201.A6099@namesys.com>
References: <19839880843.20020602023406@tnonline.net> <20020602214927.A17000@namesys.com> <5231869796.20020602225651@tnonline.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10486-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <5231869796.20020602225651@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hello!

On Sun, Jun 02, 2002 at 10:56:51PM +0200, Anders Widman wrote:
> >>    How  would  ReiserFS  react  when  a user/program/anything tries to
> >>    access a file on a harddrive that is spin down?
> > Linux IDE/SCSI layer issupposed to spind the drive up.
> It  is  supposed  to,  yes.  When I tried this before, it did spin the
> drives up, but didn't wait enough before trying to access it, so I got
> strange errors.
> My question is simple. Is this something that still occur today?

At least it works for me on IDE.

Bye,
    Oleg
