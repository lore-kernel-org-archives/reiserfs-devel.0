From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: no reiserfs quota in 2.4 yet? 2.4.21-pre4-ac4 says different
Date: Fri, 21 Feb 2003 14:31:44 +0100
Message-ID: <200302211431.44308.Dieter.Nuetzel@hamburg.de>
References: <20030217183957.O1284@humilis> <20030219234024.N20771@humilis> <1045703410.16042.70.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12854-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1045703410.16042.70.camel@tiny.suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com

Am Donnerstag, 20. Februar 2003 02:10 schrieb Chris Mason:
> On Wed, 2003-02-19 at 17:40, Ookhoi wrote:
> > > Alan has needed changes to generic quota code already in his patchset
> > > so probably just leaving out these changes should make everything work
> > > (but I haven't tested it recently).
> >
> > You mean, I should use only a few of these?
> >
> > 01-quota-v2-2.4.20.diff
>
> Not this, -ac already has it
>
> > 02-nesting-2.4.20.diff
> > 03-reiserfs-quota-23-2.4.20.diff
>
> Or these two, I've got an updated reiserfs-quota patch on top of the
> data logging code in testing here, it should apply more cleanly on -ac.
> The big delay right now is I'm trying to fix another latency bug in
> data=3Dordered support, and test the fix for the sd_block count on
> symlinks.

Chris do you have something handy (data=3Dordered latency)?
I'll give it a try with my lantency "test" under 2.4.21pre4aa3.

Thanks,
	Dieter

=2D-=20
Dieter N=FCtzel
Graduate Student, Computer Science

University of Hamburg
Department of Computer Science
@home: Dieter.Nuetzel at hamburg.de (replace at with @)

