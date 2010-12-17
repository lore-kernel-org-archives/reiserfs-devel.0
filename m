From: =?ISO-8859-2?Q?Milan_Bu=B9ka?= <milan.buska@gmail.com>
Subject: Re: Reiser4
Date: Fri, 17 Dec 2010 21:17:59 +0100
Message-ID: <AANLkTi=6Wa_N==hSP4n5iH8soSwpcAtMOSS6BVomzzWt@mail.gmail.com>
References: <20101217162550.GA1864@ishi>
	<4D0BA308.5050602@gmail.com>
	<20101217193549.GA1646@ishi>
	<4D0BC2E1.1000101@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=ZigtHQHlu+igYLf0ghDSAG8RsyEdfGXOmKZUvfCRSSw=;
        b=HTKrCruZ0zENzowogUm8OTy5P50cZYj0jzU3f6kKyvWRlQT24VUwavePUyYO/Hpjb9
         9qSC0Mq7uV9CcqIwoblqhG3gN8A57VVNwle9iUvHnEyoZVpAe1QcVwbPS9an9GqsfWMk
         Z9eQ+h4ZuPwpjtP1zstEWdJITPZ09jEllltVg=
In-Reply-To: <4D0BC2E1.1000101@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

2010/12/17 Edward Shishkin <edward.shishkin@gmail.com>:
>> Much of it I understand. I'm not a programmer.
>>
>> #if BITS_PER_LONG=3D=3D32
>> #define MAX_LFS_FILESIZE =A0 =A0 =A0 =A0(((u64)PAGE_CACHE_SIZE <<
>> (BITS_PER_LONG-1))-1) #elif BITS_PER_LONG=3D=3D64
>> #define MAX_LFS_FILESIZE =A0 =A0 =A0 =A00x7fffffffffffffffUL
>> #endif
>>
>> I have to learn more
>>
>
> Which box do you have?
> For example, for i386 machines the limit is 8T
32 bit
uname -a
Linux ishi 2.6.36-SAUX-reiser4 #1 SMP PREEMPT Sun Nov 21 22:21:51 UTC
2010 i686 Intel(R) Core(TM)2 CPU 6400 @ 2.13GHz GenuineIntel GNU/Linux
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
