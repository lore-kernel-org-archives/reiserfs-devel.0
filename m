From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 02 Sep 2004 23:51:45 +0100
Message-ID: <1094165499.6170.17.camel@localhost.localdomain>
References: <rlrevell@joe-job.com>
	 <1094155277.11364.92.camel@krustophenia.net>
	 <200409022200.i82M0ihC026321@laptop11.inf.utfsm.cl>
	 <20040902232350.GA32244@mail.shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21363-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040902232350.GA32244@mail.shareable.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jamie Lokier <jamie@shareable.org>
Cc: Horst von Brand <vonbrand@inf.utfsm.cl>, Lee Revell <rlrevell@joe-job.com>, Pavel Machek <pavel@ucw.cz>, Spam <spam@tnonline.net>, David Masover <ninja@slaphack.com>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Gwe, 2004-09-03 at 00:23, Jamie Lokier wrote:
> However, if we ever see that search engine index thing happen, it
> would be a most excellent capability if it searched inside archive
> files too.  I would definitely use that.  Not often, but occasionally I would.

Thats an indexer decision, the search backend (which is the performance
and complexity critical part) doesn't give a damn.

