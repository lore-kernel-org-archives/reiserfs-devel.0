From: Oleg Drokin <green@namesys.com>
Subject: Re: Reserved Blocks
Date: Thu, 26 Sep 2002 12:03:18 +0400
Message-ID: <20020926120318.A10346@namesys.com>
References: <20020916102742.6538D2926@hofmann.snowcra.sh> <15749.46844.233761.653142@laputa.namesys.com> <20020916125116.B8E96297C@hofmann.snowcra.sh> <15749.56464.253411.12957@laputa.namesys.com> <20020916174109.A21027@namesys.com> <m31y7ij62k.fsf@multivac.cwru.edu> <20020926101942.A5436@namesys.com> <20020926085513.Y32363@noris.de> <20020926110226.A9182@namesys.com> <20020926095942.Z32363@noris.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11551-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20020926095942.Z32363@noris.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthias Urlichs <smurf@noris.de>
Cc: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Hello!

On Thu, Sep 26, 2002 at 09:59:42AM +0200, Matthias Urlichs wrote:
> > > Blocks (possibly more than one) may also be allocated by opening the file,
> > I'd agree if you replace "opening" with "creating".
> Thanks for the correction -- of course.

But one can use existing file.
Notice my original example used '>>' shell redirector.

> > > especially if it happens to have a long name.
> > It cannot be longer than 255 bytes anyway.
> On the other hand, you can write a nontrivial amount of bytes to the file
> before Reiserfs truly allocates a block for them. (Unless you disable
> that, of course.)

This is not true for reiserfs in 2.4/2.5 kernels.
There first plain block is allocated and on file close it is converted
to the in-tree "direct item" if possible.

Bye,
    Oleg
