From: "Alexander Lyamin" <flx@msu.ru>
Subject: Re: The reiser4 .... what it really means
Date: Thu, 11 Dec 2008 17:36:03 +0300
Message-ID: <80294dc60812110636m70178aa3m4493e65fe4be302e@mail.gmail.com>
References: <494035ED.4000706@gmx.de> <49404165.6050806@gmail.com>
	 <494062F6.2040809@gmx.de> <4940FB0E.8050102@gmx.de>
	 <494105EB.3080204@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:sender
         :to:subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references
         :x-google-sender-auth;
        bh=NHqWQmVuv1ax+NmlqW+mu68crFbDJ2qn2DGqEP5RQsk=;
        b=tJqv1uTbFj4MLp/hQbR9ckw3fyk6DbrrJYfU1BfvHf3T9WGa3fCKWV6nNwoIlZgRar
         bn718A31oXwHEPbzv+TRWxhYYPru3hp/qpRIOeTd381FxVUwkyRFEzPECHjlMUS9r6cN
         wvMf0oxpRGMQNq9Xacxcco2U2/UnA6e15bwXM=
In-Reply-To: <494105EB.3080204@gmx.de>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ralph Ulrich <eulenreich@gmx.de>
Cc: reiserfs-devel@vger.kernel.org

On Thu, Dec 11, 2008 at 3:22 PM, Ralph Ulrich <eulenreich@gmx.de> wrote:
>>> But the fortunate way is to fork the kernel to fit him right to reiser4.
>
>> what kind of drugs you're on ?
>
> OK, to decrease:
>
> Why not a special reiser4 for a special /reiser4data mount where it will
> be possible
> 1. to adapt linux vfs behaviors
it does.
actually  VFS implementation is a plugin.

> 2. to experiment with special plugins that make a kind of WinFS (that
>   kind of really new features where Ms tried in vain)
Takes a lot of man-hours. Pointless w/o lots of man-hours.
>
> Ralph
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>



-- 
connecting the dots
