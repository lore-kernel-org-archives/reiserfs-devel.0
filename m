From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: The argument for fs assistance in handling archives (was:
	silent semantic changes with reiser4)
Date: Thu, 02 Sep 2004 23:27:06 +0100
Message-ID: <1094164023.6163.2.camel@localhost.localdomain>
References: <20040901200806.GC31934@mail.shareable.org>
	 <200409021407.i82E70hx004899@laptop11.inf.utfsm.cl>
	 <20040902173214.GB24932@mail.shareable.org>
	 <m3pt54il82.fsf@zoo.weinigel.se>
	 <20040902214731.GF24932@mail.shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21354-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040902214731.GF24932@mail.shareable.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jamie Lokier <jamie@shareable.org>
Cc: Christer Weinigel <christer@weinigel.se>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, Hans Reiser <reiser@namesys.com>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Iau, 2004-09-02 at 22:47, Jamie Lokier wrote:
>     - Can the daemon keep track of _every_ file on my disk like this?
>       That's more than a million files, and about 10^5 directories.
>       dnotify would require the daemon to open all the directories.
>       I'm not sure what inotify offers.

This is currently a real issue for both desktop search and for virus
scanners. They want a "what changed and where" system wide (or at least
per namespace/mount).


