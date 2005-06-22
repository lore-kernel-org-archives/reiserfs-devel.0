From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
Subject: Re: reiser4 plugins
Date: Wed, 22 Jun 2005 19:10:58 +0400
Message-ID: <42B97F82.6040404@yandex.ru>
References: <20050620235458.5b437274.akpm@osdl.org>	 <42B831B4.9020603@pobox.com> <42B87318.80607@namesys.com>	 <20050621202448.GB30182@infradead.org> <42B8B9EE.7020002@namesys.com>	 <20050621181802.11a792cc.akpm@osdl.org> <1119452212.15527.33.camel@server.cs.pocnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24462-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1119452212.15527.33.camel@server.cs.pocnet.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christophe Saout <christophe@saout.de>
Cc: Andrew Morton <akpm@osdl.org>, Hans Reiser <reiser@namesys.com>, hch@infradead.org, jgarzik@pobox.com, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Christophe Saout wrote:
> The plugins that add additional VFS semantics (that are currently
> disable) should most definitely not be implemented only inside the
> filesystem. I think Hans did this because it would have been a lot more
> work doing this at the proper layer (which means talking to people and a
> lot of politics...).
I would even do s/should most definitely not/must not/

More filesystems in future may want to use these semantics. There are 
cases when one can't use Reiser4 to implement them, but instead, need to 
implement another file system with the same semantics.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
