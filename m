From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: Re: [xfstests/generic/081] Kernel panic with reg40 plugin and R4-for-4.1.5.patch
Date: Thu, 10 Sep 2015 21:42:31 +0200
Message-ID: <CADW=+3mQjNcwFzaWNdXDG+-_We=mQ+_1EfbS_Jy9KkiFx5Bi=w@mail.gmail.com>
References: <CADW=+3=x+ajq+N4QqwmRQ-4uEAPEpr5xopV+31zz2HQonMc_UA@mail.gmail.com>
	<55F1D7E9.2000209@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=JJp/p2Q0vs1L0iKDnF1Ilil9/Ez5IXb4rHNXpe/tnbI=;
        b=zYjCi40edxnYC/k9QXj4mWAPUjT/A1OKuXifTk9onjyu0Bb+eKKeCorD8oi6YDG7px
         98Tcg0BpbCd8pVBZJjJySsPOpP2HKVK6BVDbrX9j953d4UZHCz87DGAO5FIOHei7FFio
         DUclCuhPihNyOTKIuvLCgLgza85CX5v8ZUSQRSU2UpBfEBtOCSIHtfP/whjVROSWQ7tt
         Y0Xj1HF8cPtprW6BCQsb86y7RGCslfR73FojYw0Qk/nfeCy5GrNLdHhoUs+cIo7Lo6Cw
         AxGlSzXNMtXclKQ/WGFGlNuY53YUYEFFniPFi60D+rDmEUx6OQ+/4q25ZR+CYlGJoKwh
         zQBw==
In-Reply-To: <55F1D7E9.2000209@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

On Thu, Sep 10, 2015 at 9:20 PM, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
> Actually, this is not a regression.
> The attached patch prevents the panic.
> By default on IO errors reiser4 partition will be remounted as "reado=
nly".
>
> No ideas why accessing /dev/dm-X causes IO error.
> Reiser4 is not the culprit ;) You can narrow down this, if interestin=
g.
> I think that something is wrong with LVM settings...
>
I looked more into this: This test fills up dm snapshot (writes 5MB to
4MB snapshot) so we get IO error because it's full. It doesn't trigger
on ccreg40 because ccreg40 compresses data so 5MB of compressible data
< 4MB space ;)
xfstests uses compressible data for disk full tests so on ccreg40 they
give false positive. Are ccreg40 and reg40 code paths for disk full
situation the same?
I'll look into fixing xfstetsts.
> Thanks,
> Edward.
>
>
>
> On 09/04/2015 09:35 AM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
>>
>> Kernel: 4.1.6
>> R4 patch: 4.1.5
>> Test: xfstests/generic/081 "Test I/O error path by fully filling an =
dm
>> snapshot."
>>
>> Test passes cleanly with ccreg40 but kernel panics with reg40 plugin=
=2E
>> Picture of the panic, as I had no other means of capturing it, is in
>> attachment.
>>
>> xfstests local.config section:
>>
>> [r4Hybrid]
>> MKFS_OPTIONS=3D"-o create=3Dreg40"
>> MOUNT_OPTIONS=3D"-o noatime"
>>
>> Have a nice day.
>>
>> Dushan
>
>
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
