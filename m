From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: Re: [Testing Error] xfstests generic/127 - fsx tests modified from
 CXFSQA tests
Date: Fri, 12 Dec 2014 07:20:26 +0100
Message-ID: <CADW=+3=nhdXTWC4=yKSpiQjNyDtZ=VN5aa=mS4jXD1idbB1iHA@mail.gmail.com>
References: <CADW=+3mEeDGx7xFkTvPHijGz6KTkTZHBd42txhAkZKhBsgnS1A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=jIAjvzfaDiyexg+yR7HAQQZ5mFM3/fzDUbWEysI8vww=;
        b=IvPN3vcqJQy+pJmH6LQQ5NQEtZaXAqPYeloTkiwc3jG0KjLmLNa8KdUQ6RhQjNFZHu
         kw9mbJ7QYmKqN6u8YeDdr20mMU3wuP8LoPSXuFuXX/4/8OzPx0wbN7GGE5Ki3eyA9ofO
         KUjO9swGeiawiiLi3BzPGVnIHnW8JScUaBqTkTyQk57Tj6JnksJhAQtAcFKJblJ9CCR6
         GZEcQ29qyxQ36HG04Md0ns7RkxHKb0EsKpJVRffVcs846hUfl++zPi6qhCDFofbPGO5I
         HMYQ6Ct62UKDAMfEDJseMcK6LnqeDYI942Thv53erSF3Jg4xV0G/5TVvXFLCvEOKFC3M
         R5BA==
In-Reply-To: <CADW=+3mEeDGx7xFkTvPHijGz6KTkTZHBd42txhAkZKhBsgnS1A@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>, Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

On Fri, Dec 5, 2014 at 2:30 PM, Du=C5=A1an =C4=8Coli=C4=87 <dusanc@gmai=
l.com> wrote:
>  fsx tests modified from CXFSQA tests:
>    - fsx_00_lite
>   - fsx_05_lite_mmap
>   - fsx_10_std,
>    - fsx_15_std_mmap
>
> Code: http://oss.sgi.com/cgi-bin/gitweb.cgi?p=3Dxfs/cmds/xfstests.git=
;a=3Dblob;f=3Dtests/generic/127;
> Patch: reiser4-for-3.16.2.patch
> Extra mount options: none
>
> Process is stuck in D state
> reiser4 xfstests # ps -aux|grep fsx
> root     12884  1.9  0.3   2868  1876 pts/0    D+   15:14   0:34
> ltp/fsx -q -l 262144 -o 65536 -S 191110531 -N 100000 -L
> /mnt/test/fsx_lite_mmap
>
It's not stuck in D state but it takes 2hrs to finish which is too long=
=2E


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
