From: Jeremy Allison <jra@samba.org>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 22:28:04 -0700
Message-ID: <20040827052804.GD2736@localhost.localdomain>
References: <20040826173227.GB1570@legion.cup.hp.com> <Pine.LNX.4.44.0408261416360.27909-100000@chimarrao.boston.redhat.com>
Reply-To: Jeremy Allison <jra@samba.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20875-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0408261416360.27909-100000@chimarrao.boston.redhat.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rik van Riel <riel@redhat.com>
Cc: Jeremy Allison <jra@samba.org>, Andrew Morton <akpm@osdl.org>, Spam <spam@tnonline.net>, wichert@wiggy.net, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

On Thu, Aug 26, 2004 at 02:17:04PM -0400, Rik van Riel wrote:
> On Thu, 26 Aug 2004, Jeremy Allison wrote:
> 
> > Because without kernel support there is no way someone can
> > publish a new metadata type and have it automatically supported
> > by all application data files (ie. most apps ignore it, and only
> > apps that are aware of it can see it).
> 
> So your backup software ignores it, and after a restore you've
> lost your new metadata ?

Yes, but then you fix your backup software and everyone lives
happily ever after :-)......

It's a better solution than changing *every single application
in existance* (the "userspace library" approach).

IMHO of course.

Jeremy.
