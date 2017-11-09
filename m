From: Jose R R <jose.r.r@metztli.com>
Subject: Re: [PATCH] reiser4: fixed bug in reiser4_kill_root()
Date: Wed, 8 Nov 2017 19:31:25 -0800
Message-ID: <CAM12Q5RvGnb6_NdddYzykpG6j=uL0qPyJXoTkDTwk9oT6Boneg@mail.gmail.com>
References: <f5afe7c5-fd0f-d9d1-5f44-7041858f495f@gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=VQM8Z9M/9c2Np7RbMq0RSsee5Nfp2nlRj9Q4lcSzOiY=;
        b=kQ3EYwC8/rvd5BnVI9wQczyvlc/uSK6dehjjMhV3u4XDQCaJb7ysdyK223LoIT6D7V
         VR1cHELOidOojmDPFuA4tipDHSP/F/JDyIBYYtJWhDjLSDkj429/439+FS+1NyuaxgYZ
         BFTkmO0ESuhDzzwo16Wpq6I6dadKILXgpj0EHGUPqnvCqloiZuznXLMc4FqxnwVecLQz
         h8gwCyzV+PiCLoW+uj/RVR+NzMrTkTSvPDTKaVSHC3Y7izW6Wq9wzFNfvPuSvoIkqrtm
         tQ1072lzO6Wf6djqwUCaYfJoBqhQQ56ic0kHFz69utVkbvHisU3JsSM2dRtCmWrsEpbK
         k0PQ==
In-Reply-To: <f5afe7c5-fd0f-d9d1-5f44-7041858f495f@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

On Wed, Nov 8, 2017 at 12:50 PM, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
> Hi all,
>
> Probably, this is the most essential "old sleeping" bug
> found for the latest 3 years. It could lead to data corruption
> (not proven). Details are in the changeset.
> It will go to reiser4-for-4.13.1 and higher. For other
> stuff please, apply (backport, etc) by yourself.
>

Much appreciated, Edward.

I will apply patch during my build of Linux 4.13.12 for Debian --
later in the evening/night -- to give it a spin.

uname -a
Linux huitzilopochtli 4.13.0-1+reiser4.0.1-amd64 #1 SMP Debian
4.13.11-1+reiser4.0.1 (2017-11-03) x86_64 GNU/Linux


Best Professional Regards.

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Download Metztli Reiser4: Debian Stretch with Linux 4.12
---------------------------------------------------------------------------------------------
for AMD64 https://sf.net/projects/metztli-reiser4/
