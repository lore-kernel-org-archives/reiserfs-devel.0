From: Mirar <mirar-yg@mirar.org>
Subject: Re: power loss -> corruption
Date: 08 May 2003 15:19:15 +0200
Sender: mirar@orchid.mirar.org
Message-ID: <m17k911sq4.fsf@orchid.mirar.org>
References: <m1k7d11yaz.fsf@orchid.mirar.org>
	<200305081348.42359.Dieter.Nuetzel@hamburg.de>
	<m1fznp1w3a.fsf@orchid.mirar.org>
	<200305081502.47455.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14014-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200305081502.47455.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?iso-8859-1?q?Dieter_N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: reiserfs-list@namesys.com

> Maybe you can preset some corrupted file snippets?

I'll see if I can dig up any good. 

But I can give examples, for instance .zsh-history with 65536 bytes of
illicit data inserted in the middle - 65536 bytes of which 63898 comes
from a gtk-gnutella file (downloads, I think) and the remaining 1638
is NUL characters. Both files were corrupted after restart, but
gtk-gnutella ate it's file so I can't check how it looked.

Lots of things like that. The numbers are so even so I would figure
that the wrong blocks get in the wrong files somehow.

/Mirar
