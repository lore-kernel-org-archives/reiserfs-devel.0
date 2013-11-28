From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4 kernel compilation problem.
Date: Thu, 28 Nov 2013 22:57:05 +0100
Message-ID: <5297BC31.7000308@gmail.com>
References: <35ffb317ffa4ed9987117759f51ebd1f@mail.velocitynet.com.au>	<20131123161309.1b321a45@Ulf.tvoe.tv>	<3ff712c55494331e10c9f7fc0b7b8d25@mail.velocitynet.com.au>	<20131125135635.36d29c28@Ulf.tvoe.tv>	<529334E8.40704@gmail.com>	<0d261550194f47e24b19754de30e8949@mail.velocitynet.com.au> <20131127010435.54d9fc6b@Ulf.tvoe.tv>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=tA/YCP4YJ++FWfH0m71+8cCWoaQmbmmRCv0GMEQltys=;
        b=ynwdjs6JEmMM07A5L7Anf/FgmQWf7PNYTisxRvoBjToL6u2sviKpeijsyKNDcRmom0
         ughiuY29RWtj3+ktsO7fLkI9ucgnERngB+vq0Vjlazw8+cP/O/AaQhIrvPJhyawJn/o7
         IesDGzRiysCR/zrTJmb/lxPboV79YJcTOpxDzMGRvcL2e6cz9UCuvCWEsxgs/tk25oB+
         rbViJse4GFH8NZjZ2uFVCBuLRm1Rym87DM6a+VHW623teQlRou2aixCjBQ0ftFruhpDD
         3vdMsywdSqrrUedCywANIGWrJ5UBouOjWnmXMymJqguAZnZ3jvGXc/H2wJrITC7eyU/2
         +zbw==
In-Reply-To: <20131127010435.54d9fc6b@Ulf.tvoe.tv>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>, dimas000@ya.ru

26.11.2013 22:04, dimas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> 3.
>> # insmod reiser4
>> insmod: can't read 'reiser4': No such file or directory
>> 4.
>> # modprobe -v reiser4
>> insmod /lib/modules/3.11.9-2.ga012288-vanilla/kernel/fs/reiser4/reis=
er4.ko
> hm, try running "depmod -v". seems like "reiser4" is not listed in mo=
dules.dep
> or whereever it should be, thus insmod cannot find it (and load on mo=
unt
> attempt). read "man depmod" if it will ask smth more - since i don't =
have any
> modules on both machines, i can't check what options are necessary.
>
> as for those dmesg warnings - we can just see what will Edward say on=
 this))


Alas, I don't have enough disk space to extract metadata of 2T reiser4
partition, so owners of broken large ones are waiting for the best time=
s...


> meanwhile i offer you the simplest way to check whether they are driv=
er/kernel
> related, or your fs has error that fsck can't detect or fix - just cr=
eate shiny
> new reiser4 fs on some free partiton or even on loop-mounted temporar=
y file and
> try wirh it.

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
