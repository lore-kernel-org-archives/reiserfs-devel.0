From: "Matthias Urlichs" <smurf@noris.de>
Subject: Re: Reserved Blocks
Date: Thu, 26 Sep 2002 09:59:42 +0200
Message-ID: <20020926095942.Z32363@noris.de>
References: <20020916102742.6538D2926@hofmann.snowcra.sh> <15749.46844.233761.653142@laputa.namesys.com> <20020916125116.B8E96297C@hofmann.snowcra.sh> <15749.56464.253411.12957@laputa.namesys.com> <20020916174109.A21027@namesys.com> <m31y7ij62k.fsf@multivac.cwru.edu> <20020926101942.A5436@namesys.com> <20020926085513.Y32363@noris.de> <20020926110226.A9182@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11550-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20020926110226.A9182@namesys.com>; from green@namesys.com on Thu, Sep 26, 2002 at 11:02:26AM +0400
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Hi,

Oleg Drokin:
> > Blocks (possibly more than one) may also be allocated by opening the file,
> 
> I'd agree if you replace "opening" with "creating".
> 
Thanks for the correction -- of course.

> > especially if it happens to have a long name.
> 
> It cannot be longer than 255 bytes anyway.
> 
On the other hand, you can write a nontrivial amount of bytes to the file
before Reiserfs truly allocates a block for them. (Unless you disable
that, of course.)



-- 
Matthias Urlichs     |     noris network AG     |     http://smurf.noris.de/
