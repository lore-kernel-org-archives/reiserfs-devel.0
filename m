From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: Reiser4 + seekdir()
Date: Wed, 29 Jun 2005 14:22:05 +0400
Message-ID: <1120040525.3860.40.camel@tribesman.namesys.com>
References: <42BFC6B0.7040202@yandex.ru>
	 <1119872500.4257.260.camel@tribesman.namesys.com>
	 <42BFEC62.1010907@yandex.ru>
	 <1119875956.4256.277.camel@tribesman.namesys.com>
	 <42BFF7D3.3010206@yandex.ru>
	 <1119880168.4257.326.camel@tribesman.namesys.com>
	 <42C004E0.5060405@yandex.ru> <42C0588C.7030905@namesys.com>
	 <42C244D8.1070408@yandex.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24791-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42C244D8.1070408@yandex.ru>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

Hello

On Wed, 2005-06-29 at 10:51, Artem B. Bityuckiy wrote:
> Hans Reiser wrote:
> > thanks Artem.  If you are generous enough to help us with those comments
> > and renames, I'll take a patch to do it.  If you are too busy though,
> > vs, can you fix it?
> 
> Hans,
> 
> I may prepare and send a patch once I've realized what is the purpose 
> and function of these two direntry plugins.
> 
> 
> SEEKABLE_HASHED_DIR_PLUGIN_ID and
> 
> The HASHED_DIR_PLUGIN_ID plugin's destination is clear - it is general 
> purpose plugin which should be used in 99% cases except something 
> special is needed. The plugin implies the dentries are roughly 
> alphabetically sorted and go in the same order as stat-data. Fine
> 
> SEEKABLE_HASHED_DIR_PLUGIN_ID - dunno, it it the same as the 
> HASHED_DIR_PLUGIN_ID plugin, but the key assignment algorithm is much 
> simpler. What's the purpose of this plugin? I understand that it used to 
> be mostly seekable while the first one was not seekable when the 
> adjust_dir_pos() feature did not exist. But at the moment, what for is it ?

Existence of various plugins assumes that user is able to choose
whatever is suitable for him. Or create his own plugin if none of
existing ones satisfies him.
If user cares a lot about using telldir/seekdir he is supposed to choose
SEEKABLE_HASHED_DIR_PLUGIN_ID.


