From: Oleg Drokin <green@namesys.com>
Subject: Re: what do you do that stresses your filesystem?
Date: Mon, 23 Dec 2002 17:18:48 +0300
Message-ID: <20021223171848.A808@namesys.com>
References: <3E06F360.7000708@namesys.com> <20021223120357.GC13460@hvs.envisage.co.za> <20021223151045.A7697@namesys.com> <3E06FDC1.5040907@namesys.com> <20021223122110.GD13460@hvs.envisage.co.za> <20021223152640.A7773@namesys.com> <20021223123718.GE13460@hvs.envisage.co.za>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12213-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20021223123718.GE13460@hvs.envisage.co.za>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hendrik Visage <hvisage@envisage.co.za>
Cc: Hans Reiser <reiser@namesys.com>, ReiserFS <reiserfs-list@namesys.com>

Hello!

On Mon, Dec 23, 2002 at 02:37:18PM +0200, Hendrik Visage wrote:
> > > > >>Another slowness (especially with reiserfs3 without the notails option) 
> > > > >>is "dd if=/dev/zero of=/swapfile bs=1k count=1024k"
> > > > >Well, I'd say that artrifical limiting of amount of data to be transferred
> > > > >is a cheating ;).
> > > Well... It's not that people needs unlimited swapspace ;^)
> > I mean limiting of blocksize.
> The only reason for the bs= option is to have a defined size for the
> swapfile, ie. bs*count=swapsize. I could've changed the line to
> "dd if=/dev/zero of=/swapfile bs=1024k count=1k"

My measurement show that I save 2+ seconds of system time by doing this.
Should be even more of savings after reiserfs_file_write() will be accepted
into main kernel. Almost no effect on real time for me, though. (~30 sec)

Bye,
    Oleg
