From: Mat <jackdachef@gmail.com>
Subject: Re: [fsck.reiser4 --fix] segfaults and reports that it fixed problem
 (but it doesn't)
Date: Sun, 22 Aug 2010 18:43:40 +0200
Message-ID: <AANLkTik_dkWVEEy8yh5YU2Y6WAgP=7h82bZGOb_bRAga@mail.gmail.com>
References: <AANLkTi=wQuQ4_ReRZXvzLx2BxhQRVryqQviFkqi+V5ye@mail.gmail.com>
	<4C714A5E.50201@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=D3H1vrcGaiV+fkl+e8AhyUNZBwjlUxp63qyllDD2X5I=;
        b=ZCfuQkrY5Kk4AWF995KtFjQAXhpvluJWYM6Zh3Q82x2vDdNk4v+ReKyYhnGeoYWzGS
         RAQH1nkjlPQ+yQMvgrXOfiCz/MwNt7d6NvpKNCOk78pdACoLkngA0FXcGsN+5nrydtRI
         AWRNCjgI/uqOG3DjoWOYUrMWiug0nU675c+TU=
In-Reply-To: <4C714A5E.50201@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org, zic422@gmail.com

Hi Edward,

using Reiser4 for storing the portage-tree of Gentoo Linux would be
one of those use cases:

the raw tree has around 140,000 of a few kiB big files.

Mat

On Sun, Aug 22, 2010 at 6:03 PM, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
> zic422@gmail.com wrote:
>> Check was perfomed from Debian Squeeze.
>> Even if I explicitly write -o
>> create=3Dccreg40,compress=3Dlzo1,cluster=3D4K
>
> Why do you need so small clusters?
> Frankly, I don't know any patten, where
> things with 4K clusters go better...
>
>> ,compressMode=3Dultim the only
>> difference is that there is no segfault.
>>
>
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-de=
vel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
