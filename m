From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: reiserfs on removable media
Date: Wed, 2 Jul 2003 21:08:49 +0200
Message-ID: <200307022108.49841.Dieter.Nuetzel@hamburg.de>
References: <pan.2003.07.02.14.23.09.812119.20132@umail.hungrycats.org> <3F032A33.3050303@namesys.com> <1057172345.20904.923.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14809-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1057172345.20904.923.camel@tiny.suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>, Hans Reiser <reiser@namesys.com>
Cc: Andreas Dilger <adilger@clusterfs.com>, Zygo Blaxell <eazgwmir@umail.furryterror.org>, reiserfs-list@namesys.com

Am Mittwoch, 2. Juli 2003 20:59 schrieb Chris Mason:
> On Wed, 2003-07-02 at 14:53, Hans Reiser wrote:
> > >This is called ordered data mode, and exists on ext3 and also reiserfs
> > > with Chris Mason's patches.  Under normal usage it shouldn't change
> > > performance compared to writeback data mode (which is what reiserfs
> > > does by default).

Chris,

I thought data=ordered is the "new" default with your patch?

> > It had some impact, I forget exactly how much, maybe Chris can
> > resuscitate his benchmark of it?
>
> The major cost of data=ordered is that dirty blocks are flushed every 5
> seconds instead of every 30.  The journal header patch in my
> experimental data logging directory changes things so that only new
> bytes in the file are done in data=ordered mode (either adding a new
> block or appending onto the end of the file).
>
> This helps a lot in the file rewrite tests.

What's faster than with your patches? ordered|journal|writeback?

I thought is order: writeback < ordered < journal ;-)

Thanks,
	Dieter

