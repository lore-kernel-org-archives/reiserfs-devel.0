From: Alexander Lyamin <flx@msu.ru>
Subject: Re:  silent semantic changes with reiser4
Date: Sun, 29 Aug 2004 19:00:41 +0400
Message-ID: <20040829150041.GD9471@alias>
References: <Pine.LNX.4.44.0408271043090.10272-100000@chimarrao.boston.redhat.com> <412F7D63.4000109@namesys.com>
Reply-To: flx@msu.ru
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21059-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <412F7D63.4000109@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Rik van Riel <riel@redhat.com>, David Masover <ninja@slaphack.com>, Linus Torvalds <torvalds@osdl.org>, Diego Calleja <diegocg@teleline.es>, jamie@shareable.org, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

Fri, Aug 27, 2004 at 11:28:51AM -0700, Hans Reiser wrote:
> Rik van Riel wrote:
> 
> >
> >
> >Currently I see no way to distinguish between the stuff
> >that should be backed up and the stuff that shouldn't.
> >
> > 
> >
> We create filename/pseudos/backup, and that tells the archiver what to 
> do.....

its ugly idea.

representations should be distinguished from sources. and its reasonably
to put this distinguisher somewhere in namespace. but filename/pseudos/backup
is plain ugly.
-- 
"the liberation loophole will make it clear.."
lex lyamin
