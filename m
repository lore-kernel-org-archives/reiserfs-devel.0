From: Hans Reiser <reiser@namesys.com>
Subject: things not to do with reiserfs if you want fsck to work
Date: Thu, 25 Apr 2002 17:11:44 +0400
Message-ID: <3CC80090.40708@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10168-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS List <reiserfs-list@namesys.com>

using debugreiserfs, you can create a file consisting of a lot of 
metadata from another reiserfs file system.

fsck doesn't find it easy to know what metadata is from which file system.

This will be fixed in v4 by using flush-stamps, and probably there are 
other solutions possible, but for now....

Hans

