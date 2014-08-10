From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4: discard support with delayed issuing of discard requests
Date: Sun, 10 Aug 2014 22:07:50 +0200
Message-ID: <53E7D116.8050902@gmail.com>
References: <53E6A7F1.6030006@gmail.com> <20140810190210.033a96da@Ulf.tvoe.tv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=LSJLy6KrvKu3r2yhjiYo//o6ji0xGcbXT5eD7xpbNXc=;
        b=WdzpA6MqL6ZjC/j5ifZj3GoA0SWLm7YSHh/NRNQy2bQTr7BKIkuVAeStQKHsa+jbUd
         TT52nOY7eiTu0xpq6iLJEgUJKldSeRDeFSZ6/QcVys6pNIQ0cgdvd/ziAwh8vSESbVRm
         4MqoGVj2w+eVoVSo+ja1ZZFJO5hZiieI7MWKGcN1yYDIt8shjZM1f0TpaVhoNxNae2J5
         Si1zOJpNH2fdt8DAXFcs0Rvnyd4buhRxuiw1Alb+q0kQPttJWs+SjPEdKxSqNMyt9qB6
         dH9CJN153sQ9aayA7Xse2R6ysgBNuvNfbSMSGLLuJUk5N/saecg+d3a37CmZj12A75c5
         gJKg==
In-Reply-To: <20140810190210.033a96da@Ulf.tvoe.tv>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>


On 08/10/2014 05:02 PM, dimas wrote:
> thanks a lot for your explanations!
> does it all make any sense for non-ssd?


Nop, this is for SSDs only. Due to specific of SSD drives it is
important to inform them that blocks are not used any more.

Don't use the discard mount option for HDDs: it will involve
additional overheads with no effect.


> will 3.16 contain this all-in-one, without extra patches to find somewhere else?


Yes, I think we'll include this to the patch for 3.16

Edward.
