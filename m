From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 14855] Reiserproblem
Date: Mon, 21 Dec 2009 20:31:39 GMT
Message-ID: <200912212031.nBLKVdvY017443@demeter.kernel.org>
References: <bug-14855-695@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-14855-695@http.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=14855





--- Comment #2 from Christian Kujau <lists@nerdbynature.de>  2009-12-21 20:31:38 ---
On Mon, 21 Dec 2009 at 11:48, bugzilla-daemon@bugzilla.kernel.org wrote:
> http://bugzilla.kernel.org/show_bug.cgi?id=14855

Is this perhaps the same BUG Randy Dunlap reported[0] for 2.6.23-rc6-git3?
It's in fs/reiserfs/journal.c:531 there. There's another BUG in that area, 
also seen [1] by Randy. Can anyone confirm if they are related to this 
one here?

I've attached the first part of Nerijus' backtrace, hopefully line-unwrapped,
below.

Christian.

[0] http://lkml.org/lkml/2007/9/13/284
[1]
http://oss.oracle.com/~rdunlap/kerneltest/reiserfs-fsx/bug-2620-rc5-uni-reis-fsx

 ------------[ cut here ]------------ 
 kernel BUG at fs/reiserfs/journal.c:532!
 invalid opcode: 0000 [#1] SMP     
 Modules linked in: qla2xxx        

 Pid: 14237, comm: rsync Tainted: G        W (2.6.26.5 #2)
 EIP: 0060:[<c01b511e>] EFLAGS: 00010246 CPU: 1           
 EIP is at reiserfs_in_journal+0x111/0x137                
 EAX: f8ea29fc EBX: 0000180c ECX: 05b31574 EDX: f8e20000  
 ESI: cfb2be00 EDI: 05b30000 EBP: 00000005 ESP: e4115aa8  
  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068            
 Process rsync (pid: 14237, ti=e4114000 task=f54823b0 task.ti=e4114000)
 Stack: 00002d98 f8e20000 00001574 00000b66 e4115b8c c81f6ed8 c0194264 00000001 
        e4115ae4 e4115c60 00000b66 f6d54ec0 cfb2be00 f8e1ad98 00000000 00000000 
        00000b66 00000b66 e4115c60 cfb2be00 c0195098 00008000 00000001 00000011 
 Call Trace:                       
  [<c0194264>] scan_bitmap_block+0x127/0x2a1                                    
  [<c0195098>] reiserfs_allocate_blocknrs+0x470/0xdd5                           
  [<c019d64e>] reiserfs_get_block+0x304/0x12a8                                  
  [<c01778cd>] __block_prepare_write+0x1b6/0x374                                
  [<c013aed2>] add_to_page_cache+0x74/0x7b                                      
  [<c0177b13>] block_write_begin+0x57/0xea                                      
  [<c019d34a>] reiserfs_get_block+0x0/0x12a8                                    
  [<c019f7e7>] reiserfs_write_begin+0xff/0x1ec                                  
  [<c019d34a>] reiserfs_get_block+0x0/0x12a8                                    
  [<c013b9fb>] generic_file_buffered_write+0x116/0x63c                          
  [<c01d486f>] security_inode_need_killpriv+0xc/0xd                             
  [<c013a81e>] remove_suid+0x15/0x53                                            
  [<c013c1be>] __generic_file_aio_write_nolock+0x29d/0x555                      
  [<c013c4cb>] generic_file_aio_write+0x55/0xc5                                 
  [<c017331f>] __mark_inode_dirty+0x4c/0x14c                                    
  [<c0158cf2>] do_sync_write+0xd2/0x10e                                         
  [<c016ace7>] inode_setattr+0x9c/0x16d                                         
  [<c01629cf>] do_filp_open+0x6e9/0x733                                         
  [<c0129467>] autoremove_wake_function+0x0/0x37                                
  [<c016af43>] notify_change+0x18b/0x1b4                                        
  [<c016d3a5>] mnt_drop_write+0x1d/0xcf                                         
  [<c01d4896>] security_file_permission+0xc/0xd                                 
  [<c0158e96>] rw_verify_area+0x5a/0xb5                                         
  [<c0157a1c>] sys_fchmod+0x3e/0xac                                             
  [<c01a066a>] reiserfs_file_write+0x0/0x7a                                     
  [<c0159424>] vfs_write+0x79/0xa0 
  [<c0159908>] sys_write+0x41/0x6a 
  [<c0102c3d>] sysenter_past_esp+0x6a/0x91                                      
  =======================          
 Code: d0 31 c3 81 e3 ff 1f 00 00 8b 54 24 04 8b 84 9a 10 01 00 00 85 c0 75 09
eb 15 8b 40 20 85 c0 74 0e 39 48 08 75 f4 3b 70 04 75 ef <0f> 0b eb fe 31 c0 83
c4 08 5b 5e 5f 5d c3 83 c1 01 8b 56 0c c1                                       
 EIP: [<c01b511e>] reiserfs_in_journal+0x111/0x137 SS:ESP 0068:e4115aa8         
  ---[ end trace 6c0651af41821b30 ]---

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
