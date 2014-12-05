From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: [Testing Error] xfstests generic/263 - fsx exercising direct IO vs
 sub-block buffered I/O
Date: Fri, 5 Dec 2014 14:33:54 +0100
Message-ID: <CADW=+3k72fV1RbUjd+kQtQLPWxrCbQay9AL2=fzoDjX9vZhm4g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=TjGX/Q2xcgYhA4REhNsESwYGDE3o2VyIxFGMrqMTcec=;
        b=GZQRTgaL/yj15TA0WsNcUMlAwr1ZVDnIP8n0RW8iTZl/dbGeyicUCpHzULhyHmsWYs
         az3CZjrvqrzj4c4Aj1URA/m6fxP9ZyZ7PJzaP8TNRrfc1KG1PIZ76phgCgS70IhbIn3t
         Ltg4ocPch6wcuqq9r5rxaEUkOYSgTpNpzhOdcBIVIwENtpSB3hqFoT97bBqi5ZPpqzN2
         7RKRn9rAnrO5QByRotH0s2WmgMZg3HxT/UePmVo5d3VWQ7im227P0yn41iUlIofEgUyB
         SXnf8NHFP8+qvw1nXnOq8IyaxyGVEZmQ4nWahTz4AwYK+Iytxcs8P7l8SAOaZMndWllS
         4nfg==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>, Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

Code: http://oss.sgi.com/cgi-bin/gitweb.cgi?p=3Dxfs/cmds/xfstests.git;a=
=3Dblob;f=3Dtests/generic/263;
Patch: reiser4-for-3.16.2.patch
Extra mount options: none

diff -u tests/generic/263.out /root/xfstests/results//generic/263.out.b=
ad
--- tests/generic/263.out       2014-12-04 21:04:20.000000000 +0100
+++ /root/xfstests/results//generic/263.out.bad 2014-12-05
16:04:23.000000000 +0100
@@ -1,3 +1,4 @@
 QA output created by 263
 fsx -N 10000 -o 8192 -l 500000 -r PSIZE -t BSIZE -w BSIZE -Z
-fsx -N 10000 -o 128000 -l 500000 -r PSIZE -t BSIZE -w BSIZE -Z
+fsx -N 10000 -o 8192 -l 500000 -r PSIZE -t BSIZE -w BSIZE -Z
+/mnt/test/junk: Invalid argument

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
