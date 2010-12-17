From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4
Date: Fri, 17 Dec 2010 21:40:44 +0100
Message-ID: <4D0BCACC.1010904@gmail.com>
References: <20101217162550.GA1864@ishi>	<4D0BA308.5050602@gmail.com>	<20101217193549.GA1646@ishi>	<4D0BC2E1.1000101@gmail.com> <AANLkTi=6Wa_N==hSP4n5iH8soSwpcAtMOSS6BVomzzWt@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=6Wa_N==hSP4n5iH8soSwpcAtMOSS6BVomzzWt@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: =?windows-1252?Q?Milan_Bu=9Aka?= <milan.buska@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Milan Bu=9Aka wrote:
> 2010/12/17 Edward Shishkin <edward.shishkin@gmail.com>:
>  =20
>>> Much of it I understand. I'm not a programmer.
>>>
>>> #if BITS_PER_LONG=3D=3D32
>>> #define MAX_LFS_FILESIZE        (((u64)PAGE_CACHE_SIZE <<
>>> (BITS_PER_LONG-1))-1) #elif BITS_PER_LONG=3D=3D64
>>> #define MAX_LFS_FILESIZE        0x7fffffffffffffffUL
>>> #endif
>>>
>>> I have to learn more
>>>
>>>      =20
>> Which box do you have?
>> For example, for i386 machines the limit is 8T
>>    =20
> 32 bit
> uname -a
> Linux ishi 2.6.36-SAUX-reiser4 #1 SMP PREEMPT Sun Nov 21 22:21:51 UTC
> 2010 i686 Intel(R) Core(TM)2 CPU 6400 @ 2.13GHz GenuineIntel GNU/Linu=
x
>
>  =20

Alas, only 8T..
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
