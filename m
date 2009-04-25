From: Mat <jackdachef@gmail.com>
Subject: BUG: using =?utf-8?b?c21wX3Byb2Nlc3Nvcl9pZCgp?= in preemptible [00000000] code: khungtaskd/764, disk takes pretty long to commit files to disk
Date: Sat, 25 Apr 2009 20:39:31 +0000 (UTC)
Message-ID: <loom.20090425T203214-959@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

I get the following BUG messages when syncing files from one encrypted partition
to another with reiserfs on it:

http://nopaste.info/689d1298da.html

(I got the error message:
"You have lines longer than 80 characters. Fix that."
so I posted it on nopaste.info)

besides that I noticed that network traffic gets completely "blocked" meaning it
comes to an halt and waits until the flushing has finished and first after that
continues (e.g. when browsing through the web)

was this supposed to be fixed with removing of the BKL ?

kernel is 2.6.30-rc2-zen0 (the additional features added on top of Linus' tree
can be seen at: http://git.zen-sources.org/?p=zen.git;a=shortlog)

many thanks in advance

Regards

Mat

