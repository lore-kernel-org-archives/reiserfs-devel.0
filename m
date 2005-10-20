From: michael chang <thenewme91@gmail.com>
Subject: Re: Reiser4 + laptop -> ouch
Date: Thu, 20 Oct 2005 16:00:25 -0400
Message-ID: <b14e81f00510201300k74c3d428rfac2dbb2969e3e3d@mail.gmail.com>
References: <43537D56.3020208@eastwind.ru> <op.sysz7pxnth1vuj@localhost>
	 <200510182209.19370.zam@namesys.com> <op.syxzvsesth1vuj@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26585-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <op.syxzvsesth1vuj@localhost>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: PFC <lists@boutiquenumerique.com>
Cc: Alexander Zarochentsev <zam@namesys.com>, reiserfs-list@namesys.com

On 10/20/05, PFC <lists@boutiquenumerique.com> wrote:
>
> I have this kernel :
>
> linux-2.6.11-cko1-swsusp2

Try a 2.6.12 or 2.6.13 kernel, without swsusp2 patches included (since
they don't work anyways, you shouldn't run a kernel with them in case
they do funky things).  Maybe a recent -mm kernel?

> I chose this because it has reiser4 included, and software suspend 2...
> turns out software suspend does not work on this laptop, so I don't use
> it...
>
> How can I get the filesystem version ? I grepped the reiser4 kernel
> sources for "version" but nothiing relevant came out.
>
> Thanks for your help.
>
>
>
> On Tue, 18 Oct 2005 20:09:19 +0200, Alexander Zarochentsev
> <zam@namesys.com> wrote:
>
> > Hello,
> >
> > On Monday 17 October 2005 22:56, PFC wrote:
> >> I've been using Reiser4 on my laptop for a while and all I can say is,
> >> well, that's the only filesystem that makes a crap 5200rpm drive
> >> responsive and usable. That's really great !
> >>
> >> However, there are a few problems...
> >>
> >> Sometimes, when I power down the laptop, the usual power down sequence=
 :
> >> - Unmounting Filesystems
> >> - Remounting FS read-only
> >> - Power Down
> >>
> >> Stops at "Unmounting Filesystems" and stays there forever ; and I have
> >> to
> >> shutdown the thing manually, pressing for 10 seconds on the power
> >> button.
> >
> > which reiser4 version are you using ?
> >
> >> Annoying.
> >>
> >> Also, a few days ago, my laptop battery died and the thing had a hard
> >> shutdown. The harddisk had spinned down a moment ago (I remember heari=
ng
> >> it doing its clunk-bzzzzz....). Before you mention, no, I don't use th=
e
> >> thingie to automatically shutdown the laptop just before the battery
> >> dies,
> >> because ACPI sucks on mine, and 50% of the time it says 0% charge left
> >> when, in reality, it's at 99%, and the damn thing would shut itself do=
wn
> >> every 5 minutes.
> >>
> >> So, after that, my Reiser4 FS died and I had to run a fsck with
> >> rebuild-tree from a kanotix boot cdrom.
> >>
> >> What happened ?
> >
>
>
>


--
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
