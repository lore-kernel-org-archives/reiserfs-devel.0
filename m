From: "Raymond A. Meijer" <rmeijer@internet.gr>
Subject: Snapshot 2004.07.13 build problems (was: Re: fsck.reiser4 segfaults)
Date: Thu, 15 Jul 2004 16:11:48 +0300
Message-ID: <200407151611.48897.rmeijer@internet.gr>
References: <200407151559.41256.kos@supportwizard.com> <200407151621.44263.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19633-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200407151621.44263.vitaly@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Thu 15 July 2004 15:21, Vitaly Fertman wrote:

Hi,

> would you try the latest reiser4progs from
> www.namesys.com/snapshots/2004.07.13-internal.testing/

I'm trying to compile it too, after applying the
reiser4progs-0.5.6-libaux-gauge.c.diff patch, but it doesn't compile:

 gcc -DHAVE_CONFIG_H -I. -I. -I.. -I../include -D_REENTRANT -D_FILE_OFFSET_BITS=64 -DENABLE_SYMLINKS -DENABLE_SPECIAL -DENABLE_R5_HASH -DENABLE_FNV1_HASH -DENABLE_RUPASOV_HASH -DENABLE_TEA_HASH -DENABLE_DEG_HASH -DENABLE_LARGE_KEYS -DENABLE_SHORT_KEYS -DENABLE_DOT_O_FIBRE -DENABLE_EXT_1_FIBRE -DENABLE_EXT_3_FIBRE -DENABLE_LEXIC_FIBRE -O3 -W -Wall -Wuninitialized -Wno-unused-parameter -Wredundant-decls -MT librepair_la-filter.lo -MD -MP -MF .deps/librepair_la-filter.Tpo -c filter.c  -fPIC -DPIC -o .libs/librepair_la-filter.o
filter.c: In function `cb_gauge_tree_percent':
filter.c:61: warning: implicit declaration of function `aal_gauge_set_value'
filter.c: In function `repair_filter_node_check':
filter.c:343: warning: implicit declaration of function `aal_gauge_set_data'
filter.c: In function `repair_filter':
filter.c:656: warning: passing arg 1 of `aal_gauge_create' makes integer from pointer without a cast
filter.c:656: error: too many arguments to function `aal_gauge_create'
make[2]: *** [librepair_la-filter.lo] Error 1
make[2]: Leaving directory `/usr/src/Reiser4/reiser4progs-0.5.6/librepair'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/usr/src/Reiser4/reiser4progs-0.5.6'
make: *** [all] Error 2

Do you need more info about my system? It's running 2.6.7-cko6, and libaal
compiled and installed cleanly.


Thanks,

Ray
