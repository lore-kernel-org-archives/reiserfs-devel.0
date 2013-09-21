From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Snappy compression algorithm for Reiser4.
Date: Sun, 22 Sep 2013 01:50:29 +0200
Message-ID: <523E30C5.2090705@gmail.com>
References: <CAL2jS+=3q7Nvw89g=17Hj8uP-Cj_OtZ7R=QZRBDBz0Dknhhuug@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=lyhFAv4YmmXY/AluulR+iY1OgstHN4qXYsNAYeFCwtY=;
        b=DdlmsH4/qWNtWSsu4fz+Vx5x4yJfG3uPDjy46hCOrIMPbE35TmIHZJzGJZ76S/Dgro
         y8yio6ADHr6/pXxThzLZxKAOM2ZXtw5PiaYJMh0nFaSUfAhQ+hP5M3Sh48hUG6KIZ2BW
         3DkaeURgtFkRTK6t0cCmen1LFabkprOKJhUS18EbCI5s0dZiVc+2RfAtSPsQYXxPqNR+
         8KjICitfesz5Olz+dCwXIONG01/0GdjTLUSs+PC8vWkQ65Z8MF5BaDw08xLWf+b27Kng
         oIUyinqTiej2eXy+mye0DrtvMmdIa3JJCOxgBZ5EWcQcG1YSRXo7jUW4VgX4KPPQTW/v
         ZU+Q==
In-Reply-To: <CAL2jS+=3q7Nvw89g=17Hj8uP-Cj_OtZ7R=QZRBDBz0Dknhhuug@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Evgeniy <iron.udjin@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

21.09.2013 23:12, Evgeniy =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Hello all,
>
> Last few days I was playing a little bit around implementation Snappy
> algo in Reiser4. My code is dirty and should be optimized. But it's
> enough for testing.
> According to my tests Snappy shows near the same prefomance as LZO. I=
n
> some kind of situations Snappy shows better compression with the less
> CPU usage.
> LZO has a few advantages over Snappy:
> 1) It's in kernel by default
> 2) It's optimized better then Snappy.
> Also a very significant fact is we're plaing with small blocks of
> data. In this case results of all algorithms looks near the same.
>
> Maybe in the future I'll reqrite a little bit BratSinot's LZ4 patch
> (http://sourceforge.net/p/reiser4/discussion/general/thread/780facb4/=
)
> to make it use LZ4 library which is build-in kernel. Friendly
> speaking, I'm not expect any big difference in comparison with LZO.
> But in any case, it funny :)


Support of a new compression algorithm means a format change.
So, people with roots on reiser4 will be forced to fsck their partition=
s.
So, not so funny.  A visible advantage in some benchmarks is highly
desirable..

Thanks,
Edward.


>
> If anybody want to test Snappy compression algo - let me know, I'll
> make patches to kernel and reiser4progs.
>
> Have a nice [the time of the day],
> Thanks
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-de=
vel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
