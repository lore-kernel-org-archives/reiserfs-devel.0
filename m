From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfsprogs release
Date: Mon, 12 Aug 2002 15:00:23 +0400
Message-ID: <200208121500.23626.vitaly@namesys.com>
References: <200206251829.25799.vitaly@namesys.com> <200208121442.19656.vitaly@namesys.com> <1029154185.16421.161.camel@irongate.swansea.linux.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11161-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1029154185.16421.161.camel@irongate.swansea.linux.org.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

> On Mon, 2002-08-12 at 11:42, Vitaly Fertman wrote:
> > Hi all,
> >
> > a critical bug was fixed in reiserfsck journal replay process,
> > so we decided to release a new 3.6.3 progs with just 2 bug
> > fixes related to it.
>
> What version does reiserfsck in this report. That way I can update

All utilities have the same version as the package has, so 3.6.3.

> CHANGES to indicate the 3.6.3 bits are required.
>
> Right now it says 3.x.1b - should it now say 3.6.3 ?

This bug was introduced in 3.6.2, so 3.x.1b was not affected.
But 3.x.1b contains many other bugs which were fixed in 3.6.2.

-- 

Thanks,
Vitaly Fertman
