From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 1/5] mtd: fix bdev exclusive open bugs in
 block2mtd::add_device()
Date: Sat, 13 Nov 2010 13:10:34 +0200
Message-ID: <1289646634.2218.25.camel@localhost>
References: <1288628129-12811-1-git-send-email-tj@kernel.org>
	 <1288628129-12811-2-git-send-email-tj@kernel.org>
	 <1289644735.2218.8.camel@localhost>  <4CDE6BB2.5070806@kernel.org>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:reply-to:to:cc
         :in-reply-to:references:content-type:date:message-id:mime-version
         :x-mailer:content-transfer-encoding;
        bh=zoMdvMS5DapMz5v1pcmuOIe083lYCVVZCcehn+hGb0g=;
        b=JmL1hA+Rws5hqeWognLpSpdYZc/y1SEtH2wF0OsoSdR3eZQ3Y+Q2uEsJckikLUwtSQ
         ljL+auUzBpJVBRZViiu8zXHG3x9lCX5AxK+IkPpW2ZbF2YpaJnZhIAdVz+cq0UCwuNVb
         qmQyGkvQiu+PtT+FKqK7O7DZmskiqHKwJCweM=
In-Reply-To: <4CDE6BB2.5070806@kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Tejun Heo <tj@kernel.org>
Cc: axboe@kernel.dk, hch@infradead.org, linux-kernel@vger.kernel.org, petero2@telia.com, schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, jack@suse.cz, akpm@linux-foundation.org, adilger.kernel@dilger.ca, tytso@mit.edu, mfasheh@suse.com, joel.becker@oracle.com, aelder@sgi.com, dm-devel@redhat.com, drbd-dev@lists.linbit.com, neilb@suse.de, leochen@broadcom.com, sbranden@broadcom.com, chris.mason@oracle.com, swhiteho@redhat.com, shaggy@linux.vnet.ibm.com, joern@logfs.org, konishi.ryusuke@lab.ntt.co.jp, reiserfs-devel@vger.kernel.org, viro@zeniv.linux.org.uk, linux-mtd@lists.infradead.org

On Sat, 2010-11-13 at 11:42 +0100, Tejun Heo wrote:
> Hmmm... not really.  The patch is small enough and splitting it won't
> really buy as any better bisectability.  Splitting patches into
> logical changes is a good thing but it's no religious dogma.  Let's
> apply it to the point it actually helps.

Well, it is more about if your second fix is buggy, we could revert it
without reverting the first fix. But anyway, this is not a big deal, so
let's forget about this indeed.

--=20
Best Regards,
Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
