From: Matias Seco <matias.jose.seco@gmail.com>
Subject: Debugging Environment
Date: Tue, 13 Dec 2011 13:24:01 +0100
Message-ID: <CAMjNLwqMi0tb7nePy9350mPz=+H8zsbUt2J+r64cvASNRYw9EA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=Od1M9yeBxSirS6tmi/pj0wgf+bnRtYSfM/28tIvOu6w=;
        b=TYDAYY9Ek6cGVUTWGn9s93rufDBdV+JzIobufHwTVxB/OioPWYj75yCsiMeR5Ob3WY
         XcyyCdYgOi6hKrKQaVuepSO8HgEyLuT22FI6PtuldrdiJpo3uzrWWTvdX8vfbIp88SOj
         6cuVFuMvehAJpl2UvmgskwSrM+kcxm0HepxbU=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

Greetings,
i wanted to ask concerns about which advices you could give to perform
a succesfull debugging analysis:

A - Excluding filesystem-related problems
a.1 Consistency check through fsck.reiser4 --check /dev/<device>, if
consistent it's not related (or it could?)

B - Bug analysis tools
b.1 always verbosing commands (to catch what triggered it)
b.2 debug.reiser4 (it can be used upon a corrupted-by-bug partition?)
b.3 fsck.reiser4 output
b.4 logs output
b.5 package-consistency-check tools output
b.6 hardware integrity check (through sensors, smartctl, etc)
b.7 later-reproducing with gdb,memwatch,yamd,electric fence
b.8 kernel-related tools (dumping,MagicKeys,kdb,kgdb,lkcd,etc)

C - Reporting
c.1 which is the actual bugtracking place? (it's still kernel.org's bugzilla?)
c.2  for me it's ok through mailing list :)

Regards,
Matias
