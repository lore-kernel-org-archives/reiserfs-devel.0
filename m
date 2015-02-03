From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4: Precise real-time discard support for SSD devices
Date: Wed, 04 Feb 2015 00:08:37 +0100
Message-ID: <54D154F5.1010404@gmail.com>
References: <54CFFB1D.6090906@gmail.com> <54D093C1.7000103@niksula.hut.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=h1NxFSJ+kqq8d/2mWJk+RetPp9mJ5Ds7wackDEBd5u0=;
        b=ipZlVBoEIFNN/1VSaiDelsbHoHNpKjIRKCwGOBeCwf/8AAvPOkkJrs0EBvy1ZcuzdU
         ljea8Xp0a0ZnNZfNFriJPGB7Jfz1WpEtTCp7CEZj+talHa4rWNhhepRMUTTNEhILvygV
         bM/ZtDXI9Gp8betUXube5o60pWLrn0uvXrII24sC5HQjXAAw2N0fmuIahpR39rLaYDWz
         dl5HP/kEs0jkjh+3hCA6MqrjVFhrUd2qi3vu+v7SPV3Ru6z0y54nctMTsUdHHznO7Acs
         f9+Cajvkif6KBuo/1L1wBAJj9fomwQHCVAQanHvN2IAnfwce3b+WTtXkMKmA6LFx1Nu1
         9tjQ==
In-Reply-To: <54D093C1.7000103@niksula.hut.fi>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: =?UTF-8?B?4oCg?= <god12@niksula.hut.fi>, ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>


On 02/03/2015 10:24 AM, =E2=80=A0 wrote:
> That's the best write-up on the topic I've ever seen. Thanks a lot!
> Could you please put it on a wiki or some website to make sure it's n=
ot buried in the
> ML archive?


Done:
http://reiser4.wiki.kernel.org/index.php/PreciseDiscard

Thanks,
Edward.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
