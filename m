From: Oleg Drokin <green@namesys.com>
Subject: Re: ReiserFS causes CPU high usage?!
Date: Fri, 28 Feb 2003 17:16:09 +0300
Message-ID: <20030228171609.A11614@namesys.com>
References: <200302280011.14488.liviu.voicu@huji.ac.il> <200302281511.56997.liviu.voicu@huji.ac.il> <20030228170737.B11516@namesys.com> <200302281612.32208.liviu.voicu@huji.ac.il>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13026-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200302281612.32208.liviu.voicu@huji.ac.il>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Voicu Liviu <liviu.voicu@huji.ac.il>
Cc: ookhoi@humilis.net, reiserfs-list@namesys.com

Hello!

On Fri, Feb 28, 2003 at 04:12:31PM +0200, Voicu Liviu wrote:

> > I just noticed:
> > > Mem:   255948k av,  250540k used,    5408k free,       0k shrd,   28344k
> > > buff 59512k active,             119096k inactive
> > > Swap:  514072k av,     144k used,  513928k free                  122280k
> > So if you add X and kde (and other heavy stuff to that), you basically have
> i just compile kde ( for now I used fluxbox and when I did renice -10 to X, it 
> becomed very slow )

So I would be interested in your RAM usage after you run X (even with the fluxbox).
Because now you cannot determine if stuff is slow or not. Is that right?

Bye,
    Oleg
