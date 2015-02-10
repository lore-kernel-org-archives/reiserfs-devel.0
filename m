From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH 2/2] reiser4progs: node41 layout support
Date: Tue, 10 Feb 2015 21:28:42 +0100
Message-ID: <54DA69FA.7020005@gmail.com>
References: <54DA46CE.5070203@gmail.com> <20150210215549.6e92f86e@Ulf.tvoe.tv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=73laciNIad7Oj70D8VlfHg4CyIU04W6jMKy4mMHBgeo=;
        b=gX24wuRT8TuIgiTrb4SxYt6gU+uLtfEUaXARv6NB9oteL7k2831O8bzTxRKy8BY/DH
         CNG6vC7OBBxHJ+6Ayz8Pi2PFD3bxRkMWMIMxVjNWTC7FZMWsSNfSmWEiqguRfZo9DBdt
         Gf8fgG74LNqNF7GhnO6derGiPyY/MdLHNqlIPUh7Qa02gAZ1U/IxWFCCjB94eEda+317
         TnH86/ofxZeO/MIc+2/Af4EVN1ut42LaZL7xjvt15CpGQTSMpDPx2kYMdvUNujmuB8gz
         K08yDlbC/6HKXuKvfl7Nkn3NqyYNJskMUfGjZZ7W9X0M9omgapL0EykeAUN0nUMMCOG+
         JR1Q==
In-Reply-To: <20150210215549.6e92f86e@Ulf.tvoe.tv>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>, dimas000@ya.ru

Hello,

This stuff is incomplete. This is only intermediate results for testing.
For the full picture reiser4 kernel module should update/check the
checksums, and fsck should check the checksums and repair the
tree, if something is wrong.

The program-maximum, however, is failover (mirroring / scrubbing)
based on the checksums.

Thanks,
Edward.


On 02/10/2015 07:55 PM, dimas wrote:
> hello!
> can this r4progs patch be claimed ready-to-go? i.e. should i ask distro
> maintainer to update r4prgos package, or should we wait for a new upstream
> version (1.10)?
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

