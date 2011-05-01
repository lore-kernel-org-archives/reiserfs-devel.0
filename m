From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Corruption with Gentoo's PORTAGE_TMPDIR
Date: Sun, 01 May 2011 22:47:42 +0200
Message-ID: <4DBDC6EE.1060402@gmail.com>
References: <4DBD80CF.9070903@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=el97/ibotM92+2BtzgA8RNBM61DeIUObqoxqRN5YzBU=;
        b=x82fMrML0jptVfUD8NWsaRRO1t1DvE6GP+O25S3TEReHxuYpoZKhdMl5D33EAa3hXl
         f8EIqET+cQHX6a1eBOjiWodDQh9LwTdZunPBgJS5MqW0ePSPzHQI8v1CDpBARWndUX90
         ZdhJmdLNdcwhNyOiQLlcNAsnGrrNhd3ubhjBc=
In-Reply-To: <4DBD80CF.9070903@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: dE <de.techno@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 05/01/2011 05:48 PM, dE wrote:
> Hi.

Hello.

>
> I've started using reiser4 for a couple of months I've experienced a few
> crashes which appear to relate themselves directly to reiser4, however
> they're not reproducible.. but one thing is.
>
> I'm using Gentoo with vanilla kernel 2.6.37 and Zen patches.
>
> I reported a bug for a compile time failure of a java related package -
> http://bugs.gentoo.org/show_bug.cgi?id=365503
>
> The problem resolved when I mount binded a xfs partition to
> PORTAGE_TMPDIR directory.
>
> If you want I can attach the both the PORTAGE_TMPDIR (one in xfs, the
> other in reiser4)

Do you have compression enabled?
If no, then does the problem disappear on the
partition formatted with -o create=ccreg40 option?

Thanks,
Edward.

> --
> To unsubscribe from this list: send the line "unsubscribe
> reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at http://vger.kernel.org/majordomo-info.html

