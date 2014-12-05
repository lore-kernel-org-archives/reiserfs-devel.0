From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: [Testing Error] xfstests generic/091 - fsx exercising direct IO --
 sub-block sizes and concurrent buffered IO
Date: Fri, 5 Dec 2014 14:25:37 +0100
Message-ID: <CADW=+3m4fjEwTrbM6BgJdT1aAv75xS_N5=Rp7k-gR+KSpKkOBA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=1NzCH6K2SDuolKXDINm65Cr7ptruWss0BUpKGwmnHTQ=;
        b=QaYaAbClQ0LwzlI6ZTcPA/DYAVSTSjol2sRHiMmQ8Fx/QZ0RMtOzLtKl6HQMcGmYXB
         jzocAccUhQJjo8dtj/UMJRmfVIXaN6Xq/kYqRf6jXsCGnjbYFe3xGDWaQ1Mmxnx0Zpre
         0mnTr9sq5l5Z1uOdZ4yskDVpeWo7zTXiKf8Eq4tq1a+0DEIXbnteSNccO6e+yh18vCjG
         1nCl5uKuUDSUfC0AALpOF4ES7K3LxfZ4VvF/6OwFNsgiIA/3FfZ/RhljAcQGATjJRNM6
         Z9AB0a/QN6CE1BzYdHQxa1fS8NztHAWmrezC4vcQ/d81cJ1xK1MmVQcmMQH2IACPcMMN
         plyg==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>, Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

Code: http://oss.sgi.com/cgi-bin/gitweb.cgi?p=3Dxfs/cmds/xfstests.git;a=
=3Dblob;f=3Dtests/generic/091;
Patch: reiser4-for-3.16.2.patch
Extra mount options: none

I got the following error:

[failed, exit status 1] - output mismatch
 diff -u tests/generic/091.out /root/xfstests/results//generic/091.out.=
bad
--- tests/generic/091.out       2014-12-04 21:04:20.000000000 +0100
+++ /root/xfstests/results//generic/091.out.bad 2014-12-05
15:12:46.000000000 +0100
@@ -1,7 +1,5 @@
 QA output created by 091
 fsx -N 10000 -l 500000 -r PSIZE -t BSIZE -w BSIZE -Z -R -W
-fsx -N 10000 -o 8192 -l 500000 -r PSIZE -t BSIZE -w BSIZE -Z -R -W
-fsx -N 10000 -o 32768 -l 500000 -r PSIZE -t BSIZE -w BSIZE -Z -R -W
-fsx -N 10000 -o 8192 -l 500000 -r PSIZE -t BSIZE -w BSIZE -Z -R -W
-fsx -N 10000 -o 32768 -l 500000 -r PSIZE -t BSIZE -w BSIZE -Z -R -W
-fsx -N 10000 -o 128000 -l 500000 -r PSIZE -t BSIZE -w BSIZE -Z -W
+fsx -N 10000 -l 500000 -r PSIZE -t BSIZE -w BSIZE -Z -R -W
+mapped writes DISABLED
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
