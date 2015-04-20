From: Jose R R <jose.r.r@metztli.com>
Subject: Patching Linux kernel 4.0 with reiser4-for-3.19.5.patch.gz
Date: Mon, 20 Apr 2015 05:51:24 -0700
Message-ID: <CAM12Q5RgSQjpy51B+DyHGf3tmoyehp0=8ZotytC8GWc_OALRHw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Niltze, all!

Using today's Reiser4 release (< https://sourceforge.net/projects/reiser4/ >)

attempting to patch kernel 4.0, I get a couple of snags:

linux-4.0$ gzip -dc ~/Downloads/reiser4-for-3.19.5.patch.gz | patch  -p1
patching file Documentation/Changes
patching file Documentation/filesystems/reiser4.txt
patching file fs/fs-writeback.c
Reversed (or previously applied) patch detected!  Assume -R? [n]

[...]

patching file mm/vmscan.c
Hunk #1 FAILED at 2518.
Hunk #2 succeeded at 2614 (offset 54 lines).
1 out of 2 hunks FAILED -- saving rejects to file mm/vmscan.c.rej

Yeah, I know :p patch was not designed for newer kernel but I was curious.


Best Professional Regards

-- 
Jose R R
http://www.metztli-it.com
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
