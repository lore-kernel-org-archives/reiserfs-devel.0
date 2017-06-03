From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4: BUG during a backup (sequentially reading the whole
 fs) on 4.9
Date: Sat, 03 Jun 2017 10:39:06 +0300
Message-ID: <5932679A.4020801@gmail.com>
References: <1488211296.5395.2.camel@intelfx.name>                       <f7c80f08-6e89-226b-7914-54d2385aa834@gmail.com>                        <1488212421.5395.3.camel@intelfx.name>                  <4a88640c-8d98-1cc0-5713-3abd76abf208@gmail.com>                        <1496328566.8314.2.camel@intelfx.name>                  <290631df-dc46-e8ef-041f-c353b7eecf88@gmail.com>                <1496339175.12062.1.camel@intelfx.name> <59307242.5010705@gmail.com>    <1496357947.4940.2.camel@intelfx.name> <5931CC9D.6080801@gmail.com> <1496445690.28911.1.camel@intelfx.name>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-transfer-encoding;
        bh=H3a2Dg/Y+sCuRh1zaxlF8VaR3Qi/VKejgbwZ0dUB9z0=;
        b=HT0u9nsuB1nPR3fxO5R+VSHZyLpXOMbJyqImx24Z5VgPgiFrapDEpSmgGsSgbZwH9N
         hDKK2X996B1aLtC5kpNreb01sBAtWOOjBLOFg3FuiF3I9ptTEvEQngNZalluUc20t8Po
         UwWetLzOxm3YGnmtdkQ8dUMfMbOQS2h1r4ygzm/S2ZmfjwyRSMQ7LyK1gFQG7gZnvvAe
         uG/xGKDdpX859SD5d/Eh2uq6ORWsBO5+EvR//zIuziuouFJYB2Ko3WJtSz59T5yJ2vJE
         4M5uPevPWddbypDeHy/ytjIb1AiMarfiRP6zWSRbNWUsLe+Tlkrx2rP2B5MB1Is6nulU
         YH8Q==
In-Reply-To: <1496445690.28911.1.camel@intelfx.name>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: intelfx@intelfx.name, Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

Is it reproducible with cp -a ?

On 06/03/2017 02:21 AM, Ivan Shapovalov wrote:
> Uh, I don't know exactly which partition is it. Strangely, I could not
> reproduce this with a mock-up load (find -exec cat {} \; >/dev/null),
> but odds are that it usually happens while reading a half-filled 500GB
> partition.
>
> Anyhow, I can put it on my public-facing NAS and give you either a
> download link (my uplink is 50 Mbps wide) or ssh access, if you would
> be kind enough to have a look at it :)
>
> BTW, if I enable checkpoints in borg (so it saves internal state
> periodically) and restart the backup from a checkpoint after the crash,
> it always finishes successfully. Does that confirm or refute your
> hypothesis?
>
> Thanks,

