From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: 2.6.16 + reiser4 -2 patch = gcc error
Date: Thu, 18 May 2006 13:44:12 +0400
Message-ID: <1147945452.6417.24.camel@tribesman.namesys.com>
References: <20060517190805.GB32223@zero>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28646-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060517190805.GB32223@zero>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tom Vier <tmv@comcast.net>
Cc: reiserfs-list@namesys.com

Hello

On Wed, 2006-05-17 at 15:08 -0400, Tom Vier wrote:
> I'm using 2.6.16 and the patch from
> ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.16/reiser4-for-2.6.16-2.patch.gz
> 
>   CC [M]  fs/reiser4/plugin/file_ops_readdir.o
> fs/reiser4/plugin/file_ops_readdir.c: In function lseek_common_dir':
> fs/reiser4/plugin/file_ops_readdir.c:485: warning: implicit declaration of
> function 
> utex_lock'
> fs/reiser4/plugin/file_ops_readdir.c:485: error: structure has no member
> named 	_mutex'
> fs/reiser4/plugin/file_ops_readdir.c:507: warning: implicit declaration of
> function 
> utex_unlock'
> fs/reiser4/plugin/file_ops_readdir.c:507: error: structure has no member
> named 	_mutex'
> make[2]: *** [fs/reiser4/plugin/file_ops_readdir.o] Error 1
> make[1]: *** [fs/reiser4] Error 2
> make: *** [fs] Error 2
> 

I guess you got broken lines 485 and 507 in file
fs/reiser4/plugin/file_ops_readdir.c

Here is what you should have:
485:	mutex_lock(&inode->i_mutex);
507:	mutex_unlock(&inode->i_mutex);


> Sorry if this has been posted already. I searched, but didn't find it.
> 

