From: Helge Hafting <helge.hafting@hist.no>
Subject: Re: The argument for fs assistance in handling archives (was: silent
 semantic changes with reiser4)
Date: Fri, 03 Sep 2004 10:43:44 +0200
Message-ID: <41382EC0.8080309@hist.no>
References: <20040902203854.GA4801@janus> <1094160994.31499.19.camel@shaggy.austin.ibm.com> <20040902214806.GA5272@janus> <20040902220027.GD23987@parcelfarce.linux.theplanet.co.uk> <20040902220242.GA5414@janus> <20040902220640.GE23987@parcelfarce.linux.theplanet.co.uk> <20040902221133.GB5414@janus> <20040902221722.GF23987@parcelfarce.linux.theplanet.co.uk> <20040902222650.GA5523@janus> <20040902223324.GG23987@parcelfarce.linux.theplanet.co.uk> <20040902225634.GA5756@janus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21415-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040902225634.GA5756@janus>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Frank van Maarseveen <frankvm@xs4all.nl>
Cc: viro@parcelfarce.linux.theplanet.co.uk, Dave Kleikamp <shaggy@austin.ibm.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Linus Torvalds <torvalds@osdl.org>, Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, Hans Reiser <reiser@namesys.com>, Christoph Hellwig <hch@lst.de>, fsdevel <linux-fsdevel@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Frank van Maarseveen wrote:

>On Thu, Sep 02, 2004 at 11:33:24PM +0100, viro@parcelfarce.linux.theplanet.co.uk wrote:
>  
>
>>RTFS and you'll see.  Individual fs generally knows how to check if it
>>would be immediately unhappy with given image (not all types do, BTW).
>>Exact form of checks depends on fs type; for crying out loud, there's
>>not even a promise that they are mutually exclusive!
>>    
>>
>
>so?
>
>A user can stick an USB memory card with _any_ malformed fs data and
>make troubles via the automounter or user mounts. Yes, mount might do
>some more checks but it sure won't do an fsck.
>
>The user gets what he deserves when sticking crap in an USB port.
>
>And that doesn't mean that the kernel should accept any fs image
>when a user tries to cd into the file.
>  
>
You don't need kernel support for cd'ing into fs images.
You need a shell (or GUI app) that:
1. notices that user tries to CD into a file, not a directory
2. Attempts fs type detection and do a loop mount.
3. Give error message if it wasn't a supported fs image.

Helge Hafting
