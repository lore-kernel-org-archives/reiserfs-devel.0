From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: [Testing Error] xfstests generic/127 - fsx tests modified from CXFSQA tests
Date: Fri, 5 Dec 2014 14:30:08 +0100
Message-ID: <CADW=+3mEeDGx7xFkTvPHijGz6KTkTZHBd42txhAkZKhBsgnS1A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=jl6f9LSj2MtPjuHfZhgZfrOkuahPKkPQQgzL049v2IE=;
        b=jYFUh5tqDGjm4DCh1QwXMc9v06AFsG00cmIaeYfQk6hEPJQkoZM+kcFDfg0S9TM4LC
         78S2GT43upyCWwZy2stFfjHPf3KrvyXDGD/sfb72LiWl7uXAbhQ+nftD03xDmqVbsZ/b
         TTkDX4FXE4YlZix2va1O3VWrxZboLF+QWEND+ugV0SiRx+DgM7JDMk6KHBbSbVw50gRg
         98eQkY2McyqlpQWTCX7CA3GdKNOHN5ZVbFzG6mTOGqmun7IRHFRmM8FhBkqUvlfjUxGJ
         egZtTnQb+F0CHi7ewY6eyjPJa3od+eYl1Vo54ba7VFXQLz6n/hcJS7S3lINt1SieDPjf
         BJDA==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>, Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

 fsx tests modified from CXFSQA tests:
   - fsx_00_lite
  - fsx_05_lite_mmap
  - fsx_10_std,
   - fsx_15_std_mmap

Code: http://oss.sgi.com/cgi-bin/gitweb.cgi?p=3Dxfs/cmds/xfstests.git;a=
=3Dblob;f=3Dtests/generic/127;
Patch: reiser4-for-3.16.2.patch
Extra mount options: none

Process is stuck in D state
reiser4 xfstests # ps -aux|grep fsx
root     12884  1.9  0.3   2868  1876 pts/0    D+   15:14   0:34
ltp/fsx -q -l 262144 -o 65536 -S 191110531 -N 100000 -L
/mnt/test/fsx_lite_mmap



On Fri, Dec 5, 2014 at 2:22 PM, Du=C5=A1an =C4=8Coli=C4=87 <dusanc@gmai=
l.com> wrote:
> I managed to get xfstests  (
> http://oss.sgi.com/cgi-bin/gitweb.cgi?p=3Dxfs/cmds/xfstests.git;a=3Dt=
ree ) to
> run on Reiser4 partition. Test for async, acl, quota still don't work=
 but a
> lot of the rest finishes successfully.
> Tests were run on reiser4-for-3.16.2.patch
> I'll post unsuccessful tests and their results in following e-mails.
>
> Dushan
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
