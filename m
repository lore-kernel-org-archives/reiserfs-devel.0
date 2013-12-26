From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Merry Christmas and happy reiser4-for-3.13-rc5 testing!
Date: Thu, 26 Dec 2013 18:46:48 +0100
Message-ID: <52BC6B88.2040603@gmail.com>
References: <20131225053808.Horde.JC_4ggCEiNr0rzYa86ePaw8@mail.thieu.so>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=ukgzPHFQGbTU48oysoOP57L4fs6NsKvZ0VuW3KGu4Mg=;
        b=d7h02+MZG2VyTH9wBZvOHiDHcTyB8XSl7G7SCXlA9LOCHXcvMYoGkIj6BwUB5mU5Qv
         JeeHv1LYo63BPIe2vn+gaHzSGqkOMrpxcUQsleTamUy9kRkn4Raw/Ysby/Q+5m/Zrlol
         hj5CM7V/LayF74SmxXjrNDPpWs/nYhLuk/i/5ewEchmynqvJD3ZpwvCY6dSv4iWXeBY6
         +vEcUE/9tCRQHI4G4MhQzFsOkUR1V6J8oBVHiVG45mYS/7FzVWYxag91PDARJrNtkBKI
         1IOzc5i7GIJLWLN6fm1BSY48HC7GpmzMA5Tuf8fax/c4d6CsFn2F6aJJUW1tGeGhFd3B
         OnpA==
In-Reply-To: <20131225053808.Horde.JC_4ggCEiNr0rzYa86ePaw8@mail.thieu.so>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Mathieu Belanger <m@thieu.so>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

Good news!

Thank you,
Edward.

25.12.2013 06:38, Mathieu Belanger =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>
> Hi!
>
> I just updated the reiser4 patch for the kernel 3.13-rc5 available on=
=20
> my git : https://github.com/DestroyFX/reiser4 or directly there :=20
> http://mirror.nxtoo.org/reiser4-for-3.13.patch.gz
>
> What changed is the wb_writeback_work struct in fs/fs-writeback.c so =
I=20
> changed it with the new var "unsigned int older_than_this_is_set:1;"=20
> from the 3.13 and the order of the variables changed too... The rest=20
> passed fine.
>
> It compile!
> I did not test it (it's actually my only PC with Reiser4 partitions=20
> and I can't really reboot a new kernel for now (mining coins with=20
> these 6 Radeon 7970)
>
> Happy testing and Merry Christmas!
> --=20
> To unsubscribe from this list: send the line "unsubscribe=20
> reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
