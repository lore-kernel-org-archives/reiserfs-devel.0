From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Question about the Reiser4 patch for kernel 2.6.38
Date: Sun, 25 Mar 2012 13:05:42 +0200
Message-ID: <4F6EFC06.9020704@gmail.com>
References: <CANish_m0MWeeQxywQzeAqCEMSoCbuu7-0ixOLC6Qk0Api+x9=g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=PlmmafOQZ2Ajr/DmGjoHjujIlW7RT9W/LWsF9vGVlSw=;
        b=HLWbf9eRrTI08RHEQqNK9hkovLirvYzBighcNKT6b9ndKEXvL5RkYQXpNkQyzWxh0+
         w//e0ylePIy+BcC9LvB2h6WX7SbJ8TQL2zBWg4bRrxYOffFlvS/k1MnUblq8xm9tmJTG
         dHay+aqzdWh7Vu9c05WnnXQ1aNWsCNyieG6sHPsgdc3gtLLcy6Izq7W4lECswzonFlEF
         7uHhbNw/eS8mM33jbpCLwzkTNgUKSQKH68aDWoLlmjNnNkRDa0+i0oS3ehDRJlPRLooE
         va/BOR545lwcTyTTyOnY9MVG1Rrz4rbnPScgDK6sz5iqTnt1vihry506FwiNVgJW0yla
         6glQ==
In-Reply-To: <CANish_m0MWeeQxywQzeAqCEMSoCbuu7-0ixOLC6Qk0Api+x9=g@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Sandro Souza <escovadordebits@gmail.com>
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

On 03/25/2012 12:10 AM, Sandro Souza wrote:
> Hello my friends. : D
>

Hi Sandro,

> Firstly, sorry for my bad English (I'm just a brazilian newbie).
>
> Recently, I downloaded the 2.6.38 kernel sources, and I applied the
> Reiser4 patch for this kernel version (for Ubuntu 11.04 - Natty).
>
> But I saw that the file "page_cache.c" has the same change (Riffard's
> patch) showed in page http://linuxhelp.150m.com/jews/saboteurs.htm
>
> This left me worried. :(


This looks like very old complaints.
Reiser4 has been adjusted to some VFS changes, which
were really needed. It could happen that those changes
caused some local problems, but all they have been fixed
long time ago.

I confirm that everything is OK in page_cache.c.

BTW, as far as I remember, all patches of Laurent Riffard
were extremely useful.

Thanks,
Edward.


>
> May you (Reiser4 developers) tell me if I can compile and use the
> kernel this way?
>
> May you tell me if that page is showing "unwanted" changes in the
> Reiser4 source code?
>
> Thanks in advance.
