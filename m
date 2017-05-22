From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: release_unix_file (fs/reiser4/plugin/file/file.c:2365) BUG: unable
 to handle kernel paging request
Date: Mon, 22 May 2017 22:31:21 +0300
Message-ID: <59233C89.1040703@gmail.com>
References: <20170519162750.10c8f6bf@Ulf.tvoe.tv>       <30e3aff9-954b-cd2a-c1a5-73a5a78d0fcb@gmail.com> <20170522223452.4b9e1889@Ulf.tvoe.tv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-transfer-encoding;
        bh=bj93/rEuSLR5Hms2WjAx9LXz+7E/N6FSkmTBfq2xo54=;
        b=i9aefsiSGHc9Fa0uHg3XbWSQ97bPftbjX1xc5sSI/TlcFVkz+UwsNlp6b2Pe60um2s
         Ffm+bPq9tg+ouTTFWy39sFcYAJ9jaXzjqCRxicRkgctUylz9vs2mFdBz2HOAr3OWJGmq
         zxmz6tQKquAhR4QOi3QGxdkU8p8lsYVNOq6r3wu+l3BvhNRV/R43BKnOP2y4sWfNmT2i
         KzdxYc9MWRfyAja33iv3lPU6ko+HVwNW0Fi7DlelfrDjgRc3xTfwgvwc2lRvkHpNq576
         LAXLHHC14BPggMMiauIcSMm4FY0XyDN/qa8AIurmif5VL8liylbxDmzVVEDo8H1AIFje
         9HoQ==
In-Reply-To: <20170522223452.4b9e1889@Ulf.tvoe.tv>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: dimas000@ya.ru, ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

On 05/22/2017 10:34 PM, dimas wrote:
> thanks, seems that fsck fixed the problem. it was even reported during mount,
> actually, suggesting to fsck --fix, so i rebooted into another system, ran fsck
> and then fsck --fix, it reported and successfully repaired an error, and at
> least 3.18 seems to work great now,

No, it is only impression of great work!
Please, check it again with fsck, and use kernel 4.10.
If you need older kernels, then try to backport the following patch:

https://github.com/edward6/reiser4/commit/9eca07b7b992724446d5e7327c86bb0bf1f20a41

If any problems with porting, then let me know.

Thanks,
Edward.
