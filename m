From: "daniel.poelzleithner" <poelzi@poelzi.org>
Subject: Fastest way to walk through a file tree on reiser4
Date: Sat, 17 Apr 2004 18:04:53 +0200
Message-ID: <408155A5.8080205@poelzi.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18021-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi,

i followed the reiser4 development for over a year and i'm really 
pleased about it :-)

Once i written about a performance bottelneck on reiser3 when requesting 
stats from files and wonder if the reiser4 api could increase the process.

The program should walk through a file tree and return a list of all 
files their link count is 1. What would be the fastest way to realize this ?

regards
  Daniel
