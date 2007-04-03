From: Eddie Atherton <stunnel@attglobal.net>
Subject: Convert Sector Address to File
Date: Tue, 03 Apr 2007 14:35:05 -0700
Message-ID: <4612C889.8050800@attglobal.net>
Reply-To: stunnel@attglobal.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30628-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

I'm currently running SpinRite to attempt to recover a drive that 
suddenly developed a bunch of problems. It's managed to recover most of 
the disc, but there a whole bunch of sectors that are reported as only 
partially recovered.

Is there any way to "reverse" back from the relative sector in the 
partition, back to the actual file/directory, so I can see which 
files/directories are still damaged.

Cheers.
