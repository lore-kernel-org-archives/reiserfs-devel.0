From: Asheesh Laroia <asheesh@asheesh.org>
Subject: Re: OT: Recent spam
Date: Mon, 2 Jun 2003 09:02:27 -0400 (EDT)
Message-ID: <Pine.LNX.4.53.0306020857570.2635@renaissance>
References: <3EDAEEBE.3050202@netscape.net> <200306020833.40614.m.c.p@gmx.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14367-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200306020833.40614.m.c.p@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marc-Christian Petersen <m.c.p@gmx.net>
Cc: reiserfs-list <reiserfs-list@namesys.com>, Manuel Krause <manuelkrause@netscape.net>

I have a filter in procmail that precedes my spam filtering.  It goes like
this:

#----------------------------------------------------------------------
# eliminate duplicate messages.
#----------------------------------------------------------------------
:0 Wh: msgid.lock
| formail -D 32768 msgid.cache

This removes mails with duplicate Message-ID headers.  I think I got it
from the 'pgen' suite of Procmail tools.

It discards messages with duplicate Message-IDs, which has removed some
~25 spams or so from reiserfs-list for me in the past day or two.  The
first one hits my CaughtBySpamAssassin mail folder, and the other ones
just disappear.  It's quite nice.

Sorry for the off-topic discussion, Namesys.

-- Asheesh.

-- 
Q:	How many surrealists does it take to change a light bulb?
A:	Two, one to hold the giraffe, and the other to fill the bathtub
	with brightly colored machine tools.

	[Surrealist jokes just aren't my cup of fur.  Ed.]

On Mon, 2 Jun 2003, Marc-Christian Petersen wrote:

> On Monday 02 June 2003 08:29, Manuel Krause wrote:
>
> Hi Manuel,
>
> > Whats up with these rows of spam mails I receive from reiserfs list the
> > last days/weeks? Does this list spam itself now or what new anti-spam
> > algorithm did I miss?
> my offer to fix this for $25 is still open ;)
>
> ciao, Marc

