From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 GIT and Kernel 3.11 patchs
Date: Wed, 18 Sep 2013 01:13:56 +0200
Message-ID: <5238E234.9000906@gmail.com>
References: <20130917181531.Horde.9SQoJsAfOsciOtEfGaP2jA1@mail.thieu.so> <5238B2FF.5060900@gmail.com> <CAL2jS+mhmvmse7UqK4Xa0pYLSBJ9mfBDohKYFKdjzpAbL-=prA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=J41WwpmJ6vOkAVQw+hQeV6xrz2TcDfqO1MedajHetxw=;
        b=L25yU60GT9iCVV4fVJZDBcYyH1lhZ9mWykDrWetsqZnfcrk5iCRfVD4df/zZ+buj1T
         UoY8BYv1zIFvnWLIZm3ndwp8gRZ4bDVUEnqQdOsV70kaKwR9rSnpOtJgvIlA//kZTxqY
         YX9Ug8RpQkqhkGgfIQE734swexpJdga5m0q/g4rCxY8hiF+olq/5dM6upffo009EZyeU
         kG5xcatQNfWcu0b3oXVUJO14P8T3EIb1JLdRGtQCcFC7eRovF9hUo8aOrQp2Z5ush8us
         F3toms81K4ogDvC5hONmo5Q32YTRCj5kyh0N/KjE1TASBzoNpIrVMIP7C9eGZwQo/3Mu
         BeIg==
In-Reply-To: <CAL2jS+mhmvmse7UqK4Xa0pYLSBJ9mfBDohKYFKdjzpAbL-=prA@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Evgeniy <iron.udjin@gmail.com>
Cc: Mathieu Belanger <m@thieu.so>, reiserfs-devel@vger.kernel.org

17.09.2013 22:21, Evgeniy =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Hello all,
>
> I'm a active user of reiser4 filesystem. Currently I use it with LZO=20
> compression for Magento cache store. Let me join in your small team o=
f=20
> testers of this beautiful fs :)


Hello.
Welcome to the club!


>
> Regarding collaboration tool, I think the best idea to use GitHub.=20
> It's the most user friendly IMHO.
>
> Also I'd like to ask about reiser4 over soft raid0. If I have raid0=20
> chunk size 4K, what is optimal cluster size of reiser4 fs?


TBH, I don't know any applications, which run better with smaller clust=
ers.
And, it seems, raid0 is also not the case. So, don't bother with this,=20
use the
largest (default) ones.


>
> P.S: It would be perfect to implement Snappy compression algo=20
> https://code.google.com/p/snappy/. According to tests it has advantag=
e=20
> over LZO algo.


We already have lz4 support, which doesn't show any advantages against
lzo (in spite of 50% speedup on decompression, announced by Google).
IMHO, It was a lost time...

Thanks,
Edward.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
