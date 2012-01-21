From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: series of tests wich talked about "One Billion Files"
Date: Sat, 21 Jan 2012 18:18:56 +0100
Message-ID: <4F1AF380.2030808@gmail.com>
References: <6e80504b8549271fa4ed473f9b145f0f@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=dJJ4r8yzhpXNkSEMzs+bKUKZ/OJ6EYwdcdCh2ZclDO4=;
        b=lYoPeNWtkP0B7VAzOG3Wlr/KyYiQEkUxhPqOlqukA7Q2bGVLZ3T9q4KybG7YNkFwcY
         N8uLYv8PNeV03S2RdyPX7r7g3rpHYC6GtBk9Vb3WsaSt+uwAz3hTfv4kgwXt2DnEO3Tc
         GpqHYAZP4coNoiHpl9ubgHVqU/KI9FC0flhu0=
In-Reply-To: <6e80504b8549271fa4ed473f9b145f0f@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

On 01/21/2012 02:13 PM, doiggl@velocitynet.com.au wrote:
> Hello,
> I saw a series of tests wich talked about "One Billion Files". I wonder
> how Reiser 4 would go ?


Reiser4 should scale well: it is free of all
ReiserFS(v3) disadvantages and uses innovative
data structures and locking techniques.

Edward.


> Some Links to the article follow[1].   -Glenn
>
> [1] links
> http://www.linux-mag.com/id/7876/
> http://events.linuxfoundation.org/slides/2010/linuxcon2010_wheeler.pdf
>
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

