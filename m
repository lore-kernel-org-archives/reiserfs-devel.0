From: "Edward Shishkin" <edward.shishkin@gmail.com>
Subject: Re: [PATCH 2/2] reiserfs: Add mount counting
Date: Mon, 3 Dec 2007 23:51:34 +0300
Message-ID: <5c7c368b0712031251w75febd3bve5aee70c4935a7c9@mail.gmail.com>
References: <474B4BCF.1000905@suse.com> <47545D0D.6080608@suse.com>
	 <5c7c368b0712031236i33abc7bdtd7a14354c67169b3@mail.gmail.com>
	 <475469B8.4050004@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=/icYEG390bhoNaiQVFzABX5+ML1CCvrTNLq4gZLJKG8=;
        b=UNWEUZ7apyN9gRD9f1AqCwzXCvI6zxSIMfqiSZRfTip9EJpl2FMzj+ln7g89jvAFBoj9DwKBu65SkpPlmlqrPWJQxtO7LFh78O2wYqu6pBoTNY8XynPljL+XyBuFR23CJgG+vEISBA7LkigDNKFY/C+jo5h/rJ7rU4Taw9WNVHo=
In-Reply-To: <475469B8.4050004@suse.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

On 12/3/07, Jeff Mahoney <jeffm@suse.com> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Edward Shishkin wrote:
> > Hi Jeff.
> >
> > Personally, I don't object.
> > What does official reservation mean?
> > I can send a request to Hans, but I guess
> > we'll receive his "yes" or "no" with substantial delay..
>
> I just mean that those 12 bytes in the superblock are guaranteed not to
> be used for something else. Given the pace of reiserfs development, I
> don't expect this to be a problem as there are 76 more of them. :)

Well, I promise to not use them for something else ;)
It seems we need something like reiserfsprogs-3.6.20?

Edward.

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
> iD8DBQFHVGm4LPWxlyuTD7IRAlnYAJ96feQvRpbLlOtPoxPbziOb1BgsQQCgnmrI
> GC9Hxg0FnQnBAXtOwvri+SE=
> =Gfxe
> -----END PGP SIGNATURE-----
>
