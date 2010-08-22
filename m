From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [fsck.reiser4 --fix] segfaults and reports that it fixed problem
 (but it doesn't)
Date: Sun, 22 Aug 2010 18:03:42 +0200
Message-ID: <4C714A5E.50201@gmail.com>
References: <AANLkTi=wQuQ4_ReRZXvzLx2BxhQRVryqQviFkqi+V5ye@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=DbsUkPNSbcrgSSYjMW4i5RYRKgsKLdCd6acw0mRc008=;
        b=gKFdrVrC7ENgIvumMqxovvRzUCxPNgHcwR2VCvaRgv5Ek5ggBnF9Ki2M5gDvhad5pF
         VEoLkKE44FCq+qL9yO6A1Tme/d6yJDe5tQbwqakvzMffVe+RoAgCUP+vszOVxItISqfi
         /65EdvjcsEW868/Fn4FldC21+6hrJ99//W/Z8=
In-Reply-To: <AANLkTi=wQuQ4_ReRZXvzLx2BxhQRVryqQviFkqi+V5ye@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: zic422@gmail.com
Cc: reiserfs-devel@vger.kernel.org

zic422@gmail.com wrote:
> Check was perfomed from Debian Squeeze.
> Even if I explicitly write -o
> create=ccreg40,compress=lzo1,cluster=4K

Why do you need so small clusters?
Frankly, I don't know any patten, where
things with 4K clusters go better...

> ,compressMode=ultim the only
> difference is that there is no segfault.
>   

