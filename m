From: "Dushan Tcholich" <dusanc@gmail.com>
Subject: zen-sources (reiser4 for 2.6.25) reiser4 cryptocompress oops on loop
Date: Wed, 4 Jun 2008 15:08:42 +0200
Message-ID: <a08621850806040608u3a15125aic2ebbde5da12eb81@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=SwrRlNRvPxfaRsMpHIqWfIFiMAnjQwiqMORbD5KbJyk=;
        b=VKwzbOUtdlZmI3/knXi1juPQM77Xv7j1ZpeN/Xy97SwBuBeLv2Lej7CVSC2qtqBvoA
         9YiYJbWfRumRdRxF5kgFOTpszvp4bEcFLX+AkG93RCDwxznTdICNGoJ/Xss1y1WCiJ8g
         gLmyT9xzzVql2gCSYJEPWhk2TxbcRD975+iiI=
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org, Edward Shishkin <edward.shishkin@gmail.com>

I'm transfering a gentoo user report of reiser4 problems:

Quote:
For me it only panicks when intensive operations are performed on loop
file (portage sync, unmount). Main partition is R4CC with default
settings with two loop files (portage and ccache) on it. Both are R4CC
formatted as well. The first one (portage) is created as sparse file,
second one (ccache) is ordinary prealocated loop file. Kernel panic
occurs when I sync/unmount portage loop file. Only messages I got are:
reiser4 panicked cowardly: reiser4[pdflush(212)]: reiser4_handle_error
(fs/reiser4/vfs_ops.c:232)[foobar-42]:
Kernel panic - not syncing: reiser4_handle_error
(fs/reiser4/vfs_ops.c:232)[foobar-42]:
 I'd like to point out that this setup worked for few days without
problems, but later, probably when sparse file started to grow, it
started panicking.
/Quote
More pointers: http://forums.gentoo.org/viewtopic-p-5112215.html#5112215

I hope this is useful to you

Dushan
