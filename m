From: Jose R R <jose.r.r@metztli.com>
Subject: Re: Debian kernel 4.7.2-1 build on Sid and Jessie fails
Date: Mon, 5 Sep 2016 14:27:25 -0700
Message-ID: <CAM12Q5Shjh3GvczZNj4YYfvxRDTKk2HtGnMV0pnyvsp86bQRcw@mail.gmail.com>
References: <20160902103548.87A163318CC@mictlantecuhtli.metztli-it.com>
 <1472831351.25374.61.camel@decadent.org.uk> <1472923847.25374.75.camel@decadent.org.uk>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=n9frKnQQtixKOOaBwVBMbfnV7FgmJruIuX5ORTjiKf0=;
        b=jdqgRpEQQSYDtI0qIdZDKWopeaoTT821zh3Xs40sxpIV0A4AZB/hc8aSXPSDLTHYJF
         4thl5091ifbQlpe1dKByeI+BOaGLIGJWOx7Qpr/PQrSfHpfYaS4X9SK7fkV9abslBxMY
         i1HkYoY0quWX9hZulpqNzeSYeRU0sBvmvqDg0SFkSzWX8tkv1PZsJowqLWRT/fDeEvpQ
         BGEblRyIAHjfA6fJgm1vymYd39E4F9Ijrb9ZIB3O/RTBCVycXp1orpi1kx6fIHyklxjn
         zW8InucgY+mIaJ6wRAZj2a2uHm8c3cum7qChJkMDxXe5mrnf5IWkWtgpGozAJlu3SaxD
         rcFw==
In-Reply-To: <1472923847.25374.75.camel@decadent.org.uk>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Hutchings <ben@decadent.org.uk>
Cc: debian-kernel@lists.debian.org, debian-boot@lists.debian.org, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

On Sat, Sep 3, 2016 at 10:30 AM, Ben Hutchings <ben@decadent.org.uk> wrote:
>
> On Fri, 2016-09-02 at 16:49 +0100, Ben Hutchings wrote:
> > On Fri, 2016-09-02 at 03:35 -0700, Jose R Rodriguez wrote:
> > >
> > > Niltze, all!
> > >
> > > Currently running Reiser4-patched kernel 4.7 built from pristine
> > > source upstream:
> > >
> > > Linux mictlantecuhtli 4.7.0.tezcatlipoca #1 SMP PREEMPT Wed Aug 10
> > > 05:04:17 PDT 2016 x86_64 GNU/Linux
> > >
> > > On the other hand, I have experienced multiple issues building
> > > Debian'ized kernel 4.7.2-1 -- first building on Jessie modified for
> > > GCC 4.9;
> > >  and then attempting build on Jessie-built GCC 5.3. And finally I
> > > attempted the build on Debian Unstable and it failed, as well.
> > > Below are the offending sections -- which, by the way -- roughly
> > > correspond in all instances of Debian and GCC:
> > [...]
> >
> > This happens if you invoke debian/rules directly and not through dpkg-
> > buildpackage.
>
> Rather, it can happen in some circumstances, but...
>
> > debian/rules.real does:
> >
> >     ifdef OVERRIDE_HOST_TYPE
> >       CROSS_COMPILE := $(OVERRIDE_HOST_TYPE)-
> >     else ifneq ($(DEB_BUILD_ARCH),$(DEB_HOST_ARCH))
> >       CROSS_COMPILE := $(DEB_HOST_GNU_TYPE)-
> >     else
> >       CROSS_COMPILE :=
> >     endif
> >
> > So the assumption is that all those architecture variables, or none,
> > are defined.  dpkg-buildpackage does define them all.
> >
> > However, debian/rules does:
> >
> >     DEB_HOST_ARCH := $(shell dpkg-architecture -qDEB_HOST_ARCH)
> >
> > and does not define any other architecture variables.
>
> ...variable definitions in debian/rules don't automatically propagate
> to debian/rules.real, so this doesn't explain the failure.  And
> although I have seen this failure myself, I can't reproduce it now.
>
> > We should probably include /usr/share/dpkg/architecture.mk in
> > debian/rules instead.
>
> I now think it should be included in debian/rules.real.  However, until
> I have a way to reproduce the problem, I'm not going to attempt a fix.
>
> Ben.
>
> --
> Ben Hutchings
> Once a job is fouled up, anything done to improve it makes it worse.

I much appreciate your hints, Ben. The fault was mine. After a couple
of days of struggle, I modified debian/rules.real by inserting a
couple of extra directives and compared the generated debian/control
file output with previous ones - which provided me relevant insight to
correct my mistake and generate required *.udebs for d-i. Thank you
again, Ben.


Best Professional Regard.

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
