From: Andreas Moroder <andreas.moroder@sb-brixen.it>
Subject: device completely blocked
Date: Mon, 03 Sep 2007 08:14:53 +0200
Message-ID: <fbg8ou$fje$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel@vger.kernel.org

Hello,

we removed a 20 files from a directory. The rm does never end and all 
other processes that try to write to the same device are blocked.
This happen two to three times a year to our hospital server. The 
problem is that it is hard to find a time to shut down this server.

There is no way to kill the processes that access this devices. Is there 
a way to solve this problem without shuting down the machine ?
Does umount -f work on local reiserfc filesystems ?

Thanks
Andreas

