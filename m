From: Spam <spam@tnonline.net>
Subject: Re: The argument for fs assistance in handling archives
Date: Fri, 3 Sep 2004 16:01:17 +0200
Message-ID: <112181186.20040903160117@tnonline.net>
References: <20040826150202.GE5733@mail.shareable.org>
 <200408282314.i7SNErYv003270@localhost.localdomain>
 <20040901200806.GC31934@mail.shareable.org>
 <Pine.LNX.4.58.0409011311150.2295@ppc970.osdl.org>
 <1094118362.4847.23.camel@localhost.localdomain> <20040902203854.GA4801@janus>
 <1094160994.31499.19.camel@shaggy.austin.ibm.com> <20040902214806.GA5272@janus>
 <20040902220027.GD23987@parcelfarce.linux.theplanet.co.uk>
 <4137B5F5.8000402@slaphack.com> <16696.30683.207905.803165@gargle.gargle.HOWL>
Reply-To: Spam <spam@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21434-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16696.30683.207905.803165@gargle.gargle.HOWL>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John Stoffel <stoffel@lucent.com>
Cc: David Masover <ninja@slaphack.com>, viro@parcelfarce.linux.theplanet.co.uk, Frank van Maarseveen <frankvm@xs4all.nl>, Dave Kleikamp <shaggy@austin.ibm.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Linus Torvalds <torvalds@osdl.org>, Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, Hans Reiser <reiser@namesys.com>, Christoph Hellwig <hch@lst.de>, fsdevel <linux-fsdevel@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>


  

>>>>>> "David" == David Masover <ninja@slaphack.com> writes:

David>> File-as-a-dir has numerous advantages, but enough have been
David>> discussed.  Short list is image mounts, tarballs, streams,
David>> metas, and namespace unification.  Longer list and explanations
David>> can be found if you RTFA.

> And it has numerous dis-advantages as well, since it doesn't have a
> good set of semantics and syntax defined yet, nor does it explain
> except by vigorous handwaving the performance and security impacts it
> can have.

> My personal feeling is that the mount(8) command should be the tool
> used to extract and expose the internal namespace of files like this
> and to then graft it onto the standard Unix namespace with gross Unix
> semantics, but it's own wacky internal semantics.  This way, standard
> tools don't care, but special tools which know how to handle it can do
> what they want.


>> mount -t tarfs /some/place/on/disk/foo.tar.gz /mnt/tar
>> cp /var/tmp/img.gif .
>> umount /mnt/tar

> Oops!  Someone did a rm /some/place/on/disk/foo.tar.gz between steps
> one and two.  Now what happens?  Please define those semantics...

  Uhm, can you delete a file (loop) that is mounted?

> John




