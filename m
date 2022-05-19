From: =?UTF-8?Q?Micha=c5=82_Dec?= <moog621@gmail.com>
Subject: Re: Alternatives after removal of ReiserFS
Date: Thu, 19 May 2022 17:43:39 +0200
Message-ID: <f6bb01be-d55d-a2b1-2d21-9abb48f3c445@gmail.com>
References: <54db8933-f2f3-d31a-c71f-860285e25abf@gmail.com>
 <2631780.mvXUDI8C0e@natalenko.name>
 <20220519101652.iu5jbol2cjwr4y5c@quack3.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=m5kPAYHdYcAvP0y9XTgXwmB1ZQjwIlMax/gKQxOCPRk=;
        b=apT9tlxkaVfwr0nABaNIlf22EWq8+BlMG0XXnj6qRjSNqV1RxMYsV2cKb9qJxWV09r
         rimoXcrswkwegkBW96uy9gdqvVq5PPWifgSPvatfAukoulgHYI0XDQGimO2qjAYMhHkp
         jg8uvcr6GfYh0n8gTDq+GgnwNEvShlHYoXuvMEwj2cMnzSZOpjH6FufVMfNNKA72/P7h
         Ao8oJKQcvfFCoqMSJe2yrw68j3iANY3qdYY2bghLZzdsOfJP2mvNV9EytanGnWaa2HXV
         cqSFtXZujLThv3k081hxKCrsq04ULtXY9VsQOas/+LCWMVrk9JMFswryhiJqSGQd5fwq
         4YTg==
Content-Language: en-US
In-Reply-To: <20220519101652.iu5jbol2cjwr4y5c@quack3.lan>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Jan Kara <jack@suse.cz>, Oleksandr Natalenko <oleksandr@natalenko.name>
Cc: linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org

Hello Jan and Oleksandr,

I would prefer to avoid btrfs if possible. It ate my Gentoo root 
filesystem in 2017. This incident has been resolved by reinstalling the 
system because each attempt to fsck only made it even worse. I 
appreciate it for excellent transparent compression and for generally 
good support for Docker, but I can live without it.

 >But given how cheap the storage is these days, people don't care as much.

I don't like this kind of attitude because it encourages a decline in 
quality in general. We'll learn to appreciate what we have once it 
becomes scarce again.

Thank you Jan and Oleksandr very much for your knowledge on xfs and 
ext4. I'll make sure to put it to good use.

Bestest regards,

Michał Dec

W dniu 19.05.2022 o 12:16, Jan Kara pisze:
> On Thu 19-05-22 11:20:24, Oleksandr Natalenko wrote:
>> Hello.
>>
>> On středa 18. května 2022 14:10:25 CEST Michał Dec wrote:
>>> Does the Linux kernel actually offer any alternatives to users whose use
>>> cases are satisfied by ReiserFS? These users will probably be stuck with
>>> a much older kernel once ReiserFS is completely removed. I'm one of
>>> those users and I use ReiserFS to keep around large quantities of small
>>> files and quite ironically these are copies of the Linux kernel. I keep
>>> around 2, maybe 3 separate kernel trees to make sure the kernels I have
>>> on my devices can be rebuilt at any time.
>> I think the advantage of using reiserfs for small files faded away over
>> time and became an old tale that is being passed from one generation to
>> another without any modern adequate testing.
>>
>> XFS should serve you well.
> Yes, so the space savings of tail packing e.g. for the kernel tree are
> likely still noticeable (my tree here has around half of the files with
> size below 4k). But given how cheap the storage is these days, people don't
> care as much. If space efficiency is important, it could be improved by using
> 1k blocksize for xfs or ext4. Also btrfs does packing of small files so
> for lots of small files it may be more space-efficient. And btrfs also
> supports transparent compression so that can reduce space usage for larger
> files even further.
>
> 								Honza
