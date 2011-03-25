From: Dushan Tcholich <dusanc@gmail.com>
Subject: Re: Reiser4 for 2.6.36 kernel panic
Date: Fri, 25 Mar 2011 08:16:48 +0100
Message-ID: <AANLkTi=C7p41JnMdN39-Es9dY5LygS1Bwpm_ODnQogh+@mail.gmail.com>
References: <AANLkTimrF930Dh82UKoq=M0mDy7aVrvbXC=ZDoTZT_YC@mail.gmail.com>
	<4D713169.3060906@gmail.com>
	<AANLkTimqtUR-Wfja8tpC4LATZYVpN5N01aPGLFqzOV8K@mail.gmail.com>
	<AANLkTimYL=czRRmTSUabohUKNgKzmciKAavfLKqj5aRP@mail.gmail.com>
	<4D8BC711.1020101@gmail.com>
	<AANLkTikMKQdsrSB__KLGs5wS9+nO3rxOhrWc-x2je5o-@mail.gmail.com>
	<AANLkTikK8pS_bsxnwYrRd3NVXsR=uf5OWe_2h3+njOVU@mail.gmail.com>
	<4D8BF466.7080600@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=7QzszMob2lohSunVb8orjzzLOVtQy//WitzxjBBjRvQ=;
        b=JGalUYNsvqAT6GwZywNG08q6F4eOsk16wnpSy+JhPAl2EIzTOHNGhpGdsM8pv5x4Nj
         2yeaxHfpK+Hib5iMOYaEmy1r8LhDB1cDHCHX0Q3qyMwJURrQLj+DoReu5cbUTHlVOYCh
         Vh1wsuBthPBrd6lzdPs6yHWOcf+Odusk08QPQ=
In-Reply-To: <4D8BF466.7080600@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

Yeah, well all I wanted to report that it hadn't become read-only in
last 17 days :D

When I said it's fine, maybe I should have clarified it :D

On Fri, Mar 25, 2011 at 2:48 AM, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
> On 03/25/2011 12:15 AM, Dushan Tcholich wrote:
>>
>> Btw. I found something suspicious in my /var/log/messages
>>
>> Mar 24 17:03:48 krshina3 kernel: [18656.820109] ata1: lost interrupt
>> (Status 0x50)
>> Mar 24 17:03:48 krshina3 kernel: [18656.820128] ata1.00: exception
>> Emask 0x10 SAct 0x0 SErr 0x4050002 action 0xe frozen
>> Mar 24 17:03:48 krshina3 kernel: [18656.820133] ata1.00: SError: {
>> RecovComm PHYRdyChg CommWake DevExch }
>> Mar 24 17:03:48 krshina3 kernel: [18656.820137] ata1.00: failed
>> command: WRITE DMA
>> Mar 24 17:03:48 krshina3 kernel: [18656.820145] ata1.00: cmd
>> ca/00:10:18:0e:03/00:00:00:00:00/e1 tag 0 dma 8192 out
>> Mar 24 17:03:48 krshina3 kernel: [18656.820146] =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0res
>> 40/00:00:00:4f:c2/00:00:00:00:00/00 Emask 0x14 (ATA bus error)
>> Mar 24 17:03:48 krshina3 kernel: [18656.820150] ata1.00: status: { D=
RDY }
>> Mar 24 17:03:48 krshina3 kernel: [18656.820161] ata1.00: hard resett=
ing
>> link
>> Mar 24 17:03:48 krshina3 kernel: [18657.544072] ata1.01: hard resett=
ing
>> link
>> Mar 24 17:03:48 krshina3 kernel: [18658.020149] ata1.00: SATA link u=
p
>> 3.0 Gbps (SStatus 123 SControl 300)
>> Mar 24 17:03:50 krshina3 kernel: [18658.020161] ata1.01: SATA link
>> down (SStatus 4 SControl 300)
>> Mar 24 17:03:50 krshina3 kernel: [18658.036242] ata1.00: configured =
for
>> UDMA/133
>> Mar 24 17:03:50 krshina3 kernel: [18658.036248] ata1.00: device
>> reported invalid CHS sector 0
>> Mar 24 17:03:50 krshina3 kernel: [18658.036257] ata1: EH complete
>>
>> But it doesn't make kernel panic,
>
>
> It shouldn't panic with such mount options.
> At the "moment of truth" your system will become read-only..
>
>
> =C2=A0system continues to work 24/7.
>>
>> Thanks
>>
>> Dushan
>>
>> On Fri, Mar 25, 2011 at 12:12 AM, Dushan Tcholich<dusanc@gmail.com>
>> =C2=A0wrote:
>>>
>>> =C2=A0cat /etc/fstab | grep "#" -v
>>>
>>>
>>> /dev/sda1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /boot =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ext2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0noauto,noatime =C2=A01
>>> 2
>>> /dev/md1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0non=
e =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0swap =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0sw =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00
>>> 0
>>> /dev/sda2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 / =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reiser4
>>> noatime,onerror=3Dremount-ro =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00 0
>>> /dev/md126 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/mnt/med=
ia =C2=A0 =C2=A0 =C2=A0reiser4
>>> noatime,users,onerror=3Dremount-ro =C2=A0 =C2=A0 =C2=A0 =C2=A00 0
>>> /dev/md127 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/por=
tage =C2=A0 =C2=A0reiser4
>>> noatime,onerror=3Dremount-ro =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00 0
>>>
>>> shm =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /dev/shm =C2=A0 =C2=A0 =C2=A0 =C2=A0tmpfs
>>> nodev,nosuid,noexec =C2=A0 =C2=A00 0
>>>
>>> This is fstab for last 2 weeks:D
>>>
>
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
