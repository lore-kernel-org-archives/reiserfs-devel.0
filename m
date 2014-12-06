From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [Testing Error] xfstests generic/169 - Test for file size consistency
 with append followed by umount/mount
Date: Sat, 06 Dec 2014 13:00:53 +0100
Message-ID: <5482EFF5.6010309@gmail.com>
References: <CADW=+3kaEEz1fw2yx8K7Hi8wNPZLk-MfcS5K=vGjWrQPWd__2w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=x0c8qHpyn9R7JDjDC0vH1HRZgFHuV4elDK+yFkOb8SM=;
        b=bOSqt6uktDaY+Um9N4+EvUb/NRGB+lDfLaD1AUHVQgX8acXCKo17dBxlL01eVy2Q50
         FPdn+LuVVmCPjxHZBNb1sOvm+Xg4sWxxLfOSJefsqTynFKZmwHMQE+zw1wYn2VJl5u5P
         r7ub+MhmYbhYlG5Utcv2Q4dT9BvGEkez72PHs8B7unbPPszy8g8L/YE4vXfcApXW61RK
         E3DRBpUKp3PwA/zCuWdyxITbjBB9gNZYIDqHMp5Fnla/BW1hGjOpsiUTZzGwHyae84ky
         P/x1GodeYbcySqSxTycjLQFn7ObvHPkN6XKSZQi0D3u4uAKtAnDzRho9WgnxGI7AbhWj
         toIQ==
In-Reply-To: <CADW=+3kaEEz1fw2yx8K7Hi8wNPZLk-MfcS5K=vGjWrQPWd__2w@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>, Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>


On 12/05/2014 02:31 PM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
> Code: http://oss.sgi.com/cgi-bin/gitweb.cgi?p=3Dxfs/cmds/xfstests.git=
;a=3Dblob;f=3Dtests/generic/169;
> Patch: reiser4-for-3.16.2.patch
> Extra mount options: none
>
> diff -u tests/generic/169.out /root/xfstests/results//generic/169.out=
=2Ebad
> --- tests/generic/169.out       2014-12-04 21:04:20.000000000 +0100
> +++ /root/xfstests/results//generic/169.out.bad 2014-12-05
> 16:03:27.000000000 +0100
> @@ -4,11 +4,11 @@
>   wrote 5120/5120 bytes at offset 0
>   wrote 5120/5120 bytes at offset 5120
>   wrote 5120/5120 bytes at offset 10240
> -stat.size =3D 15360
> +stat.size =3D 20481


Hmm, 5120+10240 !=3D 15360?
What a surprise. OK, I'll take a look at leisure..

Thanks,
Edward.


>   # unmounting scratch
>   # mounting scratch
>   # stating file to confirm correct size
> -stat.size =3D 15360
> +stat.size =3D 20481
>   # appending 10 bytes to new file, sync at 5 bytes
>   wrote 5/5 bytes at offset 0
>   wrote 5/5 bytes at offset 5
>
>
> On Fri, Dec 5, 2014 at 2:22 PM, Du=C5=A1an =C4=8Coli=C4=87 <dusanc@gm=
ail.com> wrote:
>> I managed to get xfstests  (
>> http://oss.sgi.com/cgi-bin/gitweb.cgi?p=3Dxfs/cmds/xfstests.git;a=3D=
tree ) to
>> run on Reiser4 partition. Test for async, acl, quota still don't wor=
k but a
>> lot of the rest finishes successfully.
>> Tests were run on reiser4-for-3.16.2.patch
>> I'll post unsuccessful tests and their results in following e-mails.
>>
>> Dushan

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
