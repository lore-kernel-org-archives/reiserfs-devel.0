From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: power loss -> corruption
Date: Thu, 8 May 2003 15:31:13 +0200
Message-ID: <200305081531.13964.Dieter.Nuetzel@hamburg.de>
References: <m1k7d11yaz.fsf@orchid.mirar.org> <200305081502.47455.Dieter.Nuetzel@hamburg.de> <m17k911sq4.fsf@orchid.mirar.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14017-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <m17k911sq4.fsf@orchid.mirar.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mirar <mirar-yg@mirar.org>
Cc: reiserfs-list@namesys.com, Chris Mason <mason@suse.com>

Am Donnerstag, 8. Mai 2003 15:19 schrieb Mirar:
> > Maybe you can preset some corrupted file snippets?
>
> I'll see if I can dig up any good.

OK, I think it is not needed ;-)

> But I can give examples, for instance .zsh-history with 65536 bytes of
> illicit data inserted in the middle - 65536 bytes of which 63898 comes
> from a gtk-gnutella file (downloads, I think) and the remaining 1638
> is NUL characters. Both files were corrupted after restart, but
> gtk-gnutella ate it's file so I can't check how it looked.
> Lots of things like that. The numbers are so even so I would figure
> that the wrong blocks get in the wrong files somehow.

This _is_ very well known for me.
Some KDE config files and my tcsh history file where broken without 
data-logging (data=journal/ordered).

ReiserFS 3.5/3.6 offer metadata journaling.
For data journaling you _need_ data-logging.

See Chris latest announcement "new data logging patches available".
ftp.suse.com/pub/people/mason/patches/data-logging/2.4.21

Regards,
	Dieter
