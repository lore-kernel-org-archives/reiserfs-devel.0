From: Konstantin Sobolev <kos@supportwizard.com>
Subject: reiser4 OOPS on amd x2
Date: Fri, 23 Dec 2005 19:57:38 +0300
Message-ID: <20051223165738.GA8159@kos.local>
Reply-To: kos@supportwizard.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="UlVJffcvxoiEqYs2"
Return-path: <reiserfs-list-return-27499-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I've been using reiser4 on single-core amd64 for a long time and had no 
major problems, only a few corruptions detected every 2-3 months which 
is an acceptable speed tradeoff for me. Several days ago I've upraded to 
amd x2 and rebuild the kernel with SMP support. Everything was fine, 
reiser4 sustained high load for a couple of days, but yesterday I got an 
OOPS while running very I/O intensive processes:

Unable to handle kernel NULL pointer dereference at 0000000000000280 RIP: 
<ffffffff8804b400>{:reiser4:get_tree+0}
PGD 7a8f3067 PUD 7dbf2067 PMD 0 
Oops: 0000 [1] PREEMPT SMP 
CPU 1 
Modules linked in: it87 hwmon_vid eeprom i2c_isa iptable_nat ipt_REJECT iptable_filter ipt_MARK ipt_owner iptable_mangle ip_tables snd_pcm_oss snd_mixer_oss snd_seq_oss snd_seq_midi_event snd_seq snd_seq_device eth1394 uhci_hcd usbhid ohci1394 ieee1394 usblp 8139too usb_storage nvidia snd_intel8x0 snd_ac97_codec snd_ac97_bus snd_pcm snd_timer snd snd_page_alloc ehci_hcd ohci_hcd i2c_nforce2 usbcore nls_koi8_r ntfs reiser4 zlib_deflate ip_nat_irc ip_conntrack_irc ip_nat_ftp ip_nat ip_conntrack_ftp ip_conntrack cpufreq_ondemand powernow_k8 freq_table nls_cp866
Pid: 8917, comm: mysqld Tainted: P      2.6.14-archck5 #3
RIP: 0010:[<ffffffff8804b400>] <ffffffff8804b400>{:reiser4:get_tree+0}
RSP: 0018:ffff810075781620  EFLAGS: 00010206
RAX: 0000000049b00000 RBX: ffff81006774f850 RCX: ffff81006774f850
RDX: ffff81007ffbe000 RSI: 00000000000000d0 RDI: 0000000000000000
RBP: ffff810075781978 R08: ffff810021db8000 R09: 0000000000000026
R10: 0000000000000026 R11: ffffffff88063970 R12: ffff810073f93080
R13: ffff810075781a88 R14: 0000000000000003 R15: ffff810070529a00
FS:  0000000041802960(0063) GS:ffffffff804ad880(0000) knlGS:00000000ae102bb0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000280 CR3: 000000007aa01000 CR4: 00000000000006e0
Process mysqld (pid: 8917, threadinfo ffff810075780000, task ffff81007efae380)
Stack: ffffffff88071282 ffff81006117c1c0 ffffffff8806eda9 ffff810075781a68 
       ffffffff88073cd1 0000000020308e24 ffffffff8806eda9 0000000000000000 
       0000000000049b00 0000000049b00000 
Call Trace:<ffffffff88071282>{:reiser4:write_extent+194} <ffffffff8806eda9>{:reiser4:nr_units_extent+9}
       <ffffffff88073cd1>{:reiser4:item_length_by_coord+17}
       <ffffffff8806eda9>{:reiser4:nr_units_extent+9} <ffffffff88063de7>{:reiser4:lookup_node40+1079}
       <ffffffff88033733>{:reiser4:jload_gfp+499} <ffffffff880480a5>{:reiser4:cbk_node_lookup+805}
       <ffffffff88063962>{:reiser4:plugin_by_coord_node40+50}
       <ffffffff88073c61>{:reiser4:obtain_item_plugin+17} <ffffffff88073d52>{:reiser4:unit_key_by_coord+34}
       <ffffffff880639a5>{:reiser4:key_at_node40+53} <ffffffff880639a5>{:reiser4:key_at_node40+53}
       <ffffffff880550f1>{:reiser4:leftmost_key_in_node+49}
       <ffffffff88048cf9>{:reiser4:coord_by_handle+2953} <ffffffff8028dab1>{__make_request+1249}
       <ffffffff88049024>{:reiser4:coord_by_key+196} <ffffffff8806eda9>{:reiser4:nr_units_extent+9}
       <ffffffff880707eb>{:reiser4:extent_readpage_filler+219}
       <ffffffff88070710>{:reiser4:extent_readpage_filler+0}
       <ffffffff88070710>{:reiser4:extent_readpage_filler+0}
       <ffffffff8015fb1b>{read_cache_pages+139} <ffffffff8015d2f2>{buffered_rmqueue+594}
       <ffffffff8804f89b>{:reiser4:reiser4_readpages+123} <ffffffff8015fd2a>{__do_page_cache_readahead+378}
       <ffffffff88048f1d>{:reiser4:object_lookup+253} <ffffffff8016000d>{blockable_page_cache_readahead+109}
       <ffffffff801602b0>{page_cache_readahead+384} <ffffffff88070ac1>{:reiser4:read_extent+321}
       <ffffffff8805b087>{:reiser4:read_unix_file+871} <ffffffff8017aa56>{vfs_read+230}
       <ffffffff8017af44>{sys_pread64+100} <ffffffff8010dd36>{system_call+126}
       

