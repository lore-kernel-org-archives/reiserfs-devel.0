From: Christophe Saout <christophe@saout.de>
Subject: Re: Recent spam
Date: 08 Jun 2003 22:05:17 +0200
Message-ID: <1055102717.11256.7.camel@chtephan.cs.pocnet.net>
References: <3EDAEEBE.3050202@netscape.net>
	 <20030608231340.A11612@t-raenon.nmd.msu.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14496-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030608231340.A11612@t-raenon.nmd.msu.ru>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: flx@msu.ru
Cc: Manuel Krause <manuelkrause@netscape.net>, reiserfs-list <reiserfs-list@namesys.com>

Am Son, 2003-06-08 um 21.13 schrieb Alexander Lyamin:

> > Whats up with these rows of spam mails I receive from reiserfs list the 
> > last days/weeks? Does this list spam itself now or what new anti-spam 
> > algorithm did I miss?
> 
> along with line-noise, could someone give a hint how to teach EZMLM
> to  dont mangle Recieved: headers ? 

Well, just a little googleing and grepping in the sources...

it turns out that ezmlm-send needs to get -r as parameter (as opposed to
the default -R that tells it to strip the Received headers on outgoing
messages).

So edit the blablabla/reiserfs-list/editor file and add a -r to the line
with ezmlm-send. If you use ezmlm-idx you will have to add it to the lines
with ezmlm-gate, ezmlm-store and and ezmlm-moderate instead (the last one
should be found in the file blablabla/moderate, if moderation is actived).
The are calling ezmlm-send and pass through the parameter.

So this *really* should be a fairly small change. BTW: Funny discussion
(well, funny to read, but not so funny at all...)

-- 
Christophe Saout <christophe@saout.de>

