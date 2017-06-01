From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4: BUG during a backup (sequentially reading the whole
 fs) on 4.9
Date: Thu, 01 Jun 2017 23:00:02 +0300
Message-ID: <59307242.5010705@gmail.com>
References: <1488211296.5395.2.camel@intelfx.name>       <f7c80f08-6e89-226b-7914-54d2385aa834@gmail.com>        <1488212421.5395.3.camel@intelfx.name>  <4a88640c-8d98-1cc0-5713-3abd76abf208@gmail.com>        <1496328566.8314.2.camel@intelfx.name>  <290631df-dc46-e8ef-041f-c353b7eecf88@gmail.com> <1496339175.12062.1.camel@intelfx.name>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-transfer-encoding;
        bh=weNmX40avemCfGxOY3M2PUwlZah3E4gr0/PBGu3b41U=;
        b=ehfI0Qs/XepvH0eap5ukbVYqy6f/PkuiA72x4mDVMldiZQR/OidfSqWNutvAGwWu64
         17djwJc4squ1kB65xdYsvLsROJnvK6m1oP9qHN8mk6csKR3DpWROuSPOZwb5MsYpJcOy
         0/s/FE8TWm99W0TaXsIdcHpaPIXnYj8+SQMpSPcYOr+J0B7GPQD4ZTc0UjoyJww9RZMk
         MPizfQUVHPRCVvp/o9Y+nayFrKGi6wAv0rbRf3xmx2Q8UiRuG2qKBW8QSy67ea6MzPJ2
         /DNxbqP+ISdA1RQAShzNxu1hSVLxsXo+5Cg/dN7VQAKc+Jo6HB1BtEUQeEV/AVbNL8Bg
         ET9A==
In-Reply-To: <1496339175.12062.1.camel@intelfx.name>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: intelfx@intelfx.name, Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

I'll try to reproduce it on my side tomorrow, or on weekends.
If no success, then we'll think what to do. Specifically, I'd like
to look at the tree in the locality of the current search position,
where the oops happens.

Thanks,
Edward.

On 06/01/2017 08:46 PM, Ivan Shapovalov wrote:
> Yes, it is reproducible each time when I backup to an empty repo
> without checkpoints (so that borg has to fully read all files). The
> filesystem is consistent by fsck.
>

