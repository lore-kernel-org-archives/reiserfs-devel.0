From: "Yurick A. Zaitsev" <yurick@oblik.dp.ua>
Subject: Re[2]: reiserfsck --rebuild-tree fails
Date: Mon, 8 Jul 2002 18:00:45 +0300 (EEST)
Message-ID: <Pine.LNX.4.44.0207081754530.854-100000@dino.oblik.dp.ua>
References: <20020708153140.A2245@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10926-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020708153140.A2245@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com


OD> >    Pass 1 (will try to insert 21881 leaves):
OD> >    ####### Pass 1 #######
OD> >    Looking for allocable blocks .. ok
OD> >    0%.build_the_tree: nothing but leaves are expected. Block 9938 - ??
OD> >    ...20%....40%....
OD> >    mark_block_used: (448579) used already
OD>
OD> This one is very clear sign of broken memory or broken data exchange between
OD> HDD and the box itself.
OD> Try changing IDE cable/replacing memory/putting the HDD into other box.
    Thank you, I've tried other box and it helps. I am believe in reiserfs
again! :)
    Wouldn't be better to add advice about possible broken hardware to
reiserfsck when it prints such message?


