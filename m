From: Ookhoi <ookhoi@humilis.net>
Subject: Re: build problem BK reiser4progs: /usr/include/features.h:218:52: operator '==' has no left operand
Date: Thu, 16 Jan 2003 20:03:05 +0100
Message-ID: <20030116200305.T7526@humilis>
References: <20030116133100.O7526@humilis> <3E26A821.4060006@namesys.com> <20030116140405.P7526@humilis> <3E26B263.2000909@namesys.com> <20030116145519.Q7526@humilis> <3E26BBF8.40003@namesys.com> <20030116190044.R7526@humilis> <3E26F4F3.5080801@namesys.com> <20030116192854.S7526@humilis> <3E26FD74.2080008@namesys.com>
Reply-To: ookhoi@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12408-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E26FD74.2080008@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yury Umanets <umka@namesys.com>
Cc: ookhoi@humilis.net, Reiserfs-List <reiserfs-list@namesys.com>

Yury Umanets wrote (ao):
> Looks like the problem is in line
>
> gcc -g -O2 -D_REENTRANT -D_FILE_OFFSET_BITS=64 -g -W -Wall -Wno-unused
> -Werror -DPLUGIN_DIR=\"/usr/l
> ocal/lib/reiser4\" -o debugfs.reiser4 debugfs.o
> ../../libreiser4/.libs/libreiser4.a ../../progs/lib
> misc/.libs/libmisc.a /usr/src/reiser4progs/libaal/.libs/libaal.a
> -lncurses -lreadline
>
> Your libtool has decided to link all binaries against static library
> ../../libreiser4/.libs/libreiser4.a. This library contains plugins
> code too. But, lnker was unable to find direct links to plugin
> symbols. That is because they do not exist, we're working with plugins
> by means of using interface structs for example, item_ops, which
> contains all methods of corresponding item plugin. So, linker did not
> include plugin symbols into result binary.
>
> The cure ptobably is to install more recent libtool.

Oke, I'll search for a more recent one. I do run an up to date debian
sid (unstable) though. Hm :-)

ookhoi $ libtool --version
ltmain.sh (GNU libtool) 1.4.3 (1.922.2.111 2002/10/23 02:54:36)

I'll report success or failure. Thanks!
