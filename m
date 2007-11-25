From: "Dushan Tcholich" <dusanc@gmail.com>
Subject: Re: Reiser4 for 2.6.23?
Date: Sun, 25 Nov 2007 21:56:10 +0100
Message-ID: <a08621850711251256s60e6f402rdaa5e8d4c618857a@mail.gmail.com>
References: <20071124182547.378b3679.listen@mjh.name>
	 <alpine.DEB.0.99999.0711252145590.7426@sheep.housecafe.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=4jGPPfu4A0uQ/R7jGpwTWTUJb0zixEtpYZ9ZUD6Cv18=;
        b=xN8UCugzgjP6uFNEr7La+eQSG/3GysCp2cDD0Wura+jXVn/7PDOjD5swmSHFTCBr99KHMw8gnkctMSnjrD/oztq7LtEugwMd+CGkqmx867cIMQhdb79weJX3b/UJ5gC66putMKXDxTCbJJmPpP3kV7JAgAEUM2hQ43q/tBxG7ME=
In-Reply-To: <alpine.DEB.0.99999.0711252145590.7426@sheep.housecafe.de>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Christian Kujau <lists@nerdbynature.de>
Cc: reiserfs-devel@vger.kernel.org

On Nov 25, 2007 9:53 PM, Christian Kujau <lists@nerdbynature.de> wrote:
> On Sat, 24 Nov 2007, Milan Holz=E4pfel wrote:
> > What about 2.6.24?
> > (I'd like to continue using Reiser4 with a mostly vanilla kernel wi=
th
> > some additional patches like TuxOnIce.)
>
> well, there's the -mm series[0] with Reiser4 support, but it's not va=
nilla
> anymore.
>
> Out of curiosity: is there a (current) TODO list on what needs to be
> changed in the Reiser4 code until it can be included in mainline? I t=
hink
> I've seen such a thing before, but it was quite a while ago. Is inclu=
sion
> still a topic?
>

http://pub.namesys.com/Reiser4/ToDo

> Christian.

Dushan

>
> [0] http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/?O=
=3DD
> --
> BOFH excuse #50:
>
> Change in Earth's rotational speed
-
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
