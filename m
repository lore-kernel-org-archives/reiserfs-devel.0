From: Jamie Lokier <jamie@shareable.org>
Subject: Re: silent semantic changes with reiser4
Date: Wed, 1 Sep 2004 21:16:08 +0100
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <20040901201608.GD31934@mail.shareable.org>
References: <20040829191044.GA10090@thundrix.ch> <3247172997-BeMail@cr593174-a> <20040831081528.GA14371@thundrix.ch>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040831081528.GA14371@thundrix.ch>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tonnerre <tonnerre@thundrix.ch>
Cc: "Alexander G. M. Smith" <agmsmith@rogers.com>, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com, vonbrand@inf.utfsm.cl

Tonnerre wrote:
> Quel horreur!
> Do it in userland, really.

I'm amazed that after all this discussion where all the realistic
implementations are done in userland with kernel support for calling
out to it, there are people who think the kernel is supposed to decode
MP3 files or whatever.

Nobody is advocating that!

> If I  get the time,  I'll write you  a small daemon based  on libmagic
> which  stores  the  file  attributes  in xattrs,  or  if  they're  not
> supported, in some MacOS/Xish per-directory files. Even a file manager
> ("finder") can do that, there's not even the need for a daemon.

How are you going to do the part where the xattr changes when the file
is modified?

(For example, if I edit an HTML file which is encoded in iso-8859-1,
change it to utf-8 and indicate that in a META element, and save it
under the same name, the full content-type should change from
"text/html; charset=iso-8859-1" to "text/html; charset=utf-8".)

I don't see how you can do that without kernel support.

Don't say dnotify or inotify, because neither would work.

-- Jamie
