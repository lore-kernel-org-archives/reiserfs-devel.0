From: Stephan von Krawczynski <skraw@ithnet.com>
Subject: Re: The argument for fs assistance in handling archives
Date: Sat, 4 Sep 2004 13:42:31 +0200
Message-ID: <20040904134231.4e1974e0.skraw@ithnet.com>
References: <20040826150202.GE5733@mail.shareable.org>
	<200408282314.i7SNErYv003270@localhost.localdomain>
	<20040901200806.GC31934@mail.shareable.org>
	<Pine.LNX.4.58.0409011311150.2295@ppc970.osdl.org>
	<1094118362.4847.23.camel@localhost.localdomain>
	<20040902161130.GA24932@mail.shareable.org>
	<Pine.LNX.4.61.0409030028510.23011@fogarty.jakma.org>
	<1835526621.20040903014915@tnonline.net>
	<1094165736.6170.19.camel@localhost.localdomain>
	<32810200.20040903020308@tnonline.net>
	<Pine.LNX.4.61.0409030112080.23011@fogarty.jakma.org>
	<142794710.20040903023906@tnonline.net>
	<1094216718.2679.30.camel@shaggy.austin.ibm.com>
	<413908AB.90103@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21463-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <413908AB.90103@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: shaggy@austin.ibm.com, spam@tnonline.net, paul@clubi.ie, alan@lxorguk.ukuu.org.uk, jamie@shareable.org, torvalds@osdl.org, vonbrand@inf.utfsm.cl, bunk@fs.tum.de, reiser@namesys.com, viro@parcelfarce.linux.theplanet.co.uk, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

On Fri, 03 Sep 2004 19:13:31 -0500
David Masover <ninja@slaphack.com> wrote:

> | Just choose the right program.  tar groks tar files, not ls.
> 
> tar groks tar.  bzip2 groks bz2.  gzip groks gz.  "mount -o loop" groks
> images.  zip groks zip.  rar groks rar.  openoffice groks .sxw, unless
> staroffice does.  xmms can read id3 info from mp3s.  gcc compiles C.
> 
> If the file is an object, it's easier.  You can ask the file what it is,
> and what you can do with it.  And you can tell it to do certain standard
> things.  You can do all of this while reading almost no documentation on
> what the file is.  At the end of the day, it won't matter to you whether
> a file is zip, rar, or tar -- it's an archive, and you can extract it by
> copying files out of its /contents directory.
> 
> Your way (the traditional way) means you have to learn to use which
> program is the right program and how to use that program, and you'll
> have to remember it constantly.

Just a short input from someone listening quite a while to this thread:
I think your approach to the problem leads actually nowhere. The reason for
this is implicit in your own explanation. _Currently_ you talk of archives, but
as soon as you got that, what's next?
Your idea needs abstraction, then you see the problem more clearly:
An archive is only some sort of file type, just as (you already named) mp3 or
.sxw is another type. If you really want to do something _generally_ useful you
should think of a method to parse and use all kinds of filetypes and create an
interface for that.
And one thing is clear: as there are numerous different types you cannot pull
all that code inside the kernel. Obviously there should be a way some
application can install a hook, a helper, a plugin or whatever to provide
extended functionality on its special filetypes. If you don't want to use tar,
you don't need the plugin either.
If you want tar, you should (as a user) be able to install the "fs-plugin"
(just a name, do not shoot me for it) together with tar as an application. You
get the idea? Obviously this must be possible during runtime, everything else
is senseless.
So, please, if you go on investigating this whole stuff do it in a more general
way, because "tar inside kernel" is not really what your idea is all about, no?
And one last obvious thing: if one doesn't want this kind of file-handling, he
should not need it. It has to be an add-on functionality, not a replacement.

Regards,
Stephan
