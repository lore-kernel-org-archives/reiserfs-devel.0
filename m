From: "Michal Piotrowski" <michal.k.k.piotrowski@gmail.com>
Subject: Re: [1/2] 2.6.22-rc6: known regressions v2
Date: Fri, 29 Jun 2007 19:55:35 +0200
Message-ID: <6bffcb0e0706291055p13abc260j98124c05b53560ac@mail.gmail.com>
References: <46852187.3080504@googlemail.com>
	 <20070629175920.6af0c62b@the-village.bc.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-ide-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=VPp8hleJmLtG5GF9JwhLHIE7Vmw2O452g0aCE3f7N9WQgN5pUKb/QWtn6Yc4p0Ljr1+ZP+Kr1bauqEvd/GkDtIWRJzmvwSbh3Pvis/ZTG+TXf7gbQCT6z//jGTsYc3ZZqI7k+q0Y+XURp5uiA9xaTieEXHdY9L69IW4y7UPbflE=
In-Reply-To: <20070629175920.6af0c62b@the-village.bc.nu>
Content-Disposition: inline
Sender: linux-ide-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Rodrigo Luiz <troops.of.doom@gmail.com>, alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@suse.cz>, Ben Collins <bcollins@ubuntu.com>, reiserfs-devel@vger.kernel.org, "Vladimir V. Saveliev" <vs@namesys.com>, Randy Dunlap <randy.dunlap@oracle.com>, linux-ide@vger.kernel.org, David Chinner <dgc@sgi.com>, Jeff Garzik <jeff@garzik.org>, Tejun Heo <htejun@gmail.com>, Rodney Gordon II <meff@spherevision.org>

On 29/06/07, Alan Cox <alan@lxorguk.ukuu.org.uk> wrote:
> > SATA/PATA
> >
> > Subject    : libata IT821X driver still fails! Hard-freezes system
> > References : http://lkml.org/lkml/2007/6/14/82
> > Submitter  : Rodney Gordon II <meff@spherevision.org>
> > Status     : unknown
>
> Not a regression as it seems this user's box has always been broken.

I removed this bug from the kr list.

Regards,
Michal

-- 
LOG
http://www.stardust.webpages.pl/log/
