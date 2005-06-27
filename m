From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
Subject: Re: Reiser4 + seekdir()
Date: Mon, 27 Jun 2005 16:57:55 +0400
Message-ID: <42BFF7D3.3010206@yandex.ru>
References: <42BFC6B0.7040202@yandex.ru>	 <1119872500.4257.260.camel@tribesman.namesys.com>	 <42BFEC62.1010907@yandex.ru> <1119875956.4256.277.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24698-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1119875956.4256.277.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com

Vladimir,

thanks for answer.

Vladimir Saveliev wrote:
> for some reasons IRC server decided to not allow us to connect.
Well, switching to another server may help.

> I guess between SEEKABLE_HASHED_DIR_PLUGIN_ID and HASHED_DIR_PLUGIN_ID?
yes, pardon.

> SEEKABLE_HASHED_DIR_PLUGIN_ID should actually be able to handle
> seekdir/telldir/nfs perfectly: the only part of entry key which depends
> of filename is 31 bit hash. Then it can be used to interact with
> tell/seekdir. The only problem is hash collistions.
Ok. But anyway, actually readdir() uses the direntry sequential number 
as the 32-bit cookie for seek(). So, I don't see how 31-bit hash helps 
here. If you would use the hash value as the seek()/readdir() opaque 
cookie, I could have understood this.

> HASHED_DIR_PLUGIN_ID composes entry key in more complicated manner. It
> has lexicographic component (15 chars) + 64 bit hash or next 8 chars of
> name. It can also involve fibration plugin to group names withint a
> directory somehow: for instance *.c files first, then *.h, than *.o.
Yes, sure. Again, the direntry sequential number is used for 
readdir()/seek() etc. The same as in case of  SEEKABLE_HASHED_DIR_PLUGIN_ID.

So, both are seekable. In both cases the mechanism is the same. Whh one 
is SEEKABLE, another is not ?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
