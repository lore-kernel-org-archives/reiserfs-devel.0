From: Oleg Drokin <green@namesys.com>
Subject: Re: Reserved Blocks
Date: Thu, 26 Sep 2002 11:02:26 +0400
Message-ID: <20020926110226.A9182@namesys.com>
References: <20020916102742.6538D2926@hofmann.snowcra.sh> <15749.46844.233761.653142@laputa.namesys.com> <20020916125116.B8E96297C@hofmann.snowcra.sh> <15749.56464.253411.12957@laputa.namesys.com> <20020916174109.A21027@namesys.com> <m31y7ij62k.fsf@multivac.cwru.edu> <20020926101942.A5436@namesys.com> <20020926085513.Y32363@noris.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11549-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20020926085513.Y32363@noris.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthias Urlichs <smurf@noris.de>
Cc: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Hello!

On Thu, Sep 26, 2002 at 08:55:13AM +0200, Matthias Urlichs wrote:

> Oleg Drokin:
> > That's right. But the program that writes into that file is setuid program.
> > And blocks are allocated by that setuid program.
> Blocks (possibly more than one) may also be allocated by opening the file,

I'd agree if you replace "opening" with "creating".

> especially if it happens to have a long name.

It cannot be longer than 255 bytes anyway.

> If you want limits, use quotas. They may not be perfect, but at least they
> work.  ;-)

That's true ;)

Bye,
    Oleg
