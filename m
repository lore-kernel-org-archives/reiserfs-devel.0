From: Vince <fuzzy77@free.fr>
Subject: Re: status of grub reiser4 support ?
Date: Tue, 16 Mar 2004 12:24:11 +0100
Message-ID: <4056E3DB.7070206@free.fr>
References: <405597B6.1000906@free.fr> <40561487.5070503@free.fr> <40561583.8050705@free.fr> <200403161237.44869.vitaly@namesys.com> <4056DD84.2010107@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17243-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4056DD84.2010107@free.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: Reiserfs mail-list <Reiserfs-List@namesys.com>

Another backtrace for the second point (looks like the same bug):

> 2) attempting to install grub on a reiser4 partition results in a 
> segmentation fault 

grub> root (hd1,0)
  Filesystem type is reiser4, partition type 0x83
 

grub> setup (hd1)
Program received signal SIGSEGV, Segmentation fault.
0x0806408f in extent40_offset (place=0x4007c930, pos=4294967295) at 
extent40.c:41
41                      blocks += et40_get_width(extent);
(gdb) bt
#0  0x0806408f in extent40_offset (place=0x4007c930, pos=4294967295) at 
extent40.c:41
#1  0x0806922d in body40_get_key (place=0x4007c930, pos=4294967295, 
key=0x4007c850, trans_func=0x8064062 <extent40_offset>)
     at body40.c:20
#2  0x080640e9 in extent40_fetch_key (place=0x4007c930, key=0x4007c850) 
at extent40.c:52
#3  0x080642a3 in extent40_read_units (place=0x4007c930, 
hint=0x4007ca30) at extent40.c:510
#4  0x0806114d in reiser4_tree_read (tree=0x4007d7e8, place=0x4007c930, 
hint=0x4007ca30) at tree.c:1922
#5  0x08062a3b in reiser4_flow_read (tree=0x4007d7e8, hint=0x4007ca30) 
at flow.c:86
#6  0x0805f227 in tree_read (tree=0x4007d7e8, hint=0x4007ca30) at 
libreiser4.c:79
#7  0x08066ef5 in obj40_read (obj=0x40081448, hint=0x4007ca30) at 
obj40.c:657
#8  0x080672c1 in reg40_read (entity=0x40081448, buff=0x4007cb90, n=10) 
at reg40.c:120
#9  0x08061ad9 in reiser4_object_read (object=0x4007e070, 
buff=0x4007cb90, n=10) at object.c:660
#10 0x0805218d in reiser4_read (buf=0x40415ffc "", len=1078026236) at 
fsys_reiser4.c:130
#11 0x0804df97 in grub_read (buf=0x4007cb90 " ", len=10) at disk_io.c:1693
#12 0x080539fe in gunzip_test_header () at gunzip.c:333
#13 0x0804dd0a in grub_open (filename=0x4007ce80 "/boot/grub/stage2") at 
disk_io.c:1591
#14 0x0805ad22 in check_file.8 () at builtins.c:3956
#15 0x0805b12a in setup_func (arg=0x0, flags=1) at builtins.c:4124
#16 0x0805c4ed in enter_cmdline (heap=0x4002bc60 "setup (hd1)", 
forever=1) at cmdline.c:172
#17 0x08056396 in cmain () at stage2.c:1018
#18 0x0804c052 in init_bios_info () at common.c:323
#19 0x08049808 in doit.0 () at asmstub.c:129
#20 0x08049900 in grub_stage2 () at asmstub.c:186
#21 0x080495e8 in main (argc=1, argv=0xbffff9d4) at main.c:264
