From: "Matthias Urlichs" <smurf@noris.de>
Subject: Re: Reserved Blocks
Date: Thu, 26 Sep 2002 10:05:54 +0200
Message-ID: <20020926100554.A32363@noris.de>
References: <15749.46844.233761.653142@laputa.namesys.com> <20020916125116.B8E96297C@hofmann.snowcra.sh> <15749.56464.253411.12957@laputa.namesys.com> <20020916174109.A21027@namesys.com> <m31y7ij62k.fsf@multivac.cwru.edu> <20020926101942.A5436@namesys.com> <20020926085513.Y32363@noris.de> <20020926110226.A9182@namesys.com> <20020926095942.Z32363@noris.de> <20020926120318.A10346@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11552-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20020926120318.A10346@namesys.com>; from green@namesys.com on Thu, Sep 26, 2002 at 12:03:18PM +0400
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Hi,

Oleg Drokin:
> This is not true for reiserfs in 2.4/2.5 kernels.
> There first plain block is allocated and on file close it is converted
> to the in-tree "direct item" if possible.
> 
Ah, OK. I didn't know that you do it that way.

-- 
Matthias Urlichs     |     noris network AG     |     http://smurf.noris.de/
