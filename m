From: Spam <spam@tnonline.net>
Subject: Re: The argument for fs assistance in handling archives (was: silent semantic changes with reiser4)
Date: Fri, 3 Sep 2004 02:39:06 +0200
Message-ID: <142794710.20040903023906@tnonline.net>
References: <20040826150202.GE5733@mail.shareable.org>
 <200408282314.i7SNErYv003270@localhost.localdomain>
 <20040901200806.GC31934@mail.shareable.org>
 <Pine.LNX.4.58.0409011311150.2295@ppc970.osdl.org>
 <1094118362.4847.23.camel@localhost.localdomain>
 <20040902161130.GA24932@mail.shareable.org>
 <Pine.LNX.4.61.0409030028510.23011@fogarty.jakma.org>
 <1835526621.20040903014915@tnonline.net>
 <1094165736.6170.19.camel@localhost.localdomain>
 <32810200.20040903020308@tnonline.net>
 <Pine.LNX.4.61.0409030112080.23011@fogarty.jakma.org>
Reply-To: Spam <spam@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21374-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.61.0409030112080.23011@fogarty.jakma.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paul Jakma <paul@clubi.ie>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, Jamie Lokier <jamie@shareable.org>, Linus Torvalds <torvalds@osdl.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, Hans Reiser <reiser@namesys.com>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>


  

> On Fri, 3 Sep 2004, Spam wrote:

>>  Yes, some archive types can't be partially unzipped either. But my
>>  point is that it wouldn't be transparent to the application/user in
>>  the same way.

> It doesnt matter whether it is transparent to the application. It can
> be the application which implements the required level of 
> transparency.

> User doesnt care what provides the transparency or how it's 
> implemented.

  Indeed. I hope I didn't say otherwise :). Just that I think it will
  be very difficult to have this transparency in all apps. Just
  thinking of "nano file.jpg/description.txt" or "ls
  file.tar/untar/*.doc". Sure in some environments like Gnome it could
  work, but it still doesn't for the rest of the flora of Linux
  programs.



  ~S

> regards,

