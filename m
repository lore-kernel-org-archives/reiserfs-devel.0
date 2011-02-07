From: =?UTF-8?Q?Marcin_Baczy=C5=84ski?= <marbacz@gmail.com>
Subject: Re: fsck.reiser4: segfault in aux_adler32 at aux.c:194
Date: Mon, 7 Feb 2011 15:55:24 +0100
Message-ID: <AANLkTinpckeMHGydA6JePBCZXw4YHKbk1Os7UChcfTLO@mail.gmail.com>
References: <AANLkTi=5pCaXg49iC+YZ0H_HHKHjxJD-uf0O9gyyYUHa@mail.gmail.com>
	<4D4FFD74.8060903@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=2BPgasHU/RllPKcLvHOZFH9JGEdLbibreli0RtQeXJE=;
        b=ud7pbMu/SSlqIWRjzsRiGOnRbpMWIJOn02N4xO/hC82dyN6DC/J0H4W+RuydRF8ryl
         ocxq11XXv++48RL3jmrcS/0ppgL2sW8B3dDAtWP4F/uEpNWVmQg4OrKYbaT41rHHKbwC
         4oLRvt2pW99qA6hCEq1eMzIhS/jZus8kuOE9c=
In-Reply-To: <4D4FFD74.8060903@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

W dniu 7 lutego 2011 15:11 u=C5=BCytkownik Edward Shishkin
<edward.shishkin@gmail.com> napisa=C5=82:
> Marcin Baczy=C5=84ski wrote:
>>
>> Hi,
>> following the instructions at reiser4.wiki.kernel.org I'm reporting =
here
>> sigsegv I get when fscking resiser4 fs.
>>
>> I'm using reiser4progs 1.0.7. Attached backtrace is from patched
>> version, with patch from [1] applied, but the same crash happens
>> with unpatched version.
>>
>
> Could you please also try this one:
> http://marc.info/?l=3Dreiserfs-devel&m=3D127504471326353&w=3D2
>
This patch makes segfault go away. Thanks.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
