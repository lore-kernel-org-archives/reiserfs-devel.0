From: Richard Heycock <rgh@roughage.com.au>
Subject: Re: Reiser4 installation & kernel patching
Date: 23 Jun 2003 17:44:18 +1000
Message-ID: <1056354258.1449.34.camel@boadicea>
References: <000e01c33621$2ced8490$0200a8c0@xpstation>
	 <200306192030.58137.vitaly@namesys.com>
	 <000701c33681$d527c3e0$0200a8c0@xpstation>
	 <200306192112.42901.vitaly@namesys.com>
	 <001901c33756$fe776ae0$0200a8c0@xpstation>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14661-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <001901c33756$fe776ae0$0200a8c0@xpstation>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Sat, 2003-06-21 at 04:08, Fred -- Speed Up -- wrote:
> > > Can I use the bk reiser4 kernel folder and simply copy it into my
> kernel's
> > > fs directory and apply the little linux-[...].patch patch to get Reiser4
> > > into the kernel ?
> > no, there are quite a few changes all over the kernel code.
> > If you do not want wait a bit for coming snapshot and do not want to use
> > the latest snapshot for 2.5.60, I can make a patch against 2.5.72 for you.
> 
> That would be great ...
> Does the reiser team often modifies the kernel tree (other than the reiser4
> code, off course), so that it would be possible to release a patch against
> the latest 2.5 kernel ? We'd then just have to download a reiser4-kernel
> daily snapshot that we would include in the kernel source tree, and then
> just configure & compile the whole stuff. And maybe bk could automate both
> process : making a daily (or nightly :D) kernel patch and reiser kernel
> package, this will be the way for users and administrators to test your
> software without having to handle with bk ;)
> 
> > > If I succeed in installing all the software and get reiser4 running,
> I'll
> > > write a clear french howto for it ;)
> >
> > ;) ok
> > I have changed that install v4 page, is it better for you now?
> 
> Now it's all right ... but you'll hopefully have to change it again soon, if
> these daily snapshots are made available ;)

I'd be quite keen to try version 4 with the latest kernel release.

rgh

> 
> > -- 
> > Thanks,
> > Vitaly Fertman
-- 
"It is possible to make things of great complexity out of things
 that are very simple. There is no conservation of simplicity"
 -- Stephen Wolfram

Richard Heycock <rgh@roughage.com.au>
tel : 0410 646 369
key fingerprint : 909D CBFA C669 AC2F A937  AFA4 661B 9D21 EAAB 4291
