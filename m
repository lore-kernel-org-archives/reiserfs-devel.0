From: Konstantin <newsbox1026@web.de>
Subject: Reiser4 on 2.6.31.4 freezes process accessing file, fsck 1.0.7 finds
 no inconsistency
Date: Mon, 19 Oct 2009 00:10:10 +0200
Message-ID: <4ADB9242.30808@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hi!

I am running reiser4 for a few years now without problems. Yesterday I
had an undeletable directory which ls -a reported empty but rmdir
claimed not to be empty. There were no kernel messages about it. After
fsck-ing I had to run fsck.reiser4 --build-fs (reiser4progs 1.0.7) which
finished but printed an error at the very end like "application error"
(sorry, I didn't wrote it down). A second run of fsck.reiser4 told me to
fix some remaining corruptions using --fix. This worked without error
messages and a following fsck told me everything is OK.

But then accessing a file froze the process, consuming 100% CPU. I tried
cat and cp with same result. The processes could not be terminated nor
killed. Still no kernel messages. Only rebooting helped here and a
following fsck showed no corruptions. The file could be renamed and
deleted which kind of solved the problem. I haven't found (yet) another
file like this.

Before deleting the bad file I did a debugfs.reiser4 -P to store the
metadata so if anyone is interested in debugging this bug contact me to
give you the file (34MB bz2).

Konstantin

