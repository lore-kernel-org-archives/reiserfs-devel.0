From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: Reiser4 + seekdir()
Date: Thu, 30 Jun 2005 20:26:33 +0400
Message-ID: <1120148793.3441.82.camel@tribesman.namesys.com>
References: <42BFC6B0.7040202@yandex.ru>
	 <1119872500.4257.260.camel@tribesman.namesys.com>
	 <42BFEC62.1010907@yandex.ru>
	 <1119875956.4256.277.camel@tribesman.namesys.com>
	 <42BFF7D3.3010206@yandex.ru>
	 <1119880168.4257.326.camel@tribesman.namesys.com>
	 <42C004E0.5060405@yandex.ru> <42C0588C.7030905@namesys.com>
	 <42C244D8.1070408@yandex.ru>
	 <1120040525.3860.40.camel@tribesman.namesys.com>
	 <200506291811.j5TIBtLo023155@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24844-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200506291811.j5TIBtLo023155@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Valdis.Kletnieks@vt.edu
Cc: "Artem B. Bityuckiy" <dedekind@yandex.ru>, Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

On Wed, 2005-06-29 at 22:11, Valdis.Kletnieks@vt.edu wrote:
> On Wed, 29 Jun 2005 14:22:05 +0400, Vladimir Saveliev said:
>  
> > Existence of various plugins assumes that user is able to choose
> > whatever is suitable for him. Or create his own plugin if none of
> > existing ones satisfies him.
> > If user cares a lot about using telldir/seekdir he is supposed to choose
> > SEEKABLE_HASHED_DIR_PLUGIN_ID.
> 
> Is that "the user", or "the person building the kernel"?
> 

User. 
In theory, I think, it is supposed to be like that:
user designes his application. He has some requirements to directories
he stores data in. If he is reading reiserfs mailing lists he should be
aware of reiser4 plugins and implement his application so that if
reiser4 is available - he chooses for his directory a plugin with
properties which match his requirements more.
So far, I think you can choose directory plugin on mkfs time. 

