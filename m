From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Debian with Reiser4-patched Linux kernel on IBM Power8
Date: Sat, 07 May 2016 16:42:27 +0200
Message-ID: <572DFED3.5080006@gmail.com>
References: <CAM12Q5Tu-Zg=wgUAbYh++0dwn-h8gNUNMraxFgVWCi-HzUpyJA@mail.gmail.com> <op.yf7tcmn9hogzsi@i17b>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-transfer-encoding;
        bh=mbQyMTfLIXPHx/VxN0TqpTNCZ5rz/ehgPkM6HYudVwE=;
        b=rfmcyN+/2L1rREUIIS8/74h6m4ro8vTvD/yLE+/fY8uKsz0qh5Scmo0DoDR10mCVZW
         6l7kH3uYhNDDFwdm3PFgC+XtlzXlQ/VZ1kcxd8yU0bZDt8ZlUabFRo9zSonYIo+jBMS3
         SpnUyMTzw3p0WGfD8oFOFVlxBm4nzY/zBNj1+jpIQZVdtxeFq9pXA/VOUNe0fF4JSNGD
         mcN0n4vsdqkX9/ylc+CGPuAi9qQkioQb/ND3Y9AvwHp9DBxxOgNiY8NeISSqEBMFM7K0
         /houob2Lte0D8+hr5cGDuPuucUes6Nllo2i8PhU3KTMiNbqVq6nlFeJfKvebAQaRfHYC
         Kj+A==
In-Reply-To: <op.yf7tcmn9hogzsi@i17b>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?Sm9uw6HFoSBWaWRyYQ==?= <vidra.jonas@seznam.cz>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: Jose R R <Jose.r.r@metztli-it.com>, debian-kernel@lists.debian.org, debian-boot@lists.debian.org



On 04/20/2016 01:11 PM, Jon=C3=A1=C5=A1 Vidra wrote:
> On Wed, 20 Apr 2016 12:53:48 +0200 Jose R R <Jose.r.r@metztli-it.com>=
=20
> wrote:
>
>> is there any reason why Reiser4 SFRN 4.0.1-enabled Debian should not
>> run on Power8? I assume GPT should be selected whereas previously I
>> have tested -- on AMD64 baremetal and cloud -- only MSDOS disk
>> partitioning.
>
> There might be some problems with the endianness of the system.


Yup. Specifically, bitmap code sucks.
I don't remember details though..

Edward.


>
> I have tested Reiser4 on 32bit PowerPC several years ago and as far a=
s I
> remember, mounting and using a preformatted partition (mkfs done on a=
n=20
> x86
> machine) was possible, but a partition formatted on PowerPC was unusa=
ble.
> I can repeat the tests, if you are interested.
>

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
