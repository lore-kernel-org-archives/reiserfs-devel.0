From: Oleg Drokin <green@namesys.com>
Subject: Re: Is it good for a PDA fs?
Date: Sun, 23 Jun 2002 10:50:57 +0400
Message-ID: <20020623105057.A5090@namesys.com>
References: <20020622115207.E23457@gerf.org> <20020622175746.I13075@parcelfarce.linux.theplanet.co.uk> <3D14B8E9.4020808@namesys.com> <20020622230748.A1981@namesys.com> <3D14E47E.5080300@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10800-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <3D14E47E.5080300@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Chris Dukes <pakrat@www.uk.linux.org>, The Doctor What <docwhat@gerf.org>, reiserfs-list@namesys.com

Hello!

On Sun, Jun 23, 2002 at 12:56:30AM +0400, Hans Reiser wrote:

> >CF is different story. They fight level of wearing in underlying layer.
> Meaning that they hide it in the device driver, and the FS does not need 
> to be aware of it?

Yes. Otherwise CF media would be pretty much useless in conjunction with VFAT.

> >And you can format CF with reiserfs without any problems
> >But do not expect that windows or digital cameras would understand
> >that ;)
> >Also - in conjunctions with PDAs - reiserfs is quite memory (RAM) hungry,
> >so using it on 32M ram box is somewhat questionable.
> >And static 32M journal (that's 13% off your CF size, btw)
> Our journal resizing patch is waiting for the next pre1 to go in, yes?

Yes.

> Regardless of all of this, it really would not surprise me if a 
> filesystem design for CFs does a better job than we do at CFs.....

I am not aware of any CF-centric filesystem. Because CF represents itself as
IDE device.
Directly accessible flash is a different matter of course.

> >Building ARM kernels is easy.
> >I always build kernels for my ARM toys myself.
> >and I bet that Zaurus kernel is based off some -rmk kernel with
> >may be minor patches (sources of these should be available at Sharp
> >of course).
> >So getting (making) new kernel should be trivial.
> I think I probably care more about downloading and trying the latest 
> kalendar than installing a new kernel on it.;-)   It is nice to have ssh 

Yes, exactly. I do not see how you (or any other user) would benefit from
using anything but vfat in CF, but disadvantages are pretty clear.

Bye,
    Oleg
