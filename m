From: Giuliano Pochini <pochini@shiny.it>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 27 Aug 2004 11:18:55 +0200 (CEST)
Sender: pochini@agnus.shiny.it
Message-ID: <XFMail.20040827111855.pochini@shiny.it>
References: <Pine.LNX.4.58.0408260919380.2304@ppc970.osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-20899-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.58.0408260919380.2304@ppc970.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linus Torvalds <torvalds@osdl.org>
Cc: ReiserFS List <reiserfs-list@namesys.com>, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, Hans Reiser <reiser@namesys.com>, Jamie Lokier <jamie@shareable.org>, Christoph Hellwig <hch@lst.de>


On 26-Aug-2004 Linus Torvalds wrote:

> I advocated (long ago) something like this for /dev handling, just because
> I think it would make sense to have
>
>       /dev/hda        <- special file
>       /dev/hda/part1  <- partition 1 (aka /dev/hda1)

This breaks the r4 semantics if I understood it correctly. Because
/partN are not simply associated to the file, they are part of the
file. ie. when I modify /dev/hda I also change /dev/hda/partN and
vice-versa. I don't see any pratical problem, though.


> Still, I really do like the idea of merging the notion of file and
> directory into one notion of "container". I absolutely _detest_ files with
> internal structure that tools have to know about (ie I hate seeing all
> those embedded formats that I can't use "grep" on - MIME being one case).
> I'd much rather see a "group of files"  and a "file with a grouping of
> information".

You're actually looking for a database with a legacy fs-like interface :)


--
Giuliano.
