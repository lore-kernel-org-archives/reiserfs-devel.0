From: Hendrik Visage <hvisage@envisage.co.za>
Subject: Re: early flushing of data
Date: Mon, 12 Aug 2002 16:24:34 +0200
Message-ID: <20020812142434.GZ282@hvs.envisage.co.za>
References: <3D57BDA3.2010903@namesys.com> <20020812140529.GY282@hvs.envisage.co.za> <3D57C2DB.8020204@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11169-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3D57C2DB.8020204@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Hendrik Visage <hvisage@envisage.co.za>, reiserfs-list@namesys.com

On Mon, Aug 12, 2002 at 06:14:51PM +0400, Hans Reiser wrote:
> Hendrik Visage wrote:
> >On Mon, Aug 12, 2002 at 05:52:35PM +0400, Hans Reiser wrote:
> >>
> >>It is interesting to consider whether one should flush dirty nodes to 
> >>disk with only a small delay after they are modified, or keep them in 
> >>cache for a longer time.
> >>   
> >Thus a configurable setting (would love/prefer a per mount setting ie.
> >one for my log mount, and the other for the email mounts etc.) would
> >be nice.
> >
> Yes, but what should the default be (remember that 97% of users or more 
> won't change the default)?

To this I'd ask: What's the settings in XFS and JFS?
 Seeing they have "experience" behind them, it'll be a good starting point.


