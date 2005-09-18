From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Sun, 18 Sep 2005 12:55:50 +0400
Message-ID: <432D2B96.3080703@yandex.ru>
References: <432AFB44.9060707@namesys.com>	 <200509171356.14497.vda@ilport.com.ua>	 <200509171415.50454.vda@ilport.com.ua>	 <200509180934.50789.chriswhite@gentoo.org> <194f625505091801231f54980@mail.gmail.com> <432D2B26.1070909@mch.one.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26026-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <432D2B26.1070909@mch.one.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tomasz Chmielewski <mangoo@mch.one.pl>
Cc: linuxhippy@gmail.com, reiserfs-list@namesys.com

Tomasz Chmielewski wrote:
> and the only other Linux fs with write mode that has compression is 
> patched ext2 (which is also not included in the kernel, and has some 
> problems) - well, there is also jffs2 with limits of 4 GB partition, so 
> not really useful for storing bigger amounts of data.
Well, don't include JFFS2 here :-) Although it supports compression it 
is useless with disks, and not only because of the 4GB limit. :-)

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
