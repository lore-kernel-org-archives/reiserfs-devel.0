From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: The argument for fs assistance in handling archives
Date: Sat, 04 Sep 2004 09:20:47 -0400 EDT
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <89955622176-BeMail@cr593174-a>
References: <200409040227.i842R7io003637@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <200409040227.i842R7io003637@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Horst von Brand <vonbrand@inf.utfsm.cl>
Cc: helge.hafting@hist.no, oliverhunt@gmail.com, reiser@namesys.com, torvalds@osdl.org, ninja@slaphack.com, jamie@shareable.org, bunk@fs.tum.de, viro@parcelfarce.linux.theplanet.co.uk, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com, spam@tnonline.net

Horst von Brand wrote on Fri, 03 Sep 2004 22:27:07 -0400:
> Great. Then everything is a firectory (or dile?). And a firectory points at
> other firectories and contains data. I just don't see how you are supposed
> to distinguish the data from further firectories...

I like to call them fildirutes (file/directory/attribute).  A file
typing system would tell you the intended purpose of a particular
fildurute.  So if a fildurute called X has X/..metas/mimefiletype
containing "application/x-directory" then you know that it should be
treated as being primarily a container for other fildirutes and shown
to the user as a folder in a GUI view.  If it said it was
"application/x-text-document" then the GUI system would default to
opening it in a word processor.  Either way, that's only a hint about
how it should be presented to the user, not something the kernel
enforces.

For efficiency, the file type might just be stored in the fildirute's
inode as a code number (since most things would have a file type) that
the file system exposes as a file called ..metas/mimefiletype.

- Alex
