From: Hendrik Visage <hvisage@envisage.co.za>
Subject: Re: what do you do that stresses your filesystem?
Date: Mon, 23 Dec 2002 14:21:10 +0200
Message-ID: <20021223122110.GD13460@hvs.envisage.co.za>
References: <3E06F360.7000708@namesys.com> <20021223120357.GC13460@hvs.envisage.co.za> <20021223151045.A7697@namesys.com> <3E06FDC1.5040907@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12206-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E06FDC1.5040907@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Oleg Drokin <green@namesys.com>, Hendrik Visage <hvisage@envisage.co.za>, ReiserFS <reiserfs-list@namesys.com>

On Mon, Dec 23, 2002 at 03:12:49PM +0300, Hans Reiser wrote:
> >>Another slowness (especially with reiserfs3 without the notails option) 
> >>is "dd if=/dev/zero of=/swapfile bs=1k count=1024k"
> >>   
> >>
> >
> >Well, I'd say that artrifical limiting of amount of data to be transferred
> >is a cheating ;).

Well... It's not that people needs unlimited swapspace ;^)

> I suppose I shouldn't ask Hendrik how often he does this in the course 
> of his usual usage patterns....;-)

It does add a "too long" wait during installation processes, which happens
about once in a fortnight, (testing some stuff, fresh installs easier ;^)

Hendrik

