From: Jamie Lokier <jamie@shareable.org>
Subject: Re: silent semantic changes with reiser4
Date: Wed, 1 Sep 2004 23:45:13 +0100
Message-ID: <20040901224513.GM31934@mail.shareable.org>
References: <Pine.LNX.4.44.0408261607070.27909-100000@chimarrao.boston.redhat.com> <200408290004.i7T04DEO003646@localhost.localdomain>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21235-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200408290004.i7T04DEO003646@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Horst von Brand <vonbrand@inf.utfsm.cl>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Horst von Brand wrote:
> Please do remember devfs: It sounded like a cool idea, got into the kernel
> just to be thrown out later because nobody used it.

Are you kidding?  Lots of distros and many embedded Linuxes use devfs.

And udev _still_ doesn't create device nodes properly.  (Hint: I have
to run two modprobe commands before pppd works.  I have to run
modprobe before openvpn or bochs work.)

> What happened to "code talks, bullshit walks"?

devfs is a fine example of why code isn't enough.  With devfs the code
came first, the >1 year of strategic bullshit politics from the "it's
not traditional unix" crowd came later, then it went in, then lots of
people used it, then it was replaced by something which still doesn't
work as well as 2.4 does with or without devfs, and people are still
using it despite it's faults.

-- Jamie
