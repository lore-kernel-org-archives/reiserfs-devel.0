From: "Xu CanHao" <xucanhao@gmail.com>
Subject: Re: Question about memory pressure freezes
Date: Sat, 28 Jul 2007 09:52:04 +0800
Message-ID: <6ec7a4340707271852y870e692sd7dddbe2916e4779@mail.gmail.com>
References: <1185488757.33588.6.camel@localhost>
	 <6ec7a4340707261840r34a68951s26a2691778c3ca15@mail.gmail.com>
	 <1185557881.8434.6.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=hwDyv92QDDcoP/voO/LcffOtMRiWaeWErRF59WO2ZzKxAyQVSLuZn0lhdE71JZhBthhqrY2nJyXr8EuPoY5leTOb95nPdonzReqZgiWpySTYecp9iNUPRPynytiRqvCCCmUfZ23YaKsBXrtQ8jzpVIsfYZ6zoWOVvpT8zAsNXiY=
In-Reply-To: <1185557881.8434.6.camel@localhost>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Zan Lynx <zlynx@acm.org>, Edward Shishkin <edward@namesys.com>, reiserfs-devel@vger.kernel.org

Hello!

    Since the default atom_max_size is RAM/4, that means 256MB of
maximum atom in your computer, and your HDD does 30MB/s which means
you'll have 8s-9s "flush/system freeze" time.

    IIRC, edward said the atom_max_size mount option is useless, so
I'd suggest you modify your reiser4/init_super.c and change:
       sbinfo->tmgr.atom_max_size = totalram_pages / 4;
to
       sbinfo->tmgr.atom_max_size = totalram_pages / 16;
which means your atom would have a maximum size of 64MB and a maximum
freeze time of only 2 seconds.

Thanks!


2007/7/28, Zan Lynx <zlynx@acm.org>:
> Edward answered my question mostly.
>
> But, I have 1 GB RAM and a Hitachi 7,200 RPM laptop drive.  It does
> about 30 MB/s.
>
> On Fri, 2007-07-27 at 09:40 +0800, Xu CanHao wrote:
> > Hello!
> >
> >    How much is your RAM?
> >    What is the result of your HDD's hdparm -t?
> >
> > Thanks!
> >
> > 2007/7/27, Zan Lynx <zlynx@acm.org>:
> > > I have often experienced nearly full system freezes for up to five
> > > seconds at a time while memory is being flushed to disk.
> > >
> > > I'm not sure if this is a general Linux problem or a Reiser4 problem, so
> > > I thought I'd ask.
> > >
> > > A sysrq-T during the freeze shows many processes trying to acquire a
> > > memory page, and Reiser4 flushing atoms and doing sync things.
> > >
> > > My working theory right now is that Reiser4 spends time flushing a lot
> > > of data at once before returning.
> > >
> > > If I am right about that, would it not make more sense to flush a few
> > > pages, return to the kernel, flush a few more pages, return to the
> > > kernel, etc, etc?  That way programs could get a bit of RAM and make
> > > some progress.
> > >
> > > Of course I could be completely off about what's going on.
> > > --
> > > Zan Lynx <zlynx@acm.org>
> > >
> > >
> --
> Zan Lynx <zlynx@acm.org>
>
>
