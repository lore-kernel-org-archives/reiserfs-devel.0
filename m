From: Stefan Andersson <stefan@siwnet.net>
Subject: Less disk space with reiser4?
Date: Mon, 11 Apr 2005 16:30:53 +0200
Message-ID: <425A8A1D.9040206@siwnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23845-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi,

I have a disk array wich I used reiserfs(v3) on, and got 932G.
Now I started to test reiser4 on it and get less space, 886G.

Is it suppose to be like this or is there something wrong?

I'am using linux 2.6.11.4 and default settings for mkfs.reiser4 and 
mkfs.reiserfs,
and reiser4 patch from 2.6.11-mm3.

//Stetan

