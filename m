From: Linus Torvalds <torvalds@osdl.org>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 10:32:46 -0700 (PDT)
Message-ID: <Pine.LNX.4.58.0408261030350.2304@ppc970.osdl.org>
References: <Pine.LNX.4.44.0408261315240.27909-100000@chimarrao.boston.redhat.com>
 <Pine.LNX.4.58.0408261019580.2304@ppc970.osdl.org> <20040826172703.GR5733@mail.shareable.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20740-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040826172703.GR5733@mail.shareable.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamie Lokier <jamie@shareable.org>
Cc: Rik van Riel <riel@redhat.com>, Diego Calleja <diegocg@teleline.es>, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com



On Thu, 26 Aug 2004, Jamie Lokier wrote:
> Linus Torvalds wrote:
> > 
> > No no. The stream you get from a directory is totally _independent_ of the 
> > contents of the directory. Anything else would be pointless.
> 
> Surely it depends on the directory?

Well, you _could_ make it do a "tar", but what's the point? That really 
doesn't add any value as far as user space is concerned.

Think of it this way: if the directory and the "default stream" associated 
with it aren't independent, then user space already has the information, 
and the stream is pointless. In fact, the stream is _worse_ than 
pointless, because it hides the fact that there is no independent 
information.

See my point? 

		Linus
