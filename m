From: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 02:51:22 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0408260233400.29842@artax.karlin.mff.cuni.cz>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com>
 <20040825200859.GA16345@lst.de> <Pine.LNX.4.58.0408251314260.17766@ppc970.osdl.org>
 <Pine.LNX.4.58.0408260204050.22259@artax.karlin.mff.cuni.cz>
 <Pine.LNX.4.58.0408251723540.17766@ppc970.osdl.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20554-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.58.0408251723540.17766@ppc970.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@osdl.org>
Cc: Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

> > The only way xattrs are useful is that backup/restore software doesn't
> > have to know about every filesystem with it's specific attributes and
> > every magic ioctl for setting them. Instead it can save/restore
> > filesystem-specific attributes without understanding what do they mean.
> > However there's no need why application should use them. And no
> > application does.
>
> If no application does, then why back them up? Why implement them in the
> first place?
>
> In other words - some apps obviously do want to use the. Sadly.

You can add more functionality to filesystem and use xattrs to control it.
For example:
- acls
- compress file
- encrypt file (copy user's password into task_struct and use it to
encrypt his files)
- preallocate file in 4MB contignuous chunks, becuase it needs real time
multimedia access
- sync/append-only/immutable
etc.
However there's no need why an application should care whether the file is
compressed, whether it has acls, or so. And applications don't.

And I think this is the only legitimate use for xattrs. Who else uses them
except samba? I don't see how reiser4's hybrids would help.

Mikulas
