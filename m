From: Helge Hafting <helge.hafting@hist.no>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 16 Sep 2004 10:23:09 +0200
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <41494D6D.2090704@hist.no>
References: <200408311931.i7VJV8kt028102@laptop11.inf.utfsm.cl> <41352279.7020307@slaphack.com> <41356321.4030307@namesys.com> <Pine.LNX.4.58.0408312259180.2295@ppc970.osdl.org> <413578C9.8020305@namesys.com> <414876AD.6060404@techsource.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <414876AD.6060404@techsource.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Timothy Miller <miller@techsource.com>
Cc: Hans Reiser <reiser@namesys.com>, Linus Torvalds <torvalds@osdl.org>, David Masover <ninja@slaphack.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Pavel Machek <pavel@ucw.cz>, Jamie Lokier <jamie@shareable.org>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>, Alexander Zarochentcev <zam@namesys.com>

Timothy Miller wrote:

> I'm probably not the first to suggest this idea, and it's probably not 
> a very good idea, but here's my idea anyhow:
>
> You have a file "/usr/bin/emacs"
> with a metadata property in the overlaid namespace 
> "/usr/bin/emacs/[[..]metas/]icon"
>
> According to some, this could cause some confusion.  Howabout instead:
>
> You have a file "/usr/bin/emacs"
> with a metadata property in a slightly separated namespace 
> "/metas/usr/bin/emacs/icon"
>
And the problem with such a "solution" is
mv /usr/bin/emacs /usr/bin/old-emacs
Do this with an ordinary fs, and the /metas/usr/bin/emacs/icon
won't move with it.  Now metas might might not be an ordinary fs,
so perhaps the move happens automatically there, but if so
it will be unexpected. 

> This has the advantage of still having the metadata in the filesystem 
> namespace but without the confusion of having files-as-directories, 
> ambiguity of filename, backup issues, etc.  This is the reverse of 
> having the namespaces overlaid with a "/nometas" view which is separate.
>
> Furthermore, you can split things further like this:
>
> You have a file "/usr/bin/emacs"
> with an automatically-generated metadata property that you don't want 
> to back up in "/autometas/usr/bin/emacs/modification_date"
> and a manually generated metadata property that you MAY want to backup 
> in "/staticmetas/usr/bin/emacs/icon".
>
> This is inelegant, I know.  But if we do this, we can add the extra 
> features of reiser4 without confusing existing apps or having to 
> modify them to support the new functionality.
>
> Furthermore, you can easily hide the extra features by not mounting 
> the meta top-level directories (assuming they're mounted like separate 
> filesystems, rather than just magically appearing there, which is okay 
> too).

Having to go up to root and then down a similar but different path to 
reach a
file's metadata seems very counterintuitive to me.  And you have to 
update all
tools to do this automatically, or it'll be hopeless to actually use.

Helge Hafting

