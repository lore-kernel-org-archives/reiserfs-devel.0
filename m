From: Richard Emslie <rxe@ukshells.co.uk>
Subject: Re: using reiserfs as a DB
Date: Mon, 22 Apr 2002 20:26:19 +0100 (BST)
Message-ID: <Pine.LNX.4.30.0204221954040.26977-100000@vortex.ukshells.co.uk>
References: <3CC45294.2060806@priocom.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10129-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <3CC45294.2060806@priocom.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yura Umanets <umanets@priocom.com>
Cc: Phil Howard <phil-reiserfs@ipal.net>, "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

On Mon, 22 Apr 2002, Yura Umanets wrote:

> Phil Howard wrote:
>
> > "By the keys" means what?  Are the keys the filenames/paths,
>
> The key in reiserfs seems like four-dimentional coordinate of the
> certain item in filesystem.
>
> The first component is identifier of directory where given object (file
> or directory) lies. Second - identifier of the given object. Third
> component - offset inside object. If object is file, then offset is
> offset inside this file, if directory - hashed name of first entry in
> this direntry. And finally last component is type of the item (statdata,
> direntry, direct item, indirect item).
>
> Therefore it is very fast to access corresponding object item. This is
> just $tree_height blocks to be read.
>
> > Does the raw interface simply shortcut access to files in a normal reiserfs
> > mounted filesystem, which can also still be accessed the usual way, or is it
> > a special object which can only be accessed that way (if so, then it loses
> > the advantage of being able to use conventional tools that work on files, and
> > ends up being pretty much a DB lib implemented in kernel space).  Since most
> > operations would be open() file, read() file once (because nothing would be
> > larger than one block), and close(), a single system call that allowed to
> > just fetch the contents given a name would certainly be a plus for the server
> > component.
>
>
> The instance of what is a raw access to files and directories you can
> see on http://reiserfs.linux.kiev.ua/progsreiserfs-0.3.0.tar.gz in
> files: object.c, file.c, dir.c
>
>

Sorry for sounding dumb but am I right in saying this code does not go
near reiserfs kernel code.  ie it is directly accessing at block level?

Is this reiserfs-raw?  If so how does this benfit from the reiserfs's
internal tree?



If this has nothing to do with reiserfs-raw, how can one access a
partition when mounted raw?  ie open(pathname) doesn't make much sense.

Cheers,
Richard



