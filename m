From: Gianni Tedesco <gianni@scaramanga.co.uk>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 03 Sep 2004 04:22:48 +0100
Message-ID: <1094181768.9282.27.camel@sherbert>
References: <rlrevell@joe-job.com>
	 <1094079071.1343.25.camel@krustophenia.net>
	 <200409021425.i82EPn9i005192@laptop11.inf.utfsm.cl>
	 <1535878866.20040902214144@tnonline.net>
	 <20040902194909.GA8653@atrey.karlin.mff.cuni.cz>
	 <1094155277.11364.92.camel@krustophenia.net>
	 <20040902204351.GE8653@atrey.karlin.mff.cuni.cz>
	 <1094158060.1347.16.camel@krustophenia.net>
	 <20040902205857.GF8653@atrey.karlin.mff.cuni.cz>
	 <1094164385.6163.4.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21390-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1094164385.6163.4.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Revell <rlrevell@joe-job.com>, Spam <spam@tnonline.net>, Horst von Brand <vonbrand@inf.utfsm.cl>, Jamie Lokier <jamie@shareable.org>, David Masover <ninja@slaphack.com>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Thu, 2004-09-02 at 23:33 +0100, Alan Cox wrote:
> On Iau, 2004-09-02 at 21:58, Pavel Machek wrote:
> > Uservfs.sf.net.
> > 
> > Unlike alan, I do not think that "do it all in library" is good
> > idea. I put it in the userspace as "codafs" server, and let
> > applications see it as a regular filesystem.
> 
> That works for me too, providing someone has fixed all the user mode fs
> deadlocks with paging

Aren't the deadlock scenarios only applicable for read/write mounted
filesystems ?

-- 
// Gianni Tedesco (gianni at scaramanga dot co dot uk)
lynx --source www.scaramanga.co.uk/scaramanga.asc | gpg --import
8646BE7D: 6D9F 2287 870E A2C9 8F60 3A3C 91B5 7669 8646 BE7D

