From: Helge Hafting <helge.hafting@hist.no>
Subject: Re: The argument for fs assistance in handling archives
Date: Wed, 08 Sep 2004 11:56:37 +0200
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <413ED755.6090204@hist.no>
References: <20040902203854.GA4801@janus> <1094160994.31499.19.camel@shaggy.austin.ibm.com> <20040902214806.GA5272@janus> <20040902220027.GD23987@parcelfarce.linux.theplanet.co.uk> <20040902220242.GA5414@janus> <20040902220640.GE23987@parcelfarce.linux.theplanet.co.uk> <20040902221133.GB5414@janus> <20040902221722.GF23987@parcelfarce.linux.theplanet.co.uk> <20040902222650.GA5523@janus> <20040902223324.GG23987@parcelfarce.linux.theplanet.co.uk> <20040902225634.GA5756@janus> <41382EC0.8080309@hist.no> <4139045B.8080307@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <4139045B.8080307@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Masover <ninja@slaphack.com>
Cc: Frank van Maarseveen <frankvm@xs4all.nl>, viro@parcelfarce.linux.theplanet.co.uk, Dave Kleikamp <shaggy@austin.ibm.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Linus Torvalds <torvalds@osdl.org>, Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, Hans Reiser <reiser@namesys.com>, Christoph Hellwig <hch@lst.de>, fsdevel <linux-fsdevel@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

David Masover wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Helge Hafting wrote:
> [...]
> | You don't need kernel support for cd'ing into fs images.
> | You need a shell (or GUI app) that:
> | 1. notices that user tries to CD into a file, not a directory
> | 2. Attempts fs type detection and do a loop mount.
> | 3. Give error message if it wasn't a supported fs image.
>
> You can argue this about FS plugins, too.  You don't need kernel support
> for cryptocompress, for example.  Just have a fifo farm.  Every file
> that has compression turned on is actually a named pipe, the original
> file is hidden (starts with a dot), and you have a script running to
> each fifo which runs zcat.

Eww.  A shell/filemanager supporting fs images is one running program.
The fifo farm is one per file.  Ouch.

>
> The kernel support (read: interface) is just cleaner in some ways.
>
> In the loop mount example, it isn't universal -- the user can't CD into
> a file if they use the wrong shell, and two different shells might make
> two different mounts.  How many mounts before we run out of loop devices?

This limitation apply to the kernel interface too.  But you can 
configure for an
arbitrary number of loop mounts anyway. The user will have to mount
using the correct tool - after that the door is opened for anything.

>
> In the cryptocompress example, there's no caching or compress-on-flush
> optimization, and it isn't entirely transparent to anything.  It doesn't
> look like a file, it looks like a fifo.  ls will make it look yellow. 


Even the kernel supported "cd into fs images" has problems.  How should
the kernel know which files you want to support with mounting, and which
ones are the wast majority of plain files?   A file manager doesn't
have to do this fully automatic, it can have a button/hotkey for "loop 
mount this".
So the user will have to tell it what to do, but in a much easier way
than typing "mount -o loop . . . "  The file manager can also ask for
encryption keys - something the kernel cannot do because it doesn't
know what user interface(s) is in use by the process that attempts the "cd".
There may be one interface (stdin, X) there may be both, i.e. something
started from an xterm can use both, there may be none, (the 
web/ftp/file-server
got a request for something inside a encrypted fs image.)

And even if the kernel can figure out the correct user interface, do we
want it to contain an X client for asking for keys? :-/

Helge Hafting

