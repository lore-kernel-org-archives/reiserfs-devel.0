From: Jeffrey Yasskin <jyasskin@mail.utexas.edu>
Subject: Where are the plugins?
Date: Sat, 30 Aug 2003 15:24:47 -0500
Message-ID: <3F51080F.7060901@mail.utexas.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15502-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

I've been looking at the reiser4 source code for a few days, and I can't 
find any non-essential plugins.

For example: You say on the website that you've written several security 
plugins for DARPA, but the only files in fs/reiser4/plugin/security/ are 
acl.c and perm.{c,h}, and acl.c is empty.
On the website you also suggest writing a plugin so /etc/passwd can be 
split in to individually-permissioned sub-files. Is that plugin written 
yet, or is it just an idea?

I'd like to write a few plugins to move mp3s' and oggs' meta-data into 
the filesystem, and it'd be a lot easier if there were an example to 
copy from. (Would it be better just to move that kind of plugin into a 
userspace callback?)

Thanks,
Jeffrey

