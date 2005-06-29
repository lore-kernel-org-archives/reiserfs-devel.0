From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: Reiser4 + seekdir()
Date: Wed, 29 Jun 2005 15:48:40 +0400
Message-ID: <1120045719.3725.60.camel@tribesman.namesys.com>
References: <42BFC6B0.7040202@yandex.ru>
	 <1119872500.4257.260.camel@tribesman.namesys.com>
	 <42BFEC62.1010907@yandex.ru>
	 <1119875956.4256.277.camel@tribesman.namesys.com>
	 <42BFF7D3.3010206@yandex.ru>
	 <1119880168.4257.326.camel@tribesman.namesys.com>
	 <42C004E0.5060405@yandex.ru> <42C0588C.7030905@namesys.com>
	 <42C244D8.1070408@yandex.ru>
	 <1120040525.3860.40.camel@tribesman.namesys.com>
	 <42C277FF.5070206@yandex.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24793-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42C277FF.5070206@yandex.ru>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

Hello

On Wed, 2005-06-29 at 14:29, Artem B. Bityuckiy wrote:
> Vladimir Saveliev wrote:
> > Existence of various plugins assumes that user is able to choose
> > whatever is suitable for him. Or create his own plugin if none of
> > existing ones satisfies him.
> > If user cares a lot about using telldir/seekdir he is supposed to choose
> > SEEKABLE_HASHED_DIR_PLUGIN_ID.
> Hmm...
> 
> May be I don't understand the difference, but the two plugins are *both* 
> seekable.

HASHED_DIR_PLUGIN_ID's seekableness is a hack, imho. I would prefer if
it just did not support llseek operation.
Name of marco itself is confusing. Names are sorted lexicographically
with fibration, hash is onlyh involved for names longer than 23 chars.

>  Furthermore, AFAICS, it is implemented the same way in both 
> cases. 

It is wrong. SEEKABLE_HASHED_DIR_PLUGIN_ID should return 32 bit hash
value as a position within a direcotry instead of logical number of
entry in it.

> So, why user may prefer SEEKABLE_HASHED_DIR_PLUGIN_ID?

It user wants seekdir/telldir to work properly and does not care about
hash collisions and SEEKABLE_HASHED_DIR_PLUGIN_ID is implemented
properly - this plugin can be used.

Well, I do not know whether it ever will be used.

