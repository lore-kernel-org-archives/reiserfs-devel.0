From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
Subject: Re: Reiser4 + seekdir()
Date: Mon, 27 Jun 2005 17:53:36 +0400
Message-ID: <42C004E0.5060405@yandex.ru>
References: <42BFC6B0.7040202@yandex.ru>	 <1119872500.4257.260.camel@tribesman.namesys.com>	 <42BFEC62.1010907@yandex.ru>	 <1119875956.4256.277.camel@tribesman.namesys.com>	 <42BFF7D3.3010206@yandex.ru> <1119880168.4257.326.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24701-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1119880168.4257.326.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com

Vladimir Saveliev wrote:
> I think from the beginning HASHED_DIR_PLUGIN_ID was not supposed to be
> seekable. It changed later, HASHED_DIR_PLUGIN_ID became both seekable
> and default in reiser4.
Well, this what I suspected... Would be nice to rename the plugins and 
add more comments..

Thanks.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
