From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Status of Reiser4?
Date: Thu, 30 Aug 2012 22:31:32 +0200
Message-ID: <503FCDA4.9060203@gmail.com>
References: <F9C551623D2CBB4C9488801D14F864C620EB58@ex-mb1.corp.adtran.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=NYMMTHUugYEkVQZmYVO8uPAY3CTB/9mMiXmbNzWdMzs=;
        b=gncS12sd9PZKHF4eVMoWWm+p25xnhZq/91sY5GklaWrDkyI7OrH1MXi1I+KnNohbhI
         0c+A9n6fW7VYqcMRPXLdXtlecAglEqfVjtdT0yDqWzMXKwVMA8WjC/z4g3dOauvx57rj
         6IZKuMdzjFuu/viccicDcpe+SH4iU4HbdCDTWJsTUbZTRNgeDlZuIxa2hamyM05V5Ao+
         wmdi8S2W3pxLV1urAFOjzrsiaM2sySG/4vWsX418W5jp1cDL4IynHvZD/gK7OH5CYXiV
         nab+uZgvE1kM2gYvPKelYoaBlBuMIUhtakEHwt6+R4j/n+SozY4WOIxN0FKgcGqjDpV5
         vWPw==
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C620EB58@ex-mb1.corp.adtran.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Cc: "'reiserfs-devel@vger.kernel.org'" <reiserfs-devel@vger.kernel.org>

Hello.

On 08/30/2012 09:42 PM, ANDY KENNEDY wrote:
> All,
>
> Google didn't help me much in my search for information, though I admit
> to not being the greatest at searching the net.  I'm a long-term user of
> ReiserFS but after moving to a multi-core processor, I'm experience less
> than desirable performance.  BTW, quick shout-out:  Been using ReiserFS
> 3.4 for ~12 years and I have only ever had ONE problem with it (and it
> wasn't the FS's fault -- a disk pack failed repeatedly during a reboot
> caused by a RAID drive failure -- I was able to recover 100% of the
> data, though it took a LONG TIME ;) ).
>
> In my search on the web, I have seen that there is still life in Reiser4
> but being adopted into the main-line kernel has stalled/met opposition.
> Is Reiser4 ready for a production machine?


Make sure that you have the latest stuff (reiser4-for-2.6.39) and
tail packing is turned off (format your partition with the option
-o "formatting=extents"). In this configuration it should work.
Once everything gets stable, we'll turn it on via mount option. If
something goes wrong, then let us know..

Reiser4 doesn't have scalability problems inherent to ReiserFS (v3)
because of using progressive algorithms.

Thanks,
Edward.
