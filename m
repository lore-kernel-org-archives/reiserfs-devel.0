From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: silent semantic changes with reiser4
Date: Mon, 30 Aug 2004 18:10:56 +0400
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <20040830141055.GS5108@backtop.namesys.com>
References: <Pine.LNX.4.58.0408260919380.2304@ppc970.osdl.org> <XFMail.20040827111855.pochini@shiny.it>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <XFMail.20040827111855.pochini@shiny.it>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Giuliano Pochini <pochini@shiny.it>
Cc: Linus Torvalds <torvalds@osdl.org>, ReiserFS List <reiserfs-list@namesys.com>, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, Hans Reiser <reiser@namesys.com>, Jamie Lokier <jamie@shareable.org>, Christoph Hellwig <hch@lst.de>

On Fri, Aug 27, 2004 at 11:18:55AM +0200, Giuliano Pochini wrote:
> 
> On 26-Aug-2004 Linus Torvalds wrote:
> 
> > I advocated (long ago) something like this for /dev handling, just because
> > I think it would make sense to have
> >
> >       /dev/hda        <- special file
> >       /dev/hda/part1  <- partition 1 (aka /dev/hda1)
> 
> This breaks the r4 semantics if I understood it correctly. 

Reiser4 currently links /metas/ directory under each reiser4 fs object. 
Reiser4 "silently" allows regular file to be a directory for that.

That is only an example how an fs object may link its internal hierarchical
structure to the fs tree.  /dev/hda/-as-a-dir is another example, but, I am
afraid, it is not a reiser4 business to look into the devices.  Devfs or its
successor may do it. 

> Because
> /partN are not simply associated to the file, they are part of the
> file. ie. when I modify /dev/hda I also change /dev/hda/partN and
> vice-versa. I don't see any pratical problem, though.
> 
> 
> > Still, I really do like the idea of merging the notion of file and
> > directory into one notion of "container". I absolutely _detest_ files with
> > internal structure that tools have to know about (ie I hate seeing all
> > those embedded formats that I can't use "grep" on - MIME being one case).
> > I'd much rather see a "group of files"  and a "file with a grouping of
> > information".
> 
> You're actually looking for a database with a legacy fs-like interface :)
> 
> 
> --
> Giuliano.

-- 
Alex.
