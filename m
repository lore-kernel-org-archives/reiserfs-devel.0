From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
Subject: Reiser4 + seekdir()
Date: Mon, 27 Jun 2005 13:28:16 +0400
Message-ID: <42BFC6B0.7040202@yandex.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24684-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hello,

I was investigating Riser4 readdir() handling. As the result I've 
realized the following:

1. repeatable readdir() calls should work well.
2. seekdir()/telldir() mustn't work. (because per_file readdir_pos 
stores only the _last_ f_pos->{key, entry_no, position} mapping, so the 
mapping will be lost on the next readdir(), and the previous seekdir() 
will be lost too).

But probably I don't quite well understand what's going on. Here is the 
list of things which makes me doubt.

1. There are two types of directory plugins: HASHED_DIR_PLUGIN_ID and 
SEEKABLE_HASHED_DIR_PLUGIN_ID. The latter is claimed as "hashed 
directory for which seekdir/telldir are guaranteed to work". I don't 
understand how can it work. Could somebody please point me the code 
which implements seekdir() (seekdir is actually 
lseek(fd,saved_position,SEEK_SET) in glibc) ? For me it looks like both 
must not support telldir()/seekdir() ...

2. Why you store {entry_no, position, key} in readdir_pos instead of 
just storing the full name string ? In that case you would not need 
adjust_dir_pos() at all ...

Please, comment on this. Thanks.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
