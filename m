From: Dan Oglesby <doglesby@teleformix.com>
Subject: 2.6.13.4 + Reiser4 looks good!
Date: Sun, 16 Oct 2005 10:26:08 -0500
Message-ID: <43527110.8000307@teleformix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26542-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Just wanted to report that I've been able to compile the latest Reiser4 
2.6 kernel patch into a 2.6.13.4 kernel (compiled for SMP) with no 
errors or warnings, and have so far written over 1GB of data to the 
filesystem.

This is on Slackware 10.2, dual Intel PII-400 processors, 1GB of RAM 
(running 4GB himem support in the kernel), no premptive kernel, gcc 
version 3.3.6.

I'm loading the reiser4 module manually, and have a 120GB Western 
Digital drive as one reiser4 filesystem.  I'm currently rsyncing a 
Gentoo mirror to this hard drive as a test.

I have had the system crash on me three times while writing to the 
filesystem, but it turned out to be a problem with ACPI, and the reiser4 
filesystem had no errors after every crash (fsck run with --check 
reported no errors).

Lookin' good!

--Dan
