From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 02 Sep 2004 20:16:35 +0100
Message-ID: <1094152590.5726.37.camel@localhost.localdomain>
References: <rlrevell@joe-job.com>
	 <1094079071.1343.25.camel@krustophenia.net>
	 <200409021425.i82EPn9i005192@laptop11.inf.utfsm.cl>
	 <1535878866.20040902214144@tnonline.net>
	 <20040902194909.GA8653@atrey.karlin.mff.cuni.cz>
	 <1094155277.11364.92.camel@krustophenia.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21321-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1094155277.11364.92.camel@krustophenia.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lee Revell <rlrevell@joe-job.com>
Cc: Pavel Machek <pavel@ucw.cz>, Spam <spam@tnonline.net>, Horst von Brand <vonbrand@inf.utfsm.cl>, Jamie Lokier <jamie@shareable.org>, David Masover <ninja@slaphack.com>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Iau, 2004-09-02 at 21:01, Lee Revell wrote:
> But is it efficient to make every application that reads files have to
> know how to get inside a tar file, just to read its contents?  That
> seems like a massive duplication of effort.  Better to have the contents
> accessible via a separate stream, in the same namespace.  Fix it once in
> the kernel vs. fix it in umpteen apps.

Thats how you get yourself a non useful OS. Fix it in a library and
share it between the apps that care. Like say.. gnome-vfs2

