From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: Can reiser4 patch be updated to handle Linux 3.7
Date: Tue, 11 Dec 2012 18:48:17 +0400
Message-ID: <1420584.8B0lPTBpzO@intelfx-laptop>
References: <da336016c20f6bbd531fa7c76e221a0b@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-transfer-encoding:content-type;
        bh=LA3qvUupKiiD12q0xCSgM1nmQwYVCaAFZK8UQV9zHIQ=;
        b=O/YzoRoJl7CPCxH61XXVr6Q5EY2kjaPbOexKAF1xHTOJ0zlrv7BkT06QMPJlWZQwAH
         mGfAHOZ9MsIcHrTryibtt+1AOqY9ucndnwBf3Fsm6aLrl/HF+M1vGkwTVMLPFDTLox1y
         CEHEE6j8cvJrrV9jgrJjUXM1sCry0v1Hny+rmyDVk1taJkaIJ8XT7IDOw4+TAsO2+tlK
         aMnSx8RlCsUtj2Z9cOWmpTWpg56/AsphcpMyMew7YUzy1SvDcUZoFYHiAef9x4afqRad
         c97A3ItVxpfSAy+RuV4n6PuSpxd/9cCcy1mBg72qqLOLlGRMdwZxmAKpNbdK5bksFrJ7
         +bKw==
In-Reply-To: <da336016c20f6bbd531fa7c76e221a0b@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

On 12 December 2012 00:18:14 doiggl@velocitynet.com.au wrote:
> Hello,
> Can reiser4 patch be updated to handle Linux 3.7
> http://www.kernel.org/pub/linux/kernel/v3.0/linux-3.7.tar.bz2
> Cheers Glenn

Hello,

I'll attempt to port the existing patch to 3.7 in a few days... Given there 
are no significant API changes like it was in 3.0->3.2 case.

Regards,
Ivan.

> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
