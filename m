From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [RFC] Smart fibration plugin ext_4321
Date: Mon, 26 Dec 2016 20:47:30 +0200
Message-ID: <586165C2.3000702@gmail.com>
References: <CADW=+3=Vwi1LFJn8imp7H6woiRP2Oa0=Q=_K-dDqc=hc2cOkZg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-transfer-encoding;
        bh=+mp5b3lJKcs+gMIpnAYWWIVs0i3Zz5UDwGeMNNiOg/s=;
        b=uwyzHM6TWUbESXHOUC0RW50dZbLE1k8qGnbG2buKmwUTQ/bf9dftH8SV5yzuCWi5sN
         Mj/QtX/IePIED/HQ3t7nukFYsVY9oxdWNgB4Y6DMJLMpvXij6vEVkzhll/uVqZwoCju6
         /c1Kmk1bm1oXJ/m6m9W2DqT6DXnxrUNJ55wECeqIIcHzhnlUTD7XFgqCpfw7yTVdfgv+
         Q6cuGf2D+o652GRyyGH/L3ulyEnZe8pkcmDVxotK7cmGYisnvwdfULJEY+i56IDymGKx
         XDOozLMLO8xB4OsXK3ZsGnR1R+/Jbo4HcRYGy3TBRZSE6hDKi9SaVxqVIr/WVl+rGSZU
         nwFA==
In-Reply-To: <CADW=+3=Vwi1LFJn8imp7H6woiRP2Oa0=Q=_K-dDqc=hc2cOkZg@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>



On 12/25/2016 02:59 AM, Dušan Čolić wrote:
> Fibration is a great way to decrease fragmentation and increase throughput.
> Currently there are 4 fibration plugins, lex, dot.o, ext_1 and ext_3
> and they all have their upsides and downsides.
>
> Proposed fibration plugin combines them all so that it combines files
> with same extensions for 1, 2. 3 and 4 character extension  in groups
> and sorts them in same fiber group.
>
> With this fibration plugin all eg. xvid files would be in same group
> in folder on disk sorted alphabetically


What application wants all xvid files to be in the same group?
Do you have any benchmark numbers which show advantages
of the new plugin?

Thanks,
Edward.

>   so that we will avoid putting
> small files between them and in that way reduce fragmentation. That
> group (xvid 4 character extensions) would be among last groups under
> one directory so that all small files would be written before it.
>
> Problem with the attached patch is that currently every fibre value is
> defined as u64  (eg. static __u64 fibre_ext_3) but if I understood
> correctly comments in kassign.c and fibration.c fibration part of the
> key is only 7 bits long.
> If that is true how did fibre_ext_3 worked?
>
> Thanks
>
> Dushan

