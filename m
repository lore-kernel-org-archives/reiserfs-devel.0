From: Christoph Hellwig <hch@infradead.org>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 27 Aug 2004 10:19:56 +0100
Message-ID: <20040827101956.B29672@infradead.org>
References: <Pine.LNX.4.58.0408261217140.2304@ppc970.osdl.org> <Pine.LNX.4.44.0408261607070.27909-100000@chimarrao.boston.redhat.com> <20040826204841.GC5733@mail.shareable.org> <20040826205218.GE1570@legion.cup.hp.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20900-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040826205218.GE1570@legion.cup.hp.com>; from jra@samba.org on Thu, Aug 26, 2004 at 01:52:18PM -0700
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeremy Allison <jra@samba.org>
Cc: Jamie Lokier <jamie@shareable.org>, Rik van Riel <riel@redhat.com>, Linus Torvalds <torvalds@osdl.org>, Diego Calleja <diegocg@teleline.es>, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

On Thu, Aug 26, 2004 at 01:52:18PM -0700, Jeremy Allison wrote:
> On Thu, Aug 26, 2004 at 09:48:41PM +0100, Jamie Lokier wrote:
> > 
> > This is why I favour storing all essential metadata (about the file's
> > content) inside the file's contents, the primary stream.
> > 
> > We have another problem: what happens when users want to transfer data
> > from Windows (with secondary streams) and MacOS (with resource forks)?
> 
> I can tell you that - right now we (Samba) has to drop all but the primary stream,
> because the Linux filesystems don't have data stream support. Oh look,
> we're losing user data (that's a *bad* thing :-).

Maybe you should learn from netatalk.

