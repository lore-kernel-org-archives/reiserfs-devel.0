From: Grant Miner <mine0057@umn.edu>
Subject: Enabling files as directories?
Date: Thu, 14 Aug 2003 20:46:30 -0500
Message-ID: <3F3C3B76.1000002@umn.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15311-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

I am wondering how can I enable files as directories behavior.  For example:
touch a; chmod a+x a
cd a
touch b -> error, not a directory

Thanks,
Grant

