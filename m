From: "E.Gryaznova" <grev@namesys.com>
Subject: Re: Compile error 2.6.9
Date: Tue, 02 Nov 2004 03:35:46 +0300
Message-ID: <4186D662.7080407@namesys.com>
References: <NDBBKABJBJCIJNAELLKEEEEJJEAA.jimm@simutronics.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22247-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <NDBBKABJBJCIJNAELLKEEEEJJEAA.jimm@simutronics.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: jimm@simutronics.com
Cc: reiserfs-list@namesys.com

Jim Miller wrote:

>I got the follow errors while compiling 2.6.9 linux kernel.  I followed
>these dirs:
>1. get 2.6.9 (ftp.kernel.org:/pub/linux/kernel/v2.6/linux-2.6.9.tar.gz)
>	tar zxf linux-2.6.9.tar.gz -C /usr/src
>2. get reiser4 core patches:
>	ftp.namesys.com:/pub/reiser4-for-2.6.9/2.6.9.diff
>	cd /usr/src/linux-2.6.9
>	cat 2.6.9.diff | patch -p1
>3. add reiser4 to linux-2.6.9
>	ftp.namesys.com:/pub/reiser4-for-2.6.9/reiser4.tar.bz2
>	cd /usr/src/linux-2.6.9/fs
>	tar jxf reiser4.tar.bz2
>4. patch reiser4 to match 2.6.9
>	ftp.namesys.com:/pub/reiser4-for-2.6.9/reiser4-for-2.6.9.diff
>	cd /usr/src/linux-2.6.9
>	cat reiser4-for-2.6.9.diff | patch -p1
>
>All of the patches applied successfully.  Any suggestions would be
>appreciated.
>
>  CC      fs/reiser4/plugin/cryptcompress.o
>fs/reiser4/plugin/cryptcompress.c: In function `inflate_cluster':
>fs/reiser4/plugin/cryptcompress.c:1018: parse error before `*'
>fs/reiser4/plugin/cryptcompress.c:1019: `cplug' undeclared (first use in
>this function)
>fs/reiser4/plugin/cryptcompress.c:1019: (Each undeclared identifier is
>reported only once
>fs/reiser4/plugin/cryptcompress.c:1019: for each function it appears in.)
>make[3]: *** [fs/reiser4/plugin/cryptcompress.o] Error 1
>make[2]: *** [fs/reiser4] Error 2
>make[1]: *** [fs] Error 2
>make[1]: Leaving directory `/usr/src/linux-2.6.9'
>make: *** [stamp-build] Error 2
>
>
>
>
>Thanks,
>Jim
>
Hello,
would you please send me your config file?

Thanks,
Lena

