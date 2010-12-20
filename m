From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 for Linux-2.6.36
Date: Mon, 20 Dec 2010 19:07:51 +0100
Message-ID: <4D0F9B77.704@gmail.com>
References: <4CE87674.4090909@gmail.com> <4D0DD3BA.9030909@gentoo.org> <4D0E2D61.8030808@gmail.com> <4D0E2FBA.3010409@gentoo.org> <4D0F96BA.8080003@gentoo.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4D0F96BA.8080003@gentoo.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Serkan Kaba <serkan@gentoo.org>
Cc: reiserfs-devel@vger.kernel.org

Serkan Kaba wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
>
>
> On 19-12-2010 18:15, Serkan Kaba wrote:
>   
>> On 19-12-2010 18:05, Edward Shishkin wrote:
>>     
>>> Are there any kernel complaints?
>>>       
>> dmesg has no clue :(
>>     
>>> Did you enable compression?
>>>       
>> No.
>>
>>     
>>> Thanks,
>>> Edward.
>>>       
>> Thanks in advance.
>>     
> - --
> Any other way to provide more debug data?
>   

Nop, thanks.

I guess we need to walk along splice(2) path
in reiser4 to figure out why a file gets empty.

I'll take a look a bit later..
