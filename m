From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 and mount times
Date: Tue, 11 Jan 2011 11:30:27 +0100
Message-ID: <4D2C3143.7050008@gmail.com>
References: <4D2BE02E.6040207@gentoo.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=yns9f0ewW/De579hN3oHUU6SP0xK63bAuNA/9ULphb8=;
        b=PivtHXuJvIoYoSqOjkrgnn7UN9snYRR3chVsfLYloCQ2Z4guUnTQEtO1AF30aNWInX
         qZWZiydyRujzrmt2FzS8erZIlObrJvyk0N+G4ci8vFbiWwRqry+bzeSnmuWnUlDTQRFN
         bI0FLFBopEeBSJceTIzeerf6di6SJZf/QDqUk=
In-Reply-To: <4D2BE02E.6040207@gentoo.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Serkan Kaba <serkan@gentoo.org>
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

On 01/11/2011 05:44 AM, Serkan Kaba wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Compared to other fileystems (including reiserfs) mount times of reiser4
> is *huge* and mounting takes most of my boot time.
>
> Here's a simple time output of reiser4 and ext4 fs, nearly identical in
> size.
>
> # df- h
> /dev/sdb2             428G  339G   89G  80% /film
> /dev/sdb4             429G  262G  145G  65% /film2
>
> # time mount /film
>
> real	0m23.238s
> user	0m0.000s
> sys	0m0.096s
>
> # time mount /film2
>
> real	0m0.069s
> user	0m0.000s
> sys	0m0.012s
>
> # mount
> /dev/sdb2 on /film type reiser4 (rw,noatime)
> /dev/sdb4 on /film2 type ext4 (rw,noatime)
>
> Can I improve the situation with tweaks,


mount -o dont_load_bitmap

Thanks,
Edward.
