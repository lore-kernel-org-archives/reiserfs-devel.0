From: Frank van Maarseveen <frankvm@xs4all.nl>
Subject: Re: The argument for fs assistance in handling archives (was: silent semantic changes with reiser4)
Date: Fri, 3 Sep 2004 10:50:18 +0200
Message-ID: <20040903085018.GA8586@janus>
References: <20040902214806.GA5272@janus> <20040902220027.GD23987@parcelfarce.linux.theplanet.co.uk> <20040902220242.GA5414@janus> <20040902220640.GE23987@parcelfarce.linux.theplanet.co.uk> <20040902221133.GB5414@janus> <20040902221722.GF23987@parcelfarce.linux.theplanet.co.uk> <20040902222650.GA5523@janus> <20040902223324.GG23987@parcelfarce.linux.theplanet.co.uk> <20040902225634.GA5756@janus> <41382EC0.8080309@hist.no>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21417-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <41382EC0.8080309@hist.no>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Helge Hafting <helge.hafting@hist.no>
Cc: Frank van Maarseveen <frankvm@xs4all.nl>, viro@parcelfarce.linux.theplanet.co.uk, Dave Kleikamp <shaggy@austin.ibm.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Linus Torvalds <torvalds@osdl.org>, Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, Hans Reiser <reiser@namesys.com>, Christoph Hellwig <hch@lst.de>, fsdevel <linux-fsdevel@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Fri, Sep 03, 2004 at 10:43:44AM +0200, Helge Hafting wrote:
> >
> You don't need kernel support for cd'ing into fs images.
> You need a shell (or GUI app) that:
> 1. notices that user tries to CD into a file, not a directory
> 2. Attempts fs type detection and do a loop mount.
> 3. Give error message if it wasn't a supported fs image.

Ok, and right now I'm in vim typing this message and want
to ":new /tmp/backup.iso/etc/fstab"

modifying 1000+ applications is not an option IMO. Putting it in
a preloaded library might be doable except maybe for permission
problems but this is incredibly clumsy and lacks the possibility
to implement sane caching behavior because it is process bound.

-- 
Frank
