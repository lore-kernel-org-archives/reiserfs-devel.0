From: Frank Carreiro <frank.carreiro@investools.com>
Subject: Can't kill a process
Date: Tue, 06 Apr 2004 08:52:38 -0600
Message-ID: <4072C436.8050106@investools.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17744-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

I have a rather intense process that has been running since last night.  
I wanted to kill it since it's eating up my cpu however kill and kill -9 
don't seem to be doing the trick.

I'm running the reiser 3.6.25 file system on a RedHat Advanced Server 
(2.1) with 2.4.9-3.38smp kernel.

It's simply counting the time away as it copies files to disk.  I've 
reniced it to 15.  It's also on a raid 5 array and I've modified my 
min/max speed to 10/50.  Performance has improved however the process is 
still running. 

Thoughts?

thx



