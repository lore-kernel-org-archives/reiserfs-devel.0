From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: How to handle bad blocks on Reiser4?
Date: Sun, 07 Mar 2010 22:47:23 +0100
Message-ID: <4B941EEB.3010206@gmail.com>
References: <4B941113.2090708@tut.by>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=2AYkLp5fRuLYJj3zKspPKIFCKotlCQnlWac5dFoBXXM=;
        b=HXdaFZDxf7nIN4hGhrknFy5bzfTFz2CGH7rn/V7e/WU858o3ITee8bauuH4FkYhrMG
         IYqPGCYf6JOOvms/aSfiu9Kx7MHfCvA+hsqgMOotFtWL6Izlg7+uIJyWiAgVPjzaAC/E
         dQLyNgkfUeqB39yrbETLNJFxx5MgJgc52mqFc=
In-Reply-To: <4B941113.2090708@tut.by>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arnold Layne <kostet@tut.by>
Cc: reiserfs-devel@vger.kernel.org

I would recommend dd_rescue -A -B 4096
to the spare partition of the same size
with the following fsck the last one.

Edward.


Arnold Layne wrote:
> Instructions http://chichkin_i.zelnet.ru/bad-block-handling.html
> doesn't work with reiser4progs.
> -- 
> To unsubscribe from this list: send the line "unsubscribe
> reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

