From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Where may I find a reiser4 patch for kernel 2.6.32-5?
Date: Sat, 10 Mar 2012 00:22:31 +0100
Message-ID: <4F5A90B7.9020101@gmail.com>
References: <CANish_kZ=WNx7tqAceBESUAiyu1yJcpy9K8G4VnsKExkRpiT2A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=XgkKiqzwyT+Tgsvg6GCUrN745AmYm9x61rSF1ILwV5U=;
        b=Gi94xxT0G+XI2FX44Y3OA/tzHAL8d3H4tbIql/AW4z7tDXY1n6HA87oBBggEny0VTN
         xkXFbt0DgOgRjPNoJmGzaPeYMrbNl66K2o+wN/4bK/nq3IlfXRp4WQe4zt95hpvhtD29
         pM9AETZiUWo37XPh5YaTYz4s0vhFx2GpnHbOeipf+VnwMdRFZsY4MqldJCKDEvpm9Tkk
         rOf6oql8yrzj6ti74b4BOj1ri1751HfT9tdy0nCrVyemB8NuazmGiRQQ+pS4xXmC8BPj
         9VLR30E70GWQXn6QAb2eHgw0SOqo4MFY0N8YxbpNJLdPKg0Y+RtIrn9bJP9W0dGT+Zvb
         jfFA==
In-Reply-To: <CANish_kZ=WNx7tqAceBESUAiyu1yJcpy9K8G4VnsKExkRpiT2A@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Sandro Souza <escovadordebits@gmail.com>
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Hello.
The patches can be found here:
http://sourceforge.net/projects/reiser4/files/reiser4-for-linux-2.6/

Please, note that reiser4 is not stable, and, hence, is not suitable
for production. So please don't use large volumes, and make sure you
will be able to fsck it at any moment (especially it concerns root
partitions).

Thanks,
Edward.


On 03/10/2012 12:01 AM, Sandro Souza wrote:
> Hi everybody.
>
> Sorry for my bad english, I'm a brazilian nerd. :)
>
> I'd made a virtual machine (using virtualbox) and I'd installed a
> Debian 6.0.3 inside it.
>
> The kernel version of the Debian 6.0.3 is 2.6.32-5 (uname -a) and I'm
> searching for a reiser4 patch for this kernel.
>
> After it (recompiling the kernel sources with the reiser4 patch,
> without the "working" of Andrew Morton and Riffard Laurent),
> I'll remaster a ISO image with remastersys.
>
> I'd tried with Ubuntu 11.04, but the GParted version of Ubuntu has the
> reiser4 option disabled. :(
>
> The Debian GParted version has this option enabled, so on, I want to
> make a ISO image for a fresh installation of a Debian distro with
> support for reiser4.
>
> I'll modify the remastersys-installer script for give the option to
> use reiser4 too.
>
> Any helps are wellcome. :D
>
> Please, NEVER give up of this fantastic work. I know that reiser4 IS
> the best filesystem, and I want to use it.
>
> Thanks in advance.
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

