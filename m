From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4 and quotas
Date: Sat, 14 Feb 2015 09:51:25 +0100
Message-ID: <54DF0C8D.7000508@gmail.com>
References: <1423863256.8650.2.camel@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=I3LR55hOCkY8+FdCKkZkn4+rXw2HezNx9vv3kNt8G3w=;
        b=edMQ/cfSwdHccnCNIsaBqZVQfdDEWuUfcTyz88pI9xnBGdACeaeVZt1lkNET/pDgF2
         45mIuxJ13Q9RXLvVinGqfhoUf8vxODsn1jceRGGpclRmb2ihoYVffIqBLfAQ+jUyf/T0
         pKnRXOHOjrB5QJHdR+rMwMwJnw+hjnchsRb4lAe1JT5tnZQKPOT/Sze88aVbiuKX8MQG
         Ya7w9V1gZslhx00yckhc+Agw7TsMRUm5RbmDVW2RUyrV03NDV8RrgHyeQpb0y9CxDdzY
         ycFrcJX8SBvm0CcdUy55iHQ/i5rZQgbFN3XCrtb3KzHfOnMPWe7ETaxuOGdW3J2B9cX1
         hy0w==
In-Reply-To: <1423863256.8650.2.camel@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org


On 02/13/2015 10:34 PM, Ivan Shapovalov wrote:
> Hello,
>
> the question is simple: do we support quotas?


Nop.


>
> There is some code calling into that subsystem, but no
> ->quota_{read,write} in super_operations...


Someone started to implement it long time ago,
so there is a number of residual quota hooks in the code.


>
> /*
> Also, super_block's ->dq_op and ->s_qcop are not set.
> */
>

