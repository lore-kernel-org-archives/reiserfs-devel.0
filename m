From: Jamie Lokier <jamie@shareable.org>
Subject: Re: [SPAM] Re: silent semantic changes with reiser4
Date: Fri, 27 Aug 2004 16:41:56 +0100
Message-ID: <20040827154156.GA31757@mail.shareable.org>
References: <412EEB75.1030401@namesys.com> <Pine.LNX.4.44.0408271043090.10272-100000@chimarrao.boston.redhat.com> <1888171711.20040827171520@tnonline.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20921-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1888171711.20040827171520@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Spam <spam@tnonline.net>
Cc: Rik van Riel <riel@redhat.com>, Hans Reiser <reiser@namesys.com>, David Masover <ninja@slaphack.com>, Linus Torvalds <torvalds@osdl.org>, Diego Calleja <diegocg@teleline.es>, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

Spam wrote:
> > The problem is more fundamental than that.  Some of the
> > file streams proposed need to be backed up, while others
> > are alternative presentations of the file, which should
> > not be backed up.
> 
>   No, not really. This is a user decision and should be options in the
>   backup  software.  I don't think it is up to the kernel, filesystem,
>   or  the  OS  in  general to decide what information the user want to
>   retain or not.

It is helpful for the OS, or a naming convention, to indicate what
_is information_ though.

It makes no sense to backup two or more copies of the _same
information_, and it makes even less sense to try to restore them as
it'll either be slow, fail (you can't always write to alternative
presentations), or cause unwanted side effects.

Just like when you backup a dynamic web site.  You store the files
which the server is using.  You don't use "wget" to store the
generated pages, that's not a useful backup and you can't restore from it.

> > Currently I see no way to distinguish between the stuff
> > that should be backed up and the stuff that shouldn't.
> 
> > That problem needs to be resolved before we can even start
> > thinking about fixing archivers...
> 
>   The  archivers  should,  as  I  said,  allow  the user to choose. It
>   shouldn't be automatic. Default, should IMO be to store everything.

Don't try to store different views of the same thing.
When you try to restore, you _won't_ necessarily get back what you stored.

Whereas if you follow the OS's advice, and skip virtual files, then
backup and restore will recreate the filesystem, which is what you want.

_That's_ storing everything.  It's what you want from a backup.

-- Jamie
