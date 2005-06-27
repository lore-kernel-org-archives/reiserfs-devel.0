From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
Subject: Re: Reiser4 + seekdir()
Date: Mon, 27 Jun 2005 16:09:06 +0400
Message-ID: <42BFEC62.1010907@yandex.ru>
References: <42BFC6B0.7040202@yandex.ru> <1119872500.4257.260.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24690-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1119872500.4257.260.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com

> Location within a directory in reiser4 is logical number of entry within
> the directory.
Yes, I know. It does not absolutely correctly handle the way when 
dirents were deleted before and after the saved position.

Well, Nikita kindly answered my questions in IRC (unfortunately there 
are few Namesys people there).
According to him, seekdir() doesn't have to work correctly if the 
previous N direntries were deleted (it only tries). Indeed, even 
classical FSes (where directory is a file with the plain list of 
direntries) may shrink directories. I thought Reiser4 pretends to work 
correctly even in case of deletions.

> fs/reiser4/plugin/dir/dir.c:seek_dir()
> 
> You may also want to read a comment before
> fs/reiser4/plugin/dir/dir.c:readdir_common and comment named  "STATELESS
> READDIR" in the fs/reiser4/plugin/dir/dir.c.
Yes, I read it of course. It is really confusing. What it should mention 
is that

> we can not return entry key to telldir, on seekdir we have to be able to
> position within a directory by off_t - therefore, we need adjust_dir_pos
> anyway.
Yes, thanks, I've realized this as well.

Could you please explain the real difference between 
SEEKABLE_HASHED_DIR_PLUGIN_ID and LAST_DIR_ID plugins. Both seems to 
support seeks. Both seems to call adjust_dir_pos(). Only key assignment 
is simpler in case of SEEKABLE_HASHED_DIR_PLUGIN_ID. This confused me 
very much.

Thanks.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
