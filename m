From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: Reiser4 + seekdir()
Date: Mon, 27 Jun 2005 15:41:41 +0400
Message-ID: <1119872500.4257.260.camel@tribesman.namesys.com>
References: <42BFC6B0.7040202@yandex.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24689-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42BFC6B0.7040202@yandex.ru>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
Cc: reiserfs-list@namesys.com

Hello

On Mon, 2005-06-27 at 13:28, Artem B. Bityuckiy wrote:
> Hello,
> 
> I was investigating Riser4 readdir() handling. As the result I've 
> realized the following:
> 
> 1. repeatable readdir() calls should work well.
> 2. seekdir()/telldir() mustn't work. (because per_file readdir_pos 
> stores only the _last_ f_pos->{key, entry_no, position} mapping, so the 
> mapping will be lost on the next readdir(), and the previous seekdir() 
> will be lost too).
> 
> But probably I don't quite well understand what's going on. Here is the 
> list of things which makes me doubt.
> 
> 1. There are two types of directory plugins: HASHED_DIR_PLUGIN_ID and 
> SEEKABLE_HASHED_DIR_PLUGIN_ID. The latter is claimed as "hashed 
> directory for which seekdir/telldir are guaranteed to work". I don't 
> understand how can it work. 

Location within a directory in reiser4 is logical number of entry within
the directory.

> Could somebody please point me the code 
> which implements seekdir() (seekdir is actually 
> lseek(fd,saved_position,SEEK_SET) in glibc) ? For me it looks like both 
> must not support telldir()/seekdir() ...
> 
fs/reiser4/plugin/dir/dir.c:seek_dir()

You may also want to read a comment before
fs/reiser4/plugin/dir/dir.c:readdir_common and comment named  "STATELESS
READDIR" in the fs/reiser4/plugin/dir/dir.c.

> 2. Why you store {entry_no, position, key} in readdir_pos instead of 
> just storing the full name string ? In that case you would not need 
> adjust_dir_pos() at all ...
> 

we can not return entry key to telldir, on seekdir we have to be able to
position within a directory by off_t - therefore, we need adjust_dir_pos
anyway.

