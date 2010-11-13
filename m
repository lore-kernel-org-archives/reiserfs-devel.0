From: Magicloud Magiclouds <magicloud.magiclouds@gmail.com>
Subject: Re: Little report on reiser4 with 2.6.35.7
Date: Sat, 13 Nov 2010 20:22:09 +0800
Message-ID: <AANLkTimnRDC9bARHODueiKMG2f5c8RQ+6zYTnr_AvAxZ@mail.gmail.com>
References: <AANLkTincE-JHOYPoZkrBrbqs7eo__s8Vjn3bbEKVzGEB@mail.gmail.com>
	<4CDE8129.6050708@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=q0cYvUGMPzlPzWJYwe61akfrMbShlbe+yMuiivbvAKc=;
        b=BP3mUfKrdIwzIhRVmYZgiYfPRiqjOWrxiJuOTakYFaOxReuDwVK7O1wO8jIp4tH3hd
         sV7BfC7FO2B/IB1Xsh9Dx3gPmq6/HAUeVlWDH4W9h7afyV2EYIY3RN+QMtUOhNXLrJkY
         yYkJEydhZ+tX+hNddoeHv/6kEeTGaV23AhDTw=
In-Reply-To: <4CDE8129.6050708@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On Sat, Nov 13, 2010 at 8:14 PM, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
> Magicloud Magiclouds wrote:
>> Hi,
>> =C2=A0 I compiled 2.6.35.7 kernel with reiser4 patch on debian sid. =
And I
>> found a serious problem. When the reiser4 fs was full, it broke down=
,
>> which lead the module to "bus error". Then I fscked it, I had to "fi=
x"
>> and "build file system". At last, I lost some files (not sure of the
>> contents of the left files), which are not created right before it
>> broke down.
>>
>
> Yes, I have reproduced some problems, when running out of disk space.
> It seems ENOSPC is handled incorrectly, and there is a problem in rea=
ding
> (partially converted) files. I'll take a look..
>
> Thanks,
> Edward.
>

Glad to hear that. Hoping it will be resolved soon.

PS: May I know when would the patch for 2.6.36 be released?

--=20
=E7=AB=B9=E5=AF=86=E5=B2=82=E5=A6=A8=E6=B5=81=E6=B0=B4=E8=BF=87
=E5=B1=B1=E9=AB=98=E5=93=AA=E9=98=BB=E9=87=8E=E4=BA=91=E9=A3=9E
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
