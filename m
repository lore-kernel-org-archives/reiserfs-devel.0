From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 and mount times
Date: Wed, 12 Jan 2011 21:44:29 +0100
Message-ID: <4D2E12AD.6030508@gmail.com>
References: <4D2BE02E.6040207@gentoo.org> <4D2C3143.7050008@gmail.com> <4D2D28D1.5010306@gentoo.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4D2D28D1.5010306@gentoo.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Serkan Kaba <serkan@gentoo.org>
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Serkan Kaba wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 11-01-2011 12:30, Edward Shishkin wrote:
>   
>> mount -o dont_load_bitmap
>>
>> Thanks,
>> Edward.
>>     
> Thanks that fixed my problem. I should have searched it before. I find
> that it was discussed many times. As far as I read, lazy loading of
> bitmap blocks shouldn't have a dramatic performance effect. Is that true?
>   

Yup, that is true.
