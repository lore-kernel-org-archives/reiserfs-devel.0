From: Evgeniy <iron.udjin@gmail.com>
Subject: Snappy compression algorithm for Reiser4.
Date: Sun, 22 Sep 2013 00:12:24 +0300
Message-ID: <CAL2jS+=3q7Nvw89g=17Hj8uP-Cj_OtZ7R=QZRBDBz0Dknhhuug@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=2Zqaxow73wqanz+X2MySp1A+D3vGherU/5Evctj1oBo=;
        b=qyOq147S4APMFhyVD6sed/xo2GjbKIwVYV/Dy0mqMdtpf2L3KHDPYld9Z1xAgNouzN
         wzhSn7rGlzAgS5Tfct9ZK4RWUJ0G29BnPfoaNWx0gvofwxm+JjjfW7dmk8IM3w7T1rr6
         vkfx4C+19nSwjRneqBfb4awwGvQKOAgO8bOj38bzk0DDhEFvMEXogG06H/0KMI7qfi0y
         kwNg1Sd/1HfnmjWoUJ7R4cnU88KyfdCFwlhgueKfVMwjB6XLWvzCVvSeaq95O/u1tdtR
         ZZp3nSTklnUjYn9csciaM8gEc8++5Cb1LHoCZs6MNebrIoLOvEYaaWf6hW7Td0Hs2Xyq
         90tQ==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

Hello all,

Last few days I was playing a little bit around implementation Snappy
algo in Reiser4. My code is dirty and should be optimized. But it's
enough for testing.
According to my tests Snappy shows near the same prefomance as LZO. In
some kind of situations Snappy shows better compression with the less
CPU usage.
LZO has a few advantages over Snappy:
1) It's in kernel by default
2) It's optimized better then Snappy.
Also a very significant fact is we're plaing with small blocks of
data. In this case results of all algorithms looks near the same.

Maybe in the future I'll reqrite a little bit BratSinot's LZ4 patch
(http://sourceforge.net/p/reiser4/discussion/general/thread/780facb4/)
to make it use LZ4 library which is build-in kernel. Friendly
speaking, I'm not expect any big difference in comparison with LZO.
But in any case, it funny :)

If anybody want to test Snappy compression algo - let me know, I'll
make patches to kernel and reiser4progs.

Have a nice [the time of the day],
Thanks
