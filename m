From: Oliver Neukum <oliver@neukum.org>
Subject: Re: The argument for fs assistance in handling archives
Date: Fri, 3 Sep 2004 10:30:58 +0200
Message-ID: <200409031030.58319.oliver@neukum.org>
References: <20040826150202.GE5733@mail.shareable.org> <4137BE36.5020504@slaphack.com> <20040903091352.A2288@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21413-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040903091352.A2288@infradead.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Hellwig <hch@infradead.org>
Cc: David Masover <ninja@slaphack.com>, Spam <spam@tnonline.net>, Hans Reiser <reiser@namesys.com>, Linus Torvalds <torvalds@osdl.org>, Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Am Freitag, 3. September 2004 10:13 schrieb Christoph Hellwig:
> On Thu, Sep 02, 2004 at 07:43:34PM -0500, David Masover wrote:

> > | There's no need to do that in kernel, unless you want to be able
> > | to force it unto users.
> > 
> > And on apps.  Should I teach OpenOffice.org to do version control?
> > Seems a lot easier to just do it in the kernel, and teach everything to
> > do version control in one fell swoop.
> 
> Just add a post-save trigger that can check it into any SCM you want.

That depends on whom you refer to. If you want to impose the RCS
on the users as an administrative measure and force compliance, then
you'll need to do it in kernel.
I see some nasty issues with disk quotas there.

	Regards
		Oliver
