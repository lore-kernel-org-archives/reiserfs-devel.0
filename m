From: Vince <fuzzy77@free.fr>
Subject: fsck.reiser4 1.0.0, segmentation fault
Date: Thu, 12 Aug 2004 23:07:15 +0200
Message-ID: <411BDC03.3090105@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------050908090801010707090904"
Return-path: <reiserfs-list-return-20244-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com, vitaly@namesys.com

--------------050908090801010707090904
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I got a segmentation fault while converting my reiser4 partition to the 
new format:

1) I first launched "debugfs.reiser4 -C /mydevice"

(sidenote: il looks like the conversion requires really a lot -- too 
much ? -- memory. It ate up to 450MB in my case and I had to shut down 
almost all my running programs in order for it to finish...)

2) fsck.reiser4 asks to do a --build-fs and then fails with a 
segmentation fault:
---------------------------------------------------------------------
[...]
INSERTING UNCONNECTED NODES
1. Twigs: done
2. Twigs by item: done
3. Leaves: done
4. Leaves by item: done
         Twigs: read 0, inserted 0, by item 0, empty 0
         Leaves: read 0, inserted 0, by item 0
         Time interval: Thu Aug 12 23:00:11 2004 - Thu Aug 12 23:00:11 2004
CHECKING SEMANTIC TREE
FSCK: Node (8803157), item (4), [d43d0:6d6174685f696e:d447b] (stat40): wrong
size (12478), Fixed to (16384).
[=================================================- ] 99%zsh: 
segmentation fault  fsck.reiser4 --build-fs /dev/hdc3
----------------------------------------------------------------------

I'm attaching a gdb backtrace of this failure (and can send the packed 
metadata on request).

With best regards,

  Vince

--------------050908090801010707090904
Content-Type: text/x-log;
 name="gdb.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="gdb.log"

#0  0x00000000 in ?? ()
#1  0x08051a02 in reiser4_tree_scan (tree=0x809c630, pre_func=0, 
    func=0x807c0a0 <cb_tree_scan>, data=0xbffff6f0) at tree.c:3201
#2  0x0807cc3e in repair_semantic (sem=0xbffff6f0) at semantic.c:852
#3  0x080772ad in repair_check (repair=0xbffff9a0) at repair.c:744
#4  0x0804a5b7 in main (argc=135333008, argv=0x8110490) at fsck.c:518
#0  0x00000000 in ?? ()
No symbol table info available.
#1  0x08051a02 in reiser4_tree_scan (tree=0x809c630, pre_func=0, 
    func=0x807c0a0 <cb_tree_scan>, data=0xbffff6f0) at tree.c:3201
	place = {pos = {item = 0, unit = 4294967295}, node = 0x8110490, 
  body = 0x810e47c, len = 8, key = {plug = 0x808c860, body = {657, 0, 42, 0}, 
    adjust = 0}, plug = 0x0}
	hint = {key = 0xbffff600, level = 1 '\001', collision = 0, hint = 0x0}
	lookup = 135333008
	key = {plug = 0x808c860, body = {0, 0, 0, 0}, adjust = 1134608272}
	max = {plug = 0x808c860, body = {18446744073709551615, 
    18446744073709551615, 18446744073709551615, 18446744073709551615}, 
  adjust = 0}
	res = -4611695982616181616
#2  0x0807cc3e in repair_semantic (sem=0xbffff6f0) at semantic.c:852
	tree = (reiser4_tree_t *) 0x809c630
	res = 0
#3  0x080772ad in repair_check (repair=0xbffff9a0) at repair.c:744
	control = {repair = 0xbffff9a0, bm_used = 0x0, bm_leaf = 0x0, 
  bm_twig = 0x0, bm_met = 0x0, bm_scan = 0x0, bm_alloc = 0x809c7b8, 
  check_node = 1, oid = 0, files = 95921}
	filter = {repair = 0xbffff9a0, bm_used = 0x809c718, 
  bm_leaf = 0x809c758, bm_twig = 0x809c738, bm_met = 0x809c778, stat = {
    read_nodes = 66432, good_nodes = 66432, good_leaves = 65143, 
    good_twigs = 1269, fixed_nodes = 0, fixed_leaves = 0, fixed_twigs = 0, 
    bad_nodes = 0, bad_leaves = 0, bad_twigs = 0, bad_dk_nodes = 0, 
    bad_dk_leaves = 0, bad_dk_twigs = 0, bad_ptrs = 0, files = 0xbffff928, 
    tmp = 0, time = 1092343564}, check_node = 0xbffff91c, oid = 0, 
  cur_node = 0x0, gauge = 0x809c7a8, flags = 0, level = 4 '\004'}
	ds = {repair = 0xbffff9a0, bm_scan = 0x809c798, bm_met = 0x809c778, 
  bm_leaf = 0x809c758, bm_twig = 0x809c738, stat = {read_nodes = 0, 
    good_nodes = 0, good_leaves = 0, good_twigs = 0, fixed_nodes = 0, 
    fixed_leaves = 0, fixed_twigs = 0, files = 0xbffff928, tmp = 0, 
    time = 1092343567}, check_node = 0xbffff91c}
	ts = {repair = 0xbffff9a0, bm_used = 0x0, bm_twig = 0x809c738, 
  bm_met = 0x809c778, stat = {read_twigs = 0, fixed_twigs = 0, 
    bad_unfm_ptrs = 0, time = 1092343567}}
	am = {repair = 0xbffff9a0, bm_used = 0x809c718, bm_twig = 0x809c738, 
  bm_leaf = 0x809c758, stat = {read_leaves = 0, by_leaf = 0, 
    by_item_leaves = 0, read_twigs = 0, by_twig = 0, by_item_twigs = 0, 
    empty = 0, files = 0xbffff928, time = 1092343569}, gauge = 0x809c7e8}
	sem = {repair = 0xbffff9a0, root = 0x0, lost = 0x80a6be8, stat = {
    reached_files = 95920, lost_files = 0, shared = 0, rm_entries = 0, 
    broken = 0, oid = 1212035, statdatas = 95920, files = 95921, 
    time = 1092343569}, gauge = 0x809c7d8}
	cleanup = {repair = 0x0, neigh = {pos = {item = 0, unit = 0}, 
    node = 0x0, body = 0x0, len = 0, key = {plug = 0x0, body = {0, 0, 0, 0}, 
      adjust = 0}, plug = 0x0}, stat = {removed = 0, linked = 0, time = 0}, 
  gauge = 0x0, cur_place = 0x0}
	res = 0
#4  0x0804a5b7 in main (argc=135333008, argv=0x8110490) at fsck.c:518
	fsck_ops = {open = 0x807f460 <file_open>, 
  read = 0x807f550 <file_read>, write = 0x807f690 <file_write>, 
  sync = 0x807f7d0 <file_sync>, equals = 0x807f860 <file_equals>, 
  len = 0x807f8c0 <file_len>, close = 0x807f510 <file_close>}
	device = (aal_device_t *) 0x809ba30
	repair = {fs = 0x809bca8, fatal = 0, fixable = 0, sb_fixable = 0, 
  mode = 3 '\003', debug_flag = 0 '\0', bitmap_file = 0x0}
	parse_data = {sb_mode = 1 '\001', fs_mode = 3 '\003', 
  logfile = 0x80987b8, backup = 0x0, backup_file = 0x0, bitmap_file = 0x0, 
  host_device = 0x809ba30, options = 0}
	ex = 0
	stage = 1
	res = 0
The program is running.  Exit anyway? (y or n) 
--------------050908090801010707090904--
