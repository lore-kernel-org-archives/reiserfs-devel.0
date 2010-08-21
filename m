From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [fsck.reiser4 --fix] segfaults and reports that it fixed problem
 (but it doesn't)
Date: Sat, 21 Aug 2010 13:19:06 +0200
Message-ID: <4C6FB62A.6040708@gmail.com>
References: <AANLkTi=wQuQ4_ReRZXvzLx2BxhQRVryqQviFkqi+V5ye@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=HLidbEntcpWgaxDwO6EKr+KSgEWQhQzlFHLFCMv098c=;
        b=fEkDJ3y9rjFLXj4HfQU4pEu11BjeZUcXsyQoT75jDSMtaCDS0aLqo6nxPhC61ckN5F
         5SdXIXgI06XWCkhFZmX4HS9OBSgoD235dwREOwsUZJPENlJfrSoT8MkBJ5ajXn8dh0iR
         dcsq7oPWe1pCLjzcyc7NwR3S/bHNsxviqqT1s=
In-Reply-To: <AANLkTi=wQuQ4_ReRZXvzLx2BxhQRVryqQviFkqi+V5ye@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: zic422@gmail.com
Cc: reiserfs-devel@vger.kernel.org

zic422@gmail.com wrote:
> Check was perfomed from Debian Squeeze.
> Even if I explicitly write -o
> create=ccreg40,compress=lzo1,cluster=4K,compressMode=ultim the only
> difference is that there is no segfault.
>   

Please, make sure you have the following patch applied:
http://marc.info/?l=reiserfs-devel&m=127504471326353&w=2

Thanks,
Edward.

