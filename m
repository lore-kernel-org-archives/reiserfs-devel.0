From: Jamie Lokier <jamie@shareable.org>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 2 Sep 2004 06:57:43 +0100
Message-ID: <20040902055743.GA14177@mail.shareable.org>
References: <20040829191044.GA10090@thundrix.ch> <3247172997-BeMail@cr593174-a> <20040831081528.GA14371@thundrix.ch> <20040901201608.GD31934@mail.shareable.org> <1094070506.28509.24.camel@shaggy.austin.ibm.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21253-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1094070506.28509.24.camel@shaggy.austin.ibm.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Kleikamp <shaggy@austin.ibm.com>
Cc: Tonnerre <tonnerre@thundrix.ch>, "Alexander G. M. Smith" <agmsmith@rogers.com>, spam@tnonline.net, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, jra@samba.org, Linus Torvalds <torvalds@osdl.org>, reiser@namesys.com, Christoph Hellwig <hch@lst.de>, fsdevel <linux-fsdevel@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, flx@namesys.com, reiserfs-list@namesys.com, vonbrand@inf.utfsm.cl

Tonnerre wrote:
> > > I'll write you a small daemon based on libmagic which stores the
> > > file attributes in xattrs, or if they're not supported, in some
> > > MacOS/Xish per-directory files. Even a file manager ("finder") can
> > > do that, there's not even the need for a daemon.

Jamie Lokier wrote:
> > (For example, if I edit an HTML file which is encoded in iso-8859-1,
> > change it to utf-8 and indicate that in a META element, and save it
> > under the same name, the full content-type should change from
> > "text/html; charset=iso-8859-1" to "text/html; charset=utf-8".)
> > 
> > I don't see how you can do that without kernel support.

Dave Kleikamp wrote:
> Your html editor should do that.

My html editor is "vi".  If I am supposed to manually set the
content-type attribute after exiting vi, doesn't that rather
invalidate the idea of a "small daemon based on libmagic" which sets
it for me?

That was the sole point of my statement.

-- Jamie
