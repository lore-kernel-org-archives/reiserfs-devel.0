From: Jamie Lokier <jamie@shareable.org>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 22:24:11 +0100
Message-ID: <20040826212411.GG5733@mail.shareable.org>
References: <45010000.1093553046@flay> <Pine.LNX.4.58.0408261348500.2304@ppc970.osdl.org> <57730000.1093554054@flay> <Pine.LNX.4.58.0408261402400.2304@ppc970.osdl.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20812-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0408261402400.2304@ppc970.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@osdl.org>
Cc: "Martin J. Bligh" <mbligh@aracnet.com>, Rik van Riel <riel@redhat.com>, Diego Calleja <diegocg@teleline.es>, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

Linus Torvalds wrote:
> In other words, the "directory" part is just a _view_ into the file. A
> view that potentially exposes a lot _more_ of the file, but we're still
> talking about the same file.
> 
> In contrast, a S_IFDIR-like _directory_ is something else entirely. When 
> you view the things in that, you aren't looking at data "inside" the 
> directory. You're looking at somethign totally independent.

One of the constraints is that you can create any name in an
S_IFDIR-like directory, but you probably can't create any name "in" an
S_IFREG-like file, because the names have meaning -- except in
designated subtrees of the view intended for holding arbitrary names.

-- Jamie
