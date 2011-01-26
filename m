From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Two questions about reiser4
Date: Wed, 26 Jan 2011 18:22:37 +0100
Message-ID: <4D40585D.1020207@gmail.com>
References: <AANLkTimzRZ2q01K0HkKGxjm0FZ_Fhiw+ozK6mJH9_DEO@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <AANLkTimzRZ2q01K0HkKGxjm0FZ_Fhiw+ozK6mJH9_DEO@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Kaelyn Uhrain <Kaelyn.Alexi+reiserfs@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Kaelyn Uhrain wrote:
> Hi,
>   

Hello.

> I have two questions concerning reiser4:
>
> 1) Does it have TRIM support for SSDs,

Nup.

>  and if not what would be
> necessary to add support?
>   

Someone's time and desire. I don't have first one.
In the best case I can promise fallocate(2) support
in the next 3 months.

> 2) What is left to do for having reiser4 included in the mainline kernel?
>   

To acquire support of some vendor.

> Thank you in advance for your time, and kudos for continuing
> development on a great filesystem.
>   

Thanks,
Edward.
