From: Joe Cooper <joe@swelltech.com>
Subject: Re: Silly question, defrag
Date: Wed, 03 Apr 2002 02:21:58 -0600
Message-ID: <3CAABBA6.3030101@swelltech.com>
References: <200204030017.12595@X-Message-Flag:>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: matthew@psychohorse.com
Cc: reiserfs-list@namesys.com

"Don't"

;-)

ReiserFS (and ext2|3) do fragment somewhat, but the impact is not worth 
fighting over on most systems (certain environments are impacted more 
than others--mail servers and web caches being two examples that are hit 
pretty hard by fragmentation performance degradation).

Besides, there is no method to defrag ReiserFS that I know of.  Hans 
plans repacking in some future version.  It will be nice, but the whole 
'defrag once a month to keep your computer running smoothly' is kind of 
a Windows thing.  Us Unix users don't really need to think so much on 
those sorts of things.

Matthew Johnson wrote:
> This is kind of a general silly question, but one that crops now and again. 
> Especially from newbies...
> 
> Whats the best, most accurate answer to give to a newbie when they ask how to 
> defrag their hard drive, and does ReiserFS vary in itself with regards to 
> this, with say ext2? Its just a question I sometimes get and wondered the 
> best answer to this.
> 
> Kind regards,
> 
> Matt

-- 
Joe Cooper <joe@swelltech.com>
http://www.swelltech.com
Web Caching Appliances and Support

