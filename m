From: Vince <fuzzy77@free.fr>
Subject: Re: status of grub reiser4 support ?
Date: Mon, 15 Mar 2004 21:39:35 +0100
Message-ID: <40561487.5070503@free.fr>
References: <405597B6.1000906@free.fr> <200403151715.50569.vitaly@namesys.com> <4055DF50.4030105@free.fr> <40560FF4.6050600@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17229-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40560FF4.6050600@free.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: Reiserfs mail-list <Reiserfs-List@namesys.com>

Debugging symbols in libreiser4 (0.5.1) gave me:

Program received signal SIGSEGV, Segmentation fault.
0x0806204a in reiser4_item_units (place=0x400801ac) at item.c:14
14              if (place->plug->o.item_ops->balance->units) {

Here follows a backtrace, more information is available on request...

(gdb) bt
#0  0x0806204a in reiser4_item_units (place=0x400801ac) at item.c:14
#1  0x0805fed6 in tree_find_child_pos (tree=0x4007d7e8, 
parent=0x4007f0c0, child=0x400801a0, place=0x400801ac) at tree.c:275
#2  0x0805ff1e in reiser4_tree_rebind_node (tree=0x4007d7e8, 
parent=0x4007f0c0, child=0x400801a0) at tree.c:290
#3  0x0806001b in reiser4_tree_connect_node (tree=0x4007d7e8, 
parent=0x4007f0c0, node=0x400801a0) at tree.c:415
#4  0x080602b3 in reiser4_tree_load_node (tree=0x4007d7e8, 
parent=0x4007f0c0, blk=6236949) at tree.c:579
#5  0x080603b5 in reiser4_tree_child_node (tree=0x4007d7e8, 
place=0x4007ca58) at tree.c:638
#6  0x0806109c in reiser4_tree_lookup (tree=0x4007d7e8, hint=0x4007c8c0, 
bias=FIND_EXACT, place=0x4007ca58) at tree.c:1905
#7  0x0806223a in callback_find_statdata (track=0x0, entry=0x0, 
data=0x4007ca50) at semantic.c:43
#8  0x08062c7e in aux_parse_path (path=0x4008fdc7 "/", 
pre_func=0x80621e4 <callback_find_statdata>,
     post_func=0x806245d <callback_find_entry>, data=0x4007ca50) at aux.c:92
#9  0x08062696 in reiser4_semantic_resolve (tree=0x4007d7e8, 
path=0x4008fdc7 "/", from=0x4007d7f4, follow=1) at semantic.c:207
#10 0x08061707 in reiser4_object_resolve (object=0x4007e070, 
tree=0x4007d7e8, path=0x4008fdc7 "/", follow=1) at object.c:105
#11 0x080617a1 in reiser4_object_open (tree=0x4007d7e8, path=0x4008fdc7 
"/", follow=1) at object.c:136
#12 0x0805226b in reiser4_dir (dirname=0x4008fdc7 "/") at fsys_reiser4.c:178
#13 0x0804e04d in dir (dirname=0x400801ac "") at disk_io.c:1730
#14 0x0804d8c8 in print_completions (is_filename=1, is_completion=1) at 
disk_io.c:1436
#15 0x0804b3f6 in real_get_cmdline (prompt=0x8072b40 "grub> ", 
cmdline=0x4002bc60 "", maxlen=1600, echo_char=0, readline=1)
     at char_io.c:638
#16 0x0804b778 in get_cmdline (prompt=0x8072b40 "grub> ", 
cmdline=0x4002bc60 "", maxlen=0, echo_char=0, readline=0)
     at char_io.c:872
#17 0x0805c45c in enter_cmdline (heap=0x4002bc60 "", forever=1) at 
cmdline.c:143
#18 0x08056372 in cmain () at stage2.c:1018
#19 0x0804c052 in init_bios_info () at common.c:323
#20 0x08049808 in doit.0 () at asmstub.c:129
#21 0x08049900 in grub_stage2 () at asmstub.c:186
#22 0x080495e8 in main (argc=1, argv=0xbffff9d4) at main.c:264

