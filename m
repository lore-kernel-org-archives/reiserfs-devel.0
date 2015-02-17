From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH 2/2] reiser4progs: node41 layout support
Date: Tue, 17 Feb 2015 18:03:08 +0100
Message-ID: <54E3744C.9010505@gmail.com>
References: <54DA46CE.5070203@gmail.com>	<20150210215549.6e92f86e@Ulf.tvoe.tv>	<54DA69FA.7020005@gmail.com> <CAM12Q5QqeZsjveUHX92OTSjYpWBZ6pm3fspN0-vpWsyWd9k-hQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=C6OPEQVQ4a937rKM/aFgRkGDz9mt1Bumle9zmvC4YXs=;
        b=gU91PHl6Z5nbTFDeGBu9NxLxV1hv4SNlyKtATJtxbNLHAqvMZ8EryGrudPyjgM2NMp
         eKNVudnUhykyhTm7qmUbGXpkDo5NZBK5LUoq/cp1FQgyanHOYNEDAUuKcQOGYGyYKry5
         +Q/lFVJeCOqYwUbs/Q8uppWldX8VvJR3BNjoX+FK9HygQXRI/eEyQPCLwLrUrlBTwN0N
         +K9+1h+pXv2JUV+ar+qCC3rD0oTo6yZrv3PMqVoIZ5S+f5fOU8lXUzDlNeeUS/AqV6Jg
         uNb+dy3FozY2t7AZ1WBNUtgkylmoJ9w+y0+lj8tZaIiBx4+dqoJiVKSwJ8Ids74smYFB
         F3fg==
In-Reply-To: <CAM12Q5QqeZsjveUHX92OTSjYpWBZ6pm3fspN0-vpWsyWd9k-hQ@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jose R R <Jose.r.r@metztli-it.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>


On 02/17/2015 03:26 PM, Jose R R wrote:
> Niltze, all!
>
> Running Debian Jessie/Sid on root Reiser4 for Linux kernel 3.18.6.
>
>
> On Tue, Feb 10, 2015 at 12:28 PM, Edward Shishkin
> <edward.shishkin@gmail.com> wrote:
>> Hello,
>>
>> This stuff is incomplete. This is only intermediate results for testing.
>> For the full picture reiser4 kernel module should update/check the
>> checksums, and fsck should check the checksums and repair the
>> tree, if something is wrong.
>>
>> The program-maximum, however, is failover (mirroring / scrubbing)
>> based on the checksums.
>>
>> Thanks,
>> Edward.
>>
>>
>>
>> On 02/10/2015 07:55 PM, dimas wrote:
>>> hello!
>>> can this r4progs patch be claimed ready-to-go? i.e. should i ask distro
>>> maintainer to update r4prgos package, or should we wait for a new upstream
>>> version (1.10)?
>>> --
> After applying patch to reiser4progs1.0.9, during build:


try autoreconf before ./configure


> ./configure (finishes appropriately)
> make
>
> (error)
> [...]
> /bin/bash ../../libtool  --tag=CC   --mode=link gcc -D_REENTRANT
> -D_FILE_OFFSET_BITS=64 -DENABLE_SYMLINKS -DENABLE_SPECIAL
> -DENABLE_R5_HASH -DENABLE_FNV1_HASH -DENABLE_RUPASOV_HASH
> -DENABLE_TEA_HASH -DENABLE_DEG_HASH -DENABLE_LARGE_KEYS
> -DENABLE_SHORT_KEYS -DENABLE_DOT_O_FIBRE -DENABLE_EXT_1_FIBRE
> -DENABLE_EXT_3_FIBRE -DENABLE_LEXIC_FIBRE -O3 -W -Wall -Wuninitialized
> -Wno-unused-parameter -Wredundant-decls   -o mkfs.reiser4
> mkfs_reiser4-mkfs.o ../../libreiser4/libreiser4.la
> ../../libmisc/libmisc.la -lreadline  -lncurses
> libtool: link: gcc -D_REENTRANT -D_FILE_OFFSET_BITS=64
> -DENABLE_SYMLINKS -DENABLE_SPECIAL -DENABLE_R5_HASH -DENABLE_FNV1_HASH
> -DENABLE_RUPASOV_HASH -DENABLE_TEA_HASH -DENABLE_DEG_HASH
> -DENABLE_LARGE_KEYS -DENABLE_SHORT_KEYS -DENABLE_DOT_O_FIBRE
> -DENABLE_EXT_1_FIBRE -DENABLE_EXT_3_FIBRE -DENABLE_LEXIC_FIBRE -O3 -W
> -Wall -Wuninitialized -Wno-unused-parameter -Wredundant-decls -o
> .libs/mkfs.reiser4 mkfs_reiser4-mkfs.o
> ../../libreiser4/.libs/libreiser4.so ../../libmisc/.libs/libmisc.a
> -laal -luuid -lreadline -lncurses
> ../../libreiser4/.libs/libreiser4.so: undefined reference to `node41_plug'
> collect2: error: ld returned 1 exit status
> make[3]: *** [mkfs.reiser4] Error 1
> Makefile:387: recipe for target 'mkfs.reiser4' failed
> make[3]: Leaving directory
> '/usr/src/build/reiser4/reiser4progs-1.0.9/progs/mkfs'
> make[2]: *** [all-recursive] Error 1
> Makefile:345: recipe for target 'all-recursive' failed
> make[2]: Leaving directory '/usr/src/build/reiser4/reiser4progs-1.0.9/progs'
> make[1]: *** [all-recursive] Error 1
> Makefile:453: recipe for target 'all-recursive' failed
> make[1]: Leaving directory '/usr/src/build/reiser4/reiser4progs-1.0.9'
> make: *** [all] Error 2
> Makefile:361: recipe for target 'all' failed
>
>
> Best Professional Regards.
>

