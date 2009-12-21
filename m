From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 14855] New: Reiserproblem
Date: Mon, 21 Dec 2009 11:48:45 GMT
Message-ID: <bug-14855-695@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=14855

           Summary: Reiserproblem
           Product: File System
           Version: 2.5
    Kernel Version: 2.6.26.5
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: ReiserFS
        AssignedTo: reiserfs-devel@vger.kernel.org
        ReportedBy: nerijus.kislauskas@ktu.lt
        Regression: No


Created an attachment (id=24242)
 --> (http://bugzilla.kernel.org/attachment.cgi?id=24242)
Our used kernel config of 2.6.26.5 kernel

A little bit of history:
I use reiserfs on our FTP server for debian, ubuntu mirrors. Every few months I
need to do reiserfsck because of file system corruption. Usualy need to execute
reiserfsck with --rebuild-tree option.

On 19 Dec 2009 server's kernel was not able to produce call's to disk. As I
noticed, kernel.log produces such information:

Dec 19 23:56:56 ftp kernel: [15486951.996884] ------------[ cut here
]------------ 
Dec 19 23:56:56 ftp kernel: [15486951.996884] kernel BUG at
fs/reiserfs/journal.c:532!
Dec 19 23:56:56 ftp kernel: [15486951.996884] invalid opcode: 0000 [#1] SMP     
Dec 19 23:56:56 ftp kernel: [15486951.996884] Modules linked in: qla2xxx        
Dec 19 23:56:56 ftp kernel: [15486951.997036]                                   
Dec 19 23:56:56 ftp kernel: [15486951.997036] Pid: 14237, comm: rsync Tainted:
G        W (2.6.26.5 #2)
Dec 19 23:56:56 ftp kernel: [15486951.997036] EIP: 0060:[<c01b511e>] EFLAGS:
00010246 CPU: 1           
Dec 19 23:56:56 ftp kernel: [15486951.997036] EIP is at
reiserfs_in_journal+0x111/0x137                
Dec 19 23:56:56 ftp kernel: [15486951.997036] EAX: f8ea29fc EBX: 0000180c ECX:
05b31574 EDX: f8e20000  
Dec 19 23:56:56 ftp kernel: [15486951.997036] ESI: cfb2be00 EDI: 05b30000 EBP:
00000005 ESP: e4115aa8  
Dec 19 23:56:56 ftp kernel: [15486951.997036]  DS: 007b ES: 007b FS: 00d8 GS:
0033 SS: 0068            
Dec 19 23:56:56 ftp kernel: [15486951.997036] Process rsync (pid: 14237,
ti=e4114000 task=f54823b0 task.ti=e4114000)
Dec 19 23:56:56 ftp kernel: [15486951.997036] Stack: 00002d98 f8e20000 00001574
00000b66 e4115b8c c81f6ed8 c0194264 00000001 
Dec 19 23:56:56 ftp kernel: [15486951.997506]        e4115ae4 e4115c60 00000b66
f6d54ec0 cfb2be00 f8e1ad98 00000000 00000000 
Dec 19 23:56:56 ftp kernel: [15486951.997506]        00000b66 00000b66 e4115c60
cfb2be00 c0195098 00008000 00000001 00000011 
Dec 19 23:56:56 ftp kernel: [15486951.997884] Call Trace:                       
Dec 19 23:56:56 ftp kernel: [15486951.997884]  [<c0194264>]
scan_bitmap_block+0x127/0x2a1                                    
Dec 19 23:56:56 ftp kernel: [15486951.997884]  [<c0195098>]
reiserfs_allocate_blocknrs+0x470/0xdd5                           
Dec 19 23:56:56 ftp kernel: [15486951.997884]  [<c019d64e>]
reiserfs_get_block+0x304/0x12a8                                  
Dec 19 23:56:56 ftp kernel: [15486951.997884]  [<c01778cd>]
__block_prepare_write+0x1b6/0x374                                
Dec 19 23:56:56 ftp kernel: [15486951.997884]  [<c013aed2>]
add_to_page_cache+0x74/0x7b                                      
Dec 19 23:56:56 ftp kernel: [15486951.997884]  [<c0177b13>]
block_write_begin+0x57/0xea                                      
Dec 19 23:56:56 ftp kernel: [15486951.997884]  [<c019d34a>]
reiserfs_get_block+0x0/0x12a8                                    
Dec 19 23:56:56 ftp kernel: [15486951.997884]  [<c019f7e7>]
reiserfs_write_begin+0xff/0x1ec                                  
Dec 19 23:56:56 ftp kernel: [15486951.997884]  [<c019d34a>]
reiserfs_get_block+0x0/0x12a8                                    
Dec 19 23:56:56 ftp kernel: [15486951.997884]  [<c013b9fb>]
generic_file_buffered_write+0x116/0x63c                          
Dec 19 23:56:56 ftp kernel: [15486951.997884]  [<c01d486f>]
security_inode_need_killpriv+0xc/0xd                             
Dec 19 23:56:56 ftp kernel: [15486951.997884]  [<c013a81e>]
remove_suid+0x15/0x53                                            
Dec 19 23:56:56 ftp kernel: [15486951.997884]  [<c013c1be>]
__generic_file_aio_write_nolock+0x29d/0x555                      
Dec 19 23:56:56 ftp kernel: [15486951.997884]  [<c013c4cb>]
generic_file_aio_write+0x55/0xc5                                 
Dec 19 23:56:56 ftp kernel: [15486951.997884]  [<c017331f>]
__mark_inode_dirty+0x4c/0x14c                                    
Dec 19 23:56:56 ftp kernel: [15486951.997884]  [<c0158cf2>]
do_sync_write+0xd2/0x10e                                         
Dec 19 23:56:56 ftp kernel: [15486951.997884]  [<c016ace7>]
inode_setattr+0x9c/0x16d                                         
Dec 19 23:56:56 ftp kernel: [15486951.997884]  [<c01629cf>]
do_filp_open+0x6e9/0x733                                         
Dec 19 23:56:56 ftp kernel: [15486951.997884]  [<c0129467>]
autoremove_wake_function+0x0/0x37                                
Dec 19 23:56:56 ftp kernel: [15486951.997884]  [<c016af43>]
notify_change+0x18b/0x1b4                                        
Dec 19 23:56:56 ftp kernel: [15486951.997884]  [<c016d3a5>]
mnt_drop_write+0x1d/0xcf                                         
Dec 19 23:56:56 ftp kernel: [15486951.997884]  [<c01d4896>]
security_file_permission+0xc/0xd                                 
Dec 19 23:56:56 ftp kernel: [15486951.997884]  [<c0158e96>]
rw_verify_area+0x5a/0xb5                                         
Dec 19 23:56:56 ftp kernel: [15486951.997884]  [<c0157a1c>]
sys_fchmod+0x3e/0xac                                             
Dec 19 23:56:56 ftp kernel: [15486951.997884]  [<c01a066a>]
reiserfs_file_write+0x0/0x7a                                     
Dec 19 23:56:56 ftp kernel: [15486951.997884]  [<c0159424>] vfs_write+0x79/0xa0 
Dec 19 23:56:56 ftp kernel: [15486951.997884]  [<c0159908>] sys_write+0x41/0x6a 
Dec 19 23:56:56 ftp kernel: [15486951.997884]  [<c0102c3d>]
sysenter_past_esp+0x6a/0x91                                      
Dec 19 23:56:56 ftp kernel: [15486951.997884]  =======================          
Dec 19 23:56:56 ftp kernel: [15486951.997884] Code: d0 31 c3 81 e3 ff 1f 00 00
8b 54 24 04 8b 84 9a 10 01 00 00 85 c0 75 09 eb 15 8b 40 20 85 c0 74 0e 39 48
08 75 f4 3b 70 04 75 ef <0f> 0b eb fe 31 c0 83 c4 08 5b 5e 5f 5d c3 83 c1 01 8b
56 0c c1                                                                        
Dec 19 23:56:56 ftp kernel: [15486951.999884] EIP: [<c01b511e>]
reiserfs_in_journal+0x111/0x137 SS:ESP 0068:e4115aa8                            
Dec 19 23:56:56 ftp kernel: [15486952.005586] ---[ end trace 6c0651af41821b30
]---                                                                            
Dec 19 23:56:56 ftp kernel: [15486952.005657] ------------[ cut here
]------------                                                                   
Dec 19 23:56:56 ftp kernel: [15486952.005730] WARNING: at kernel/exit.c:965
do_exit+0x537/0x677()                                                           
Dec 19 23:56:56 ftp kernel: [15486952.005800] Modules linked in: qla2xxx        
Dec 19 23:56:56 ftp kernel: [15486952.005983] Pid: 14237, comm: rsync Tainted:
G      D W 2.6.26.5 #2
Dec 19 23:56:56 ftp kernel: [15486952.006057]  [<c0118b48>]
warn_on_slowpath+0x4d/0x66
Dec 19 23:56:56 ftp kernel: [15486952.006919]  [<c012c90a>]
atomic_notifier_call_chain+0x17/0x1b
Dec 19 23:56:56 ftp kernel: [15486952.006919]  [<c022f111>]
notify_update+0x1f/0x23
Dec 19 23:56:56 ftp kernel: [15486952.006919]  [<c022f33d>]
vt_console_print+0x1c0/0x290
Dec 19 23:56:56 ftp kernel: [15486952.006919]  [<c022f17d>]
vt_console_print+0x0/0x290
Dec 19 23:56:56 ftp kernel: [15486952.006919]  [<c0118f0a>]
__call_console_drivers+0x53/0x5f
Dec 19 23:56:56 ftp kernel: [15486952.006919]  [<c012c74e>] up+0x9/0x2b
Dec 19 23:56:56 ftp kernel: [15486952.006919]  [<c011938e>]
release_console_sem+0x197/0x1c8
Dec 19 23:56:56 ftp kernel: [15486952.006985]  [<c011c0a9>] do_exit+0x537/0x677
Dec 19 23:56:56 ftp kernel: [15486952.007094]  [<c01036ec>]
apic_timer_interrupt+0x28/0x30
Dec 19 23:56:56 ftp kernel: [15486952.007899]  [<c01198bc>] printk+0x1b/0x1f
Dec 19 23:56:56 ftp kernel: [15486952.007899]  [<c01040bc>] do_trap+0x0/0xbe
Dec 19 23:56:56 ftp kernel: [15486952.007899]  [<c0104205>]
do_invalid_op+0x0/0x8a
Dec 19 23:56:56 ftp kernel: [15486952.007899]  [<c0104286>]
do_invalid_op+0x81/0x8a
Dec 19 23:56:56 ftp kernel: [15486952.007899]  [<c01b511e>]
reiserfs_in_journal+0x111/0x137
Dec 19 23:56:56 ftp kernel: [15486952.007899]  [<c01766db>]
__find_get_block_slow+0x4b/0xe8
Dec 19 23:56:56 ftp kernel: [15486952.007899]  [<c033f9ee>]
io_schedule+0x1d/0x27
Dec 19 23:56:56 ftp kernel: [15486952.007972]  [<c033fc2b>]
__wait_on_bit+0x54/0x5e
Dec 19 23:56:56 ftp kernel: [15486952.008081]  [<c0177281>]
sync_buffer+0x0/0x37
Dec 19 23:56:56 ftp kernel: [15486952.008908]  [<c0177281>]
sync_buffer+0x0/0x37
Dec 19 23:56:56 ftp kernel: [15486952.008908]  [<c033fc98>]
out_of_line_wait_on_bit+0x63/0x6b
Dec 19 23:56:56 ftp kernel: [15486952.008908]  [<c0340e2a>]
error_code+0x72/0x78
Dec 19 23:56:56 ftp kernel: [15486952.008908]  [<c017007b>]
aio_kick_handler+0x10b/0x2b0
Dec 19 23:56:56 ftp kernel: [15486952.008908]  [<c01200d8>]
ptrace_get_task_struct+0x23/0x33
Dec 19 23:56:56 ftp kernel: [15486952.008908]  [<c01b511e>]
reiserfs_in_journal+0x111/0x137
Dec 19 23:56:56 ftp kernel: [15486952.008908]  [<c0194264>]
scan_bitmap_block+0x127/0x2a1
Dec 19 23:56:56 ftp kernel: [15486952.008973]  [<c0195098>]
reiserfs_allocate_blocknrs+0x470/0xdd5
Dec 19 23:56:56 ftp kernel: [15486952.009086]  [<c019d64e>]
reiserfs_get_block+0x304/0x12a8
Dec 19 23:56:56 ftp kernel: [15486952.009899]  [<c01778cd>]
__block_prepare_write+0x1b6/0x374
Dec 19 23:56:56 ftp kernel: [15486952.009899]  [<c013aed2>]
add_to_page_cache+0x74/0x7b
Dec 19 23:56:56 ftp kernel: [15486952.009899]  [<c0177b13>]
block_write_begin+0x57/0xea
Dec 19 23:56:56 ftp kernel: [15486952.009899]  [<c019d34a>]
reiserfs_get_block+0x0/0x12a8
Dec 19 23:56:56 ftp kernel: [15486952.011908]  [<c019f7e7>]
reiserfs_write_begin+0xff/0x1ec
Dec 19 23:56:56 ftp kernel: [15486952.012019]  [<c019d34a>]
reiserfs_get_block+0x0/0x12a8
Dec 19 23:56:56 ftp kernel: [15486952.012129]  [<c013b9fb>]
generic_file_buffered_write+0x116/0x63c
Dec 19 23:56:56 ftp kernel: [15486952.012246]  [<c01d486f>]
security_inode_need_killpriv+0xc/0xd
Dec 19 23:56:56 ftp kernel: [15486952.012357]  [<c013a81e>]
remove_suid+0x15/0x53
Dec 19 23:56:56 ftp kernel: [15486952.012470]  [<c013c1be>]
__generic_file_aio_write_nolock+0x29d/0x555
Dec 19 23:56:56 ftp kernel: [15486952.012894]  [<c013c4cb>]
generic_file_aio_write+0x55/0xc5
Dec 19 23:56:56 ftp kernel: [15486952.012894]  [<c017331f>]
__mark_inode_dirty+0x4c/0x14c
Dec 19 23:56:56 ftp kernel: [15486952.012894]  [<c0158cf2>]
do_sync_write+0xd2/0x10e
Dec 19 23:56:56 ftp kernel: [15486952.012894]  [<c016ace7>]
inode_setattr+0x9c/0x16d
Dec 19 23:56:56 ftp kernel: [15486952.012894]  [<c01629cf>]
do_filp_open+0x6e9/0x733
Dec 19 23:56:56 ftp kernel: [15486952.012894]  [<c0129467>]
autoremove_wake_function+0x0/0x37
Dec 19 23:56:56 ftp kernel: [15486952.012898]  [<c016af43>]
notify_change+0x18b/0x1b4
Dec 19 23:56:56 ftp kernel: [15486952.013007]  [<c016d3a5>]
mnt_drop_write+0x1d/0xcf
Dec 19 23:56:56 ftp kernel: [15486952.013115]  [<c01d4896>]
security_file_permission+0xc/0xd
Dec 19 23:56:56 ftp kernel: [15486952.013896]  [<c0158e96>]
rw_verify_area+0x5a/0xb5
Dec 19 23:56:56 ftp kernel: [15486952.013896]  [<c0157a1c>]
sys_fchmod+0x3e/0xac
Dec 19 23:56:56 ftp kernel: [15486952.013896]  [<c01a066a>]
reiserfs_file_write+0x0/0x7a
Dec 19 23:56:56 ftp kernel: [15486952.013896]  [<c0159424>] vfs_write+0x79/0xa0
Dec 19 23:56:56 ftp kernel: [15486952.013896]  [<c0159908>] sys_write+0x41/0x6a
Dec 19 23:56:56 ftp kernel: [15486952.013896]  [<c0102c3d>]
sysenter_past_esp+0x6a/0x91
Dec 19 23:56:56 ftp kernel: [15486952.013896]  =======================
Dec 19 23:56:56 ftp kernel: [15486952.013947] ---[ end trace 6c0651af41821b30
]---

Server was online for about 250 days, filesystem repaired 2 or 3 times. I've
checked information regarding reiserfs, haven't found any patch or fix or
update to newer kernels. I strongly believe, that this problem may exist on a
stable 2.6.32.2 version kernel. Now our server runs on 2.6.29.3 kernel (was
configured earlier). Because this is a production server, we cannot do much
testing.

Related modules: qla2xxx (version:        8.03.00-k4)

Hardware:
Server: IBM eServer xSeries 346
HBA: QLogic QLA2340 ISP2312 FC2-133 PCI-X
Disk system: IBM DS400 (1700-1RS) with 14 SCSI disks

System: Debian 5.0.3

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
