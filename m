From: David Greaves <david@dgreaves.com>
Subject: How long will a shrinkfs take?
Date: Thu, 10 Jun 2004 21:13:35 +0100
Message-ID: <40C8C0EF.7060704@dgreaves.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19137-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi

I have a 1Tb reiserfs that I want to shrink to 500Gb
400Gb of data is used.

Any estimates as to how long this will take?
Sustained I/O is about 33Mb/s at the fs level, 44 Mb/s at the lv level 
and 65Mb/s at the md0 level.

(I didn't expect the fs to be so slow so I'm going to try a few tuning 
params on the new 500Gb space before copying over the data and growing 
back to a Tb)

Is it proportional to the amount of shrinkage (ie 2 hrs to reduce by 
50G, 20 hrs to reduce by 500Gb)

David

