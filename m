From: Mirar <mirar-yg@mirar.org>
Subject: Re: power loss -> corruption
Date: 15 May 2003 10:40:00 +0200
Sender: mirar@orchid.mirar.org
Message-ID: <m1r87061sv.fsf@orchid.mirar.org>
References: <m1k7d11yaz.fsf@orchid.mirar.org>
	<200305081502.47455.Dieter.Nuetzel@hamburg.de>
	<m17k911sq4.fsf@orchid.mirar.org>
	<200305081531.13964.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14112-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200305081531.13964.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?iso-8859-1?q?Dieter_N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: reiserfs-list@namesys.com, Chris Mason <mason@suse.com>

> This _is_ very well known for me.
> Some KDE config files and my tcsh history file where broken without 
> data-logging (data=journal/ordered).

My .zsh-history just got nuked with data=ordered. 

The kernel couldn't agree with my HPT controller and stopped all (!)
IDE activities when I did a 'hdparm -y /dev/hd?' (all sleep). (Note,
the .zsh-history was not on that controller.)

Not in the same way as previously (just a block), though. It was
completely filled with binary data.

No other active files seems to have been affected, though.

/Mirar