Code: 48 8b 87 80 02 00 00 48 83 c0 20 c3 66 66 66 90 31 d2 48 85 
RIP <ffffffff8804b400>{:reiser4:get_tree+0} RSP <ffff810075781620>
CR2: 0000000000000280
 <1>Unable to handle kernel NULL pointer dereference at 0000000000000070 RIP: 
<ffffffff8804073d>{:reiser4:try_capture+429}
PGD 7a8f3067 PUD 7dbf2067 PMD 0 
Oops: 0000 [2] PREEMPT SMP 
CPU 1 
Modules linked in: it87 hwmon_vid eeprom i2c_isa iptable_nat ipt_REJECT iptable_filter ipt_MARK ipt_owner iptable_mangle ip_tables snd_pcm_oss snd_mixer_oss snd_seq_oss snd_seq_midi_event snd_seq snd_seq_device eth1394 uhci_hcd usbhid ohci1394 ieee1394 usblp 8139too usb_storage nvidia snd_intel8x0 snd_ac97_codec snd_ac97_bus snd_pcm snd_timer snd snd_page_alloc ehci_hcd ohci_hcd i2c_nforce2 usbcore nls_koi8_r ntfs reiser4 zlib_deflate ip_nat_irc ip_conntrack_irc ip_nat_ftp ip_nat ip_conntrack_ftp ip_conntrack cpufreq_ondemand powernow_k8 freq_table nls_cp866
Pid: 20006, comm: mysqld Tainted: P      2.6.14-archck5 #3
RIP: 0010:[<ffffffff8804073d>] <ffffffff8804073d>{:reiser4:try_capture+429}
RSP: 0018:ffff810006c41a98  EFLAGS: 00010293
RAX: ffff810021f82820 RBX: ffff81000db23d80 RCX: ffff81006774f8a8
RDX: ffff81006774f8a8 RSI: 0000000000000002 RDI: 0000000000000000
RBP: ffff810013d726c0 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000000 R12: 0000000000000008
R13: ffff81004d9cdc40 R14: fffffffffffffff8 R15: 0000000000000000
FS:  000000004398e960(0063) GS:ffffffff804ad880(0000) knlGS:00000000a3c72bb0
CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
CR2: 0000000000000070 CR3: 000000007aa01000 CR4: 00000000000006e0
Process mysqld (pid: 20006, threadinfo ffff810006c40000, task ffff810021f82820)
Stack: 0000000000000001 ffff810013d72788 ffff810013d72770 ffffffff88073cb1 
       0000000006c41b48 ffff81006774f8a8 000000017aa4c410 0000000200000000 
       0000000000000000 00000000fffffe09 
Call Trace:<ffffffff88073cb1>{:reiser4:item_body_by_coord_hard+17}
       <ffffffff88038fc6>{:reiser4:longterm_lock_znode+870}
       <ffffffff8804d205>{:reiser4:lock_neighbor+197} <ffffffff8804d344>{:reiser4:reiser4_get_parent_flags+84}
       <ffffffff88045301>{:reiser4:flush_current_atom+2209}
       <ffffffff8805a639>{:reiser4:writepages_unix_file+2089}
       <ffffffff8803f1c9>{:reiser4:txn_end+409} <ffffffff8803f599>{:reiser4:txn_restart+9}
       <ffffffff8803f633>{:reiser4:force_commit_atom_nolock+99}
       <ffffffff8803fb94>{:reiser4:sync_atom+84} <ffffffff88059da8>{:reiser4:commit_file_atoms+392}
       <ffffffff8805a6df>{:reiser4:sync_unix_file+63} <ffffffff801588d4>{__filemap_fdatawrite_range+148}
       <ffffffff8017c96e>{do_fsync+190} <ffffffff8010dd36>{system_call+126}
       

Code: 49 8b 7e 78 e8 aa a9 2f f8 85 c0 0f 84 ac 00 00 00 49 8b 7e 
RIP <ffffffff8804073d>{:reiser4:try_capture+429} RSP <ffff810006c41a98>
CR2: 0000000000000070
 <6>note: mysqld[20006] exited with preempt_count 4





After rebooting (with sync+unmount using magic SysRQ) I've checked the filesystem, here's the report:

FSCK: Node (15064625), item (0), [29:1(SD):0:2a:0]: does not look like a valid SD plugin set extention: wrong pset member count detected (12). 
FSCK: Node (15064625), item (0), [29:1(SD):0:2a:0]: does not look like a valid stat data. 
FSCK: Node (15064625), item (0), [29:1(SD):0:2a:0]: broken item found. Remove it. 
FSCK: Node (15064625): The left delimiting key [2a:0(NAME):0:0:0] in the parent node (15064624), pos (0/4294967295) does not match the first key 
[29:1(SD):0:2a:0] in the node. Fixed. 
FSCK: Node (11514349), item (0): 1 mergable units were found in the extent40 unit. Fixed. 
FSCK: Failed to recognize the plugin for the directory [29:0:2a]. 
FSCK: Trying to recover the directory [29:0:2a] with the default plugin--dir40. 
FSCK: The file [29:0:2a] does not have a StatData item. Creating a new one. Plugin dir40. 
FSCK: Node (15064625), item (0), [29:0:2a] (stat40): wrong size (0), Fixed to (14). 
FSCK: Node (15064625), item (0), [29:0:2a] (stat40): wrong bytes (0), Fixed to (700). 

reiser4 code is from the 2.6.14-archck5 kernel which, according to it's 
homepage, uses reiser4 from 2.6.14-rc5-mm1 with some additional fixes.

my .config is attached.

-- 
/KoS
* Frontpage, allowing more people who can't design to be on the web.

--UlVJffcvxoiEqYs2
Content-Type: application/x-gunzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--UlVJffcvxoiEqYs2--
