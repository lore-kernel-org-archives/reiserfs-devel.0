From: Dushan Tcholich <dusanc@gmail.com>
Subject: Reiser4 for 2.6.36 kernel panic
Date: Fri, 4 Mar 2011 19:08:24 +0100
Message-ID: <AANLkTimrF930Dh82UKoq=M0mDy7aVrvbXC=ZDoTZT_YC@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=aWO8WKqmkV9f5MX4m1HJxFol8772kI72kLg2Q3/T9O8=;
        b=FeDMpZivDkyvyFVHmsg+D/UEq5q8Kd2AH99dVRSzL4wf1q/MfpqKgawrWhIJPjOKG+
         M2ZHwX/FIzqBgxIWsrH7nubReF66MwXRfy2h1Zm0Tbw/RS6u/MP1aH7zJ6ZuGj1sJCQv
         T0wmFNSnYl/Hb/zr5aYqpLae8FtOjOhhAzbC0=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>, Edward Shishkin <edward.shishkin@gmail.com>

I captured kernel output with a mobile
camera.http://img854.imageshack.us/i/04032011.jpg/

 Missing text says:
"reiser4_handle_error (fs/reiser4/vfs_ops.c:240)[foobar-42]

It happened day after I enabled KMS in kernel for ati card, didn't
notice this problem earlier.

It happened twice, once after ~12h uptime, next time after ~2h uptime.

Nothing in /var/log/messages

Have a nice day

Dushan
