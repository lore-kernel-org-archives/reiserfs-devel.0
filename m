From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Where may I find a reiser4 patch for kernel 2.6.32-5?
Date: Mon, 12 Mar 2012 20:34:41 +0100
Message-ID: <4F5E4FD1.30103@gmail.com>
References: <CANish_kZ=WNx7tqAceBESUAiyu1yJcpy9K8G4VnsKExkRpiT2A@mail.gmail.com> <20120312230314.44ea493b@Ulf.tvoe.tv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20120312230314.44ea493b@Ulf.tvoe.tv>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: dimas000@ya.ru
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

On 03/12/2012 08:03 PM, dimas wrote:
> man, seems that you'll also need to patch debian-installer and create udeb package to load before disk setup (like with resier3 now). how about this?
> as for gparted - maybe you just need to have reiser4progs installed?
> 2.6.32? why don't you use something newer? 38 was very interesting release. btw, i have my server running on Debian testing @ 2.6.38.8 with / on reiser4. works 24/7 and works fine!
> what about remastersys or whatever - do you think you need to create yet anothet 10000001'st Linux distro? just install and configure what you need and pack you system into compressed image (i recommend squashfs, or there are lot alterantives like tar, etc) and use livecd with reiser4 support (partedmagic or maybe smth else) to prepare you playground.
> because normal people wouldn't want to use fs that is oficially not recommended and claimed as forever unstable

I believe there are only 3 problems which don't allow reiser4
to be used in production:

1, 2) deadlocks because ->readpages() of both file plugins (unix_file
       and cryptcompress) don't release long-term lock (current position
       in the tree) when filling next portion of pages.

3)    the nasty bug in tree balancing which leads to corruption
       (kernel and fsck report about key inconsistency).

All the problems are old enough. Unfortunately all complicated
subsystems like a local fs have unpleasant property: "sleeping"
bugs, which wasn't being reproducible because of various reasons.

Edward.


  (yes, it's working fine for me about 2 years, but ...). and those who 
is intersted in it can just move their systems themselves, as they 
should be geeky enough if they know about such things like r4. it's a 
matter of 15-20 minutes to pack /, mkreiser4, unpack / back and fix 
fstab. with proper kernel already installed, of course, but geeks often 
use self-built kernels, so it's not a problem too
>
> PS. sorry for private mail. claws-mail seems not to handle this mailing-list correctly, or some headers are not properly set.
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

