From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Sun, 18 Sep 2005 13:18:42 +0400
Message-ID: <432D30F2.1060206@yandex.ru>
References: <432AFB44.9060707@namesys.com>	 <200509171356.14497.vda@ilport.com.ua>	 <200509171415.50454.vda@ilport.com.ua>	 <200509180934.50789.chriswhite@gentoo.org> <194f625505091801231f54980@mail.gmail.com> <432D2B26.1070909@mch.one.pl> <432D2B96.3080703@yandex.ru> <432D2DE9.4070209@mch.one.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26028-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <432D2DE9.4070209@mch.one.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tomasz Chmielewski <mangoo@mch.one.pl>
Cc: linuxhippy@gmail.com, reiserfs-list@namesys.com

Tomasz Chmielewski wrote:
> and, as any other filesystem, can be used with disks or even kept in 
> RAM, it's just an image, right? but what fun is it to have fifty 4 GB 
> "partitions"? :)
> 
JFFS2 is for flashes, flashes are not block devices, they have another 
usage model. You formally may use JFFS2 on disks, yes, but only because 
of an inefficient translation layer (mtdblock).

And the fun to have fifty 4GB partitions will be:
1. Enormous RAM consumption (I guess JFFS2 will eat _at least_ 512MB of 
RAM).
2. Utter slowness.
3. You will grow old while you'll mount your partitions :-)
4. You will loose your data on each unclean reboot (power crash).
5. I bet the real limit is 2GB :-)

Note, 4 is owing to the mentioned translation layer, JFFS2 itself is 
very unclean reboot - tolerant.

Funny? :-)

So, formally you're right, no doubts. That is just for information :-)

Anyway, this is off-topic. Hmm, somebody excluded LKML from CC earlier 
(that's no good). I won't include it here, but the next non-off-topic 
writer ought to do it.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
