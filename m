From: "Xu CanHao" <xucanhao@gmail.com>
Subject: Re: Reiser4: File lost during log rollback.
Date: Wed, 5 Sep 2007 21:15:27 +0800
Message-ID: <6ec7a4340709050615i59cdec6ck32036d12b931cb79@mail.gmail.com>
References: <6ec7a4340708280229l61d86d1dsf113890277bee68e@mail.gmail.com>
	 <alpine.DEB.0.999.0709022011310.7103@sheep.housecafe.de>
	 <6ec7a4340709030319k58b3a1afm994e188cb37170fe@mail.gmail.com>
	 <6ec7a4340709030507u2cb968eche850f7365011c38@mail.gmail.com>
	 <alpine.DEB.0.999.0709042048160.7103@sheep.housecafe.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=t0DtvsP1vBpCUIF4toOzXjiE1BrCxfx2TL7+9hLmy0gHa7L+WlJtD7SrBv0W6pYM7n2kPhg2XmqzKHjFoZ8lVUwIvM/tywe/LJ8HUhsrggZXsAQREXwHDa+cUGZw3JJ65pnwycQuazyx1uffR9dIAff1g0doRMRzY/0HWAiHFTk=
In-Reply-To: <alpine.DEB.0.999.0709042048160.7103@sheep.housecafe.de>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Kujau <lists@nerdbynature.de>
Cc: reiserfs-devel@vger.kernel.org

2007/9/5, Christian Kujau <lists@nerdbynature.de>:
> On Mon, 3 Sep 2007, Xu CanHao wrote:
> > 1, The system had some power lost recently, I believe the file lost
> > during one time(I did not write to that file at once).
>
> Hm, I'm not entirely sure if Reiser4 guarantees userdata consistency or
> "just" meta-data consistency. If the latter is the case: if the
> filesystem was in a usable state, reiser4 helped - if not, one should
> try to reproduce it and file a bug...

Reiser4's wandering log is something different with traditional
data/meta-data consistency. And the problem is: the file
/usr/sbin/sendmail totally lost.

>
> > 2, Is there any evidence show that 2.6.22 much more stable(or at least
> > solved that behavior)?
>
> I don't use reiser4 on a regular basis, but given that development is
> still in flux, it's worth a try, IMHO.

Yes, definitely not on a production system.

>
> C.
> --
> BOFH excuse #251:
>
> Processes running slowly due to weak power supply
> -
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
