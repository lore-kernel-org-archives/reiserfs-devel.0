From: Matthew <jackdachef@gmail.com>
Subject: Re: Check for ccreg40
Date: Tue, 13 May 2008 11:51:28 +0200
Message-ID: <e85b9d30805130251j36bff6fcl899e817f07b9c7a4@mail.gmail.com>
References: <loom.20080512T225740-889@post.gmane.org>
	 <4828CFD5.7000408@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=1jHEjQ6j64tDFlq11mN3UnWR71Q2T800Zo2cx7xriDo=;
        b=mQtBA44HLNC3pR1Z/8iRKgxbLuV71/2orxpujwYhU1ce8srq2kkShj5T5wRGs69HFMQHCMdwSwKYzJYjuctHUrUEp8/dcNPRAWEJAtmYdHX4dgek67Qiuc5S3uU8lDaxTrVHJtbwYyCbsKJ4/flX77xA6qnPJT8Bwuu1SZr2ick=
In-Reply-To: <4828CFD5.7000408@gmail.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: geearf@free.fr, ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

On Tue, May 13, 2008 at 1:16 AM, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
> Mat wrote:
>
>
> > Hi,
> >
> > sure,
> >
> > debugfs.reiser4 -p /dev/foo
> >
> >
>
>  No, with the option "-p" debugfs.reiser4 (and other utilities
>  of reiser4progs package) prints the "default vector of plugins"
>  and doesn't look at /dev/foo..
>
>  Edward.
>
>
> > should print everything needed
> >
> > Regards
> >
> > Mat
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe reiserfs-devel"
> in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
> >
> >
>
>

oops, sorry,
I thought it would print the plugins of the current partition

is there a way by showing the plugins in using grep (e.g. whether it's
used lzo or gzip compression) ?

for example grep 'ccreg shows' the following, that should mean ccreg40
/ cryptcompression was used, correct ?

debugfs.reiser4  -t -f /dev/sdd8 | grep ccreg
debugfs.reiser4 1.0.6
Copyright (C) 2001-2005 by Hans Reiser, licensing governed by
reiser4progs/COPYING.

            create : id = 4 (ccreg40)
            object : id = 4 (ccreg40)
            object : id = 4 (ccreg40)
            object : id = 4 (ccreg40)
            object : id = 4 (ccreg40)
            object : id = 4 (ccreg40)
            object : id = 4 (ccreg40)
            object : id = 4 (ccreg40)
            object : id = 4 (ccreg40)
            object : id = 4 (ccreg40)
            object : id = 4 (ccreg40)
            object : id = 4 (ccreg40)
            object : id = 4 (ccreg40)
            object : id = 4 (ccreg40)

Thanks

Mat
