From: Hendrik Visage <hvisage@envisage.co.za>
Subject: Re: [SPAM] Re: silent semantic changes with reiser4
Date: Fri, 27 Aug 2004 19:59:40 +0200
Message-ID: <20040827175940.GV17498@hvs.envisage.co.za>
References: <412EEB75.1030401@namesys.com> <Pine.LNX.4.44.0408271043090.10272-100000@chimarrao.boston.redhat.com> <1888171711.20040827171520@tnonline.net> <20040827154156.GA31757@mail.shareable.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20924-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040827154156.GA31757@mail.shareable.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamie Lokier <jamie@shareable.org>
Cc: Spam <spam@tnonline.net>, Rik van Riel <riel@redhat.com>, Hans Reiser <reiser@namesys.com>, David Masover <ninja@slaphack.com>, Linus Torvalds <torvalds@osdl.org>, Diego Calleja <diegocg@teleline.es>, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

On Fri, Aug 27, 2004 at 04:41:56PM +0100, Jamie Lokier wrote:
> 
> It is helpful for the OS, or a naming convention, to indicate what
> _is information_ though.
> 
> It makes no sense to backup two or more copies of the _same
> information_, and it makes even less sense to try to restore them as
> it'll either be slow, fail (you can't always write to alternative
> presentations), or cause unwanted side effects.

You sure you don't mean what is data (on disk) and what is information, ie.
interpretted data?

Following this whole threat is quite interesting, but I think there are
two things that need to be pointed out (which I might've missed) is that
hardlinks would be backed up multiple times if the archiver doesn't know
the semantics of the filesystem. This is the reason why the <fs-of-choice>dump
usually are faster than tar/cpio/etc. as they understand the low level and
can optimize at that level.

Also, a user might only have access to a certain subset of information, 
which he might to backup but not the rest of the stream/data, and such the
choice should be the user's.

> Just like when you backup a dynamic web site.  You store the files
> which the server is using.  You don't use "wget" to store the
> generated pages, that's not a useful backup and you can't restore from it.

That depends ;^)
But in the general case it's true.

