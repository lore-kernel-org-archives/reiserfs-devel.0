From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 02 Sep 2004 23:33:07 +0100
Message-ID: <1094164385.6163.4.camel@localhost.localdomain>
References: <rlrevell@joe-job.com>
	 <1094079071.1343.25.camel@krustophenia.net>
	 <200409021425.i82EPn9i005192@laptop11.inf.utfsm.cl>
	 <1535878866.20040902214144@tnonline.net>
	 <20040902194909.GA8653@atrey.karlin.mff.cuni.cz>
	 <1094155277.11364.92.camel@krustophenia.net>
	 <20040902204351.GE8653@atrey.karlin.mff.cuni.cz>
	 <1094158060.1347.16.camel@krustophenia.net>
	 <20040902205857.GF8653@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21356-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040902205857.GF8653@atrey.karlin.mff.cuni.cz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pavel Machek <pavel@ucw.cz>
Cc: Lee Revell <rlrevell@joe-job.com>, Spam <spam@tnonline.net>, Horst von Brand <vonbrand@inf.utfsm.cl>, Jamie Lokier <jamie@shareable.org>, David Masover <ninja@slaphack.com>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Iau, 2004-09-02 at 21:58, Pavel Machek wrote:
> Uservfs.sf.net.
> 
> Unlike alan, I do not think that "do it all in library" is good
> idea. I put it in the userspace as "codafs" server, and let
> applications see it as a regular filesystem.

That works for me too, providing someone has fixed all the user mode fs
deadlocks with paging

