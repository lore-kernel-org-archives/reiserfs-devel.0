From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: [Testing Error] xfstests generic/169 - Test for file size consistency
 with append followed by umount/mount
Date: Fri, 5 Dec 2014 14:31:59 +0100
Message-ID: <CADW=+3kaEEz1fw2yx8K7Hi8wNPZLk-MfcS5K=vGjWrQPWd__2w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=KBl68qeVfOAR9xBLCs1bvoMmo6UZrFyfgfOIYDSIIuw=;
        b=t+g1W0wB4UduDH/X31iu2E1Qs+Ao/bstONw+7XJu1clhz2dKp3FdzVdvFjgatxnBDl
         Fxbt69ZceShI7rsljCKrmCrl/mn/qk3tPH73lnF07cp6ZKVe6DrTkTWLpd/VpTGIViZ4
         kr88cqHEnisYMMaqXOqr4S2KyI9dEhFcr4Vn0eKiINYLcn6BJ43C/Df2ru33na6k5qxr
         kWo7U9Ercg3yx1edW93j22SXv0gzALmUcxduExTtD1GbHP8qywO7GC93Thgf1VVZELPv
         K/mKIN0M8hbWgKtQhqS7A8bvHDCkaAZSpbu6XlNm1zUz67IZjZ6YhCkLcatbzJsJK8tu
         am6A==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>, Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

Code: http://oss.sgi.com/cgi-bin/gitweb.cgi?p=3Dxfs/cmds/xfstests.git;a=
=3Dblob;f=3Dtests/generic/169;
Patch: reiser4-for-3.16.2.patch
Extra mount options: none

diff -u tests/generic/169.out /root/xfstests/results//generic/169.out.b=
ad
--- tests/generic/169.out       2014-12-04 21:04:20.000000000 +0100
+++ /root/xfstests/results//generic/169.out.bad 2014-12-05
16:03:27.000000000 +0100
@@ -4,11 +4,11 @@
 wrote 5120/5120 bytes at offset 0
 wrote 5120/5120 bytes at offset 5120
 wrote 5120/5120 bytes at offset 10240
-stat.size =3D 15360
+stat.size =3D 20481
 # unmounting scratch
 # mounting scratch
 # stating file to confirm correct size
-stat.size =3D 15360
+stat.size =3D 20481
 # appending 10 bytes to new file, sync at 5 bytes
 wrote 5/5 bytes at offset 0
 wrote 5/5 bytes at offset 5


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
