From: "Artur Martins" <arturphk@gmail.com>
Subject: Re: Timing result of removal of 8012 files in 2 directories
Date: Sat, 26 Jul 2008 04:06:06 +0100
Message-ID: <b15ad7640807252006g67889f9am6197e4fab64a21a9@mail.gmail.com>
References: <11010.202.168.22.19.1216992345.squirrel@webmail.velocity.net.au>
	 <5e2ec5ac0807251215h22742a3bv21472b6643a3e518@mail.gmail.com>
	 <b15ad7640807252004l3c7b5c3ei8d2db7f1b8f35c87@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=a9MVan9RGsiet3AKf1oBVCkG7dQOTXhza/BKZuNFo2U=;
        b=mcsQq7zJuI+qCRZKPi+nlCB8TO/Xh9MSJOKqySWJoTXWV8+gTbqCXEVNq+nVYvfs9z
         iTlykc3WLIwY158yxBhrRYRvBpK7kiRwMjhkKDt8chQRw3/fqvyW/ohj6uZe3Cxmx5Uc
         Wp6k3qJiyNdB+0fg1ZykaPazQTIrLw3UrvrhU=
In-Reply-To: <b15ad7640807252004l3c7b5c3ei8d2db7f1b8f35c87@mail.gmail.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

That was just one of the most comic replies i have ever seen in a
development mailing-list.

Congratulations for that, Ronni.
However, one important point missing:

Even if Glenn did his job wrong, it's always important to try to contribute.
"thanks glenn but that is sparse information. pointless without more
specs" <-- Would do.

Thanks Glenn. And thanks Ronni too for the joke :)

Cheers, Phk


On Fri, Jul 25, 2008 at 8:15 PM, Ronni Nielsen <theronni@gmail.com> wrote:
>
> I just timed my toilet-visit:
>
> Poop-time: 2 minutes
> Wipe-time: 15 seconds
> Total # of flushes: 2 (I had a floater)
>
> Conclusion: Don't post random, non-comparative timings on unknown hardware!
>
> Regards,
> Ronni
>
> On Fri, Jul 25, 2008 at 3:25 PM,  <doiggl@velocitynet.com.au> wrote:
> > Timing result of removal of 8012 files in 2 directories:
> >
> > Removal of files test:
> >
> > Count 8012 files in 2 directories.
> >
> > Size:
> > # du -m /reiser4/old.rpms/
> > 22      /reiser4/old.rpms/.repodata
> > 11350   /reiser4/old.rpms/
> >
> > # time rm -rf /reiser4/old.rpms
> >
> > real    0m7.084s
> > user    0m0.004s
> > sys     0m3.192s
> >
> > Glenn
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
>
>
>
> --
> Venlig hilsen
> Ronni
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
