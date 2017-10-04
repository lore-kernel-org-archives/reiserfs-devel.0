From: dimas <dimas000@ya.ru>
Subject: Re: Real status of ReiserFS4?
Date: Wed, 4 Oct 2017 19:59:34 +0300
Message-ID: <20171004195934.1f356585@Ulf.tvoe.tv>
References: <F9C551623D2CBB4C9488801D14F864C60154C6BE9F@ex-mb1.corp.adtran.com>
        <2027a1de-0aac-97f2-40f0-401e585e38ae@gmail.com>
        <F9C551623D2CBB4C9488801D14F864C60154C6C4FE@ex-mb1.corp.adtran.com>
Reply-To: reiserfs-devel <reiserfs-devel@vger.kernel.org>, dimas000@ya.ru
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ya.ru; s=mail; t=1507136381;
        bh=77NuMzZeSM79Bu5E3DpGODCqTJIV/Zb/GwFyRgb4Jfk=;
        h=Date:From:To:Subject:Message-ID:In-Reply-To:References:Reply-To;
        b=C6FMYzRD6ALSWU8DK2pubX5lmlcz8Z7vLlcXlUZiyfo2uM2c2G5SOzW0PsCOwI1ip
         JGpT0awD40gtaFBP2a8qDp8NwrJr/O90yaGzEXrPC1MghgcgeCt6/we273qseY8Nf3
         i9cgNzJa+xvx5mt3Eq592SJc6ugfoP+CPNMBlFNY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ya.ru; s=mail; t=1507136380;
        bh=77NuMzZeSM79Bu5E3DpGODCqTJIV/Zb/GwFyRgb4Jfk=;
        h=Date:From:To:Subject:Message-ID:In-Reply-To:References:Reply-To;
        b=HeoLNE1GpAefa/h/Mh4djowrw5QxeJ9GNztxBGO6KIVwZHF6IExhvldOQ0PcPfFN+
         gwU//jhQd5aVUeoKWc2xXm68X4QW3OMXiRhZ3qTSzS16a9zkkmX+7W6s2vTVS2gT5Z
         0TgIt9ttnK/YbpldvtEctMFxtapXyQ4zlpWDXooI=
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C60154C6C4FE@ex-mb1.corp.adtran.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

2017-277 15:46 ANDY KENNEDY <ANDY.KENNEDY@adtran.com> wrote:
> Eventually, after about the 5 power loss on the system, it corrupted
> that partition.  Reiserfs-progs was able to recover it, though.  So,
> is this one of those cases where if I put it on a production system it
> will work great as long as I don't improperly drop power on it?

as far as i tried, reiserfs tends to corrupt fairly frequently after power
failures. did not encounter any corruption that fsck could not fix. though. but
reiserfs' fsck seemed to work relatively slow each time.
in contrast, i don't remember any single corruption caused by a power loss on
R4. i run my "home server" with R4 on / for several years without having UPS
(shame on me, but it costs smth, and i'm just too lazy for buying one,
honestly), so, while our electricity is not rock stable, no problems so far.
