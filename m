From: Chris Mason <mason@suse.com>
Subject: Re: Horrible ftruncate performance
Date: 23 Jul 2003 10:38:58 -0400
Message-ID: <1058971137.2624.9.camel@tiny.suse.com>
References: <Pine.LNX.4.30.0307151407100.6563-100000@divine.city.tvnet.hu>
	 <200307151848.59027.Dieter.Nuetzel@hamburg.de>
	 <20030715170540.GA1213@namesys.com>  <3F1D69AC.5040302@namesys.com>
	 <1058892649.5042.29.camel@tiny.suse.com>  <3F1D7DD8.3010806@namesys.com>
	 <1058898249.2749.2.camel@tiny.suse.com>  <3F1E27BA.3070603@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15009-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F1E27BA.3070603@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Oleg Drokin <green@namesys.com>, Dieter N?tzel <Dieter.Nuetzel@hamburg.de>, Szakacsits Szabolcs <szaka@sienet.hu>, Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>, reiserfs-list@namesys.com

On Wed, 2003-07-23 at 02:14, Hans Reiser wrote:
> >
> >Heh, everything needs to be zero defect ;-)  But I completely agree
> >about not adding new item types or other format changes.  Still,
> >non-extent filesystems can create holes faster than we can,
> >
> by using a format that is better designed for large holes....
> 

They have pointers to 4k blocks, we have pointers to 4k blocks, our
pointers should be able to do everything their pointers can do ;-)

> > so it is
> >worth talking about ways to fix it (within the constraints of existing
> >code).
> 
> V4 is going out for outside testers this week.  It blows v3 away in 
> performance, space usage, well structured code, scalability, features, 
> everything really.  The only reason to use V3 is that it is highly debugged.
> 

It's awesome that v4 is going out and has a number of features to
improve things over v3.  The point is that we need to show that once a
format has been chosen we can continue to support and improve the FS
within the confines of that format.  

If our only answer to bad performance is reformat with v4, or upgrade to
v4 (if some v3 plugin ever exists), then people lose confidence in our
ability to support the code we've written, and will assume they'll hit
the same problem with v4 later on.  We've got to show we are committed
not just to fixing bugs, but to keeping up with the baseline of expected
features/performance whenever possible.

The stable FS can't be buried just because the new unstable one happens
to be released ;-)

-chris


