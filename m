From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: [Testing Error] xfstests generic/135 - Concurrent I/O to same file to
 ensure no deadlocks
Date: Fri, 5 Dec 2014 14:27:59 +0100
Message-ID: <CADW=+3noMCRv+npQ+-rmWZiETXLMJgDvWLffPVJyYyUfuqNL0A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=6H13mPtRVLQTz5qhT+RwEeaf0lxL6Dk8ssDcFBhYw1A=;
        b=wqbrSj78eJhtFVvyG7NmgodWzkkXl/FXbibM5p6Y+bgb4loJ2kLfWTT/kqWmOdzczK
         wAGvvRdmGqSL0ZU+gntasxEHdNfboiy28uhVTNglSzCMagByBdyrpZZZKe074z7Amr21
         PvIdoiBKxzZXjjKihiURto9l9QS+H2nWbYHnxFA8Uc48WCy+6+QB6Mf6VkI1fXEtlJXE
         R7l2wFwfxy/GWoVeN3Zqrx//ItYFQRxdeB0YPSUs5JDr+UtK8QvbzTxvzE7mbKq8ZjoY
         FH+l8QzQIBNUKac7DqiuRUcshkIy/0PuNAODarPdgTjbGUOOpkf181UzsfZnpQ4gG7k5
         dyww==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>, Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

Code: http://oss.sgi.com/cgi-bin/gitweb.cgi?p=3Dxfs/cmds/xfstests.git;a=
=3Dblob;f=3Dtests/generic/135;
Patch: reiser4-for-3.16.2.patch
Extra mount options: none

diff -u tests/generic/135.out /root/xfstests/results//generic/135.out.b=
ad
--- tests/generic/135.out       2014-12-04 21:04:20.000000000 +0100
+++ /root/xfstests/results//generic/135.out.bad 2014-12-05
16:03:21.000000000 +0100
@@ -1,13 +1,12 @@
 QA output created by 135
+direct_file: Invalid argument
 0000000 1212 1212 1212 1212 1212 1212 1212 1212
 *
 0004096
 0000000 3434 3434 3434 3434 3434 3434 3434 3434
 *
 0004096
-0000000 5656 5656 5656 5656 5656 5656 5656 5656
-*
-0004096
+0000000
 0000000 7878 7878 7878 7878 7878 7878 7878 7878
 *
 0002048


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
