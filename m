From: Felipe Alfaro Solana <lkml@felipe-alfaro.com>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 27 Aug 2004 00:03:33 +0200
Message-ID: <200408270003.34686.lkml@felipe-alfaro.com>
References: <Pine.LNX.4.44.0408261416360.27909-100000@chimarrao.boston.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20822-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.44.0408261416360.27909-100000@chimarrao.boston.redhat.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rik van Riel <riel@redhat.com>
Cc: Jeremy Allison <jra@samba.org>, Andrew Morton <akpm@osdl.org>, Spam <spam@tnonline.net>, wichert@wiggy.net, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

On Thursday 26 August 2004 20:17, Rik van Riel wrote:
> On Thu, 26 Aug 2004, Jeremy Allison wrote:
> > Because without kernel support there is no way someone can
> > publish a new metadata type and have it automatically supported
> > by all application data files (ie. most apps ignore it, and only
> > apps that are aware of it can see it).
>
> So your backup software ignores it, and after a restore you've
> lost your new metadata ?

I think there's no easy way to fix this, except fixing the backup software to 
support xattrs's/streams/forks/whatever. Even on Windows, it has happened 
this way with older apps that don't support named streams.
