From: Tom Vier <tmv@comcast.net>
Subject: dirsync doesn't seem to work
Date: Thu, 29 Jul 2004 21:15:05 -0400
Message-ID: <20040730011505.GB4950@zero>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19861-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

when i run this:

while true; do touch heh; rm -f heh; done

on reiserfs, it doesn't seem to be actually writing. the wait cpu % is very
low when using reiserfs or normal mode ext3. when i mount ext3 using dirsync,
and i run the loop, wait time is above 90%.

this is the best test method i can think of right now. i can't hear a
difference in the drive (which might be using write back cache, but i can't
reformat any of my scsi drives in ext3 right now to see they make more noise
with dirsync + write-through).

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0x15741ECE
