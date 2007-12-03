From: "Edward Shishkin" <edward.shishkin@gmail.com>
Subject: Re: [PATCH 2/2] reiserfs: Add mount counting
Date: Tue, 4 Dec 2007 01:56:33 +0300
Message-ID: <5c7c368b0712031456p120634behc13f2d546df8659b@mail.gmail.com>
References: <474B4BCF.1000905@suse.com> <47545D0D.6080608@suse.com>
	 <5c7c368b0712031236i33abc7bdtd7a14354c67169b3@mail.gmail.com>
	 <475469B8.4050004@suse.com>
	 <5c7c368b0712031251w75febd3bve5aee70c4935a7c9@mail.gmail.com>
	 <475475E5.1010400@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=iXTk4vI60TvcFMmxFoXtYkLA1xv1Dt5wZS/otCkW2SM=;
        b=xbfBSpvDCt44y0aAoNLMeiPXVaYvDRblat5GbgJSUSj2sSOIz0iBgN5JL+mUqHGEVtx3x95b6x2cXXxFyIiTmxnziezkXZNWGmQ8XnzXYl15kyT+EDC22JDB+cM0ADXqUOuRXx1ZagzWdiv0srz/lbnl3qHyF2MlcSRwDA3ze1k=
In-Reply-To: <475475E5.1010400@suse.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>, Vladimir Saveliev <Vladimir.Saveliev@sun.com>

On 12/4/07, Jeff Mahoney <jeffm@suse.com> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Edward Shishkin wrote:
> > On 12/3/07, Jeff Mahoney <jeffm@suse.com> wrote:
> > Edward Shishkin wrote:
> >>>> Hi Jeff.
> >>>>
> >>>> Personally, I don't object.
> >>>> What does official reservation mean?
> >>>> I can send a request to Hans, but I guess
> >>>> we'll receive his "yes" or "no" with substantial delay..
> > I just mean that those 12 bytes in the superblock are guaranteed not to
> > be used for something else. Given the pace of reiserfs development, I
> > don't expect this to be a problem as there are 76 more of them. :)
> >
> >> Well, I promise to not use them for something else ;)
>
> Great. That's the assurance I was looking for. :)
>
> >> It seems we need something like reiserfsprogs-3.6.20?
>
> I actually posted a patch against reiserfsprogs-3.6.20 that reserves the
> same fields. It also implements the use of those fields. I have an
> updated version that treats timestamps in the future as suspect and
> forces a check. I'll post the update later today.

Sorry, I am a bit confused..
The latest git version of reiserfsprogs is 3.6.19;
The latest website version is also 3.6.19.
At the same time I can google and see that some distros
use reiserfsprogs-3.6.20.
Suse 10.3 uses "reiserfs utility package" 3.6.19-92
Also I remember that Vladimir worked on some version
of reiserfsprogs not so long ago.

Any ideas about really latest version?

Thanks,
Edward.

>
> If there's interest in releasing a reiserfsprogs 3.6.21, I have some
> patches that we've maintaining locally for a while I'd like to submit
> for inclusion. Also, I don't think the code base would hurt from a
> whitespace removal run. :)
>
> - -Jeff
>
> - --
> Jeff Mahoney
> SUSE Labs
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v2.0.4-svn0 (GNU/Linux)
> Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org
>
> iD8DBQFHVHXkLPWxlyuTD7IRAhM1AJ9vBrHDW3uhRb15HnO6BNpQGOdIiwCfUHyL
> aUwybiy8ZfuOwg0lXZ+xEKE=
> =DpoT
> -----END PGP SIGNATURE-----
>
