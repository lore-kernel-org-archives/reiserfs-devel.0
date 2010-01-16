From: <doiggl@velocitynet.com.au>
Subject: FYI r4 patches in http://lkml.org/lkml/2010/1/15/271
Date: Sat, 16 Jan 2010 00:38:57 +0000
Message-ID: <7ed5587f1fb48265e55e78f6f58f34d8@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

FYI: Saw this announcement at http://lkml.org/lkml/2010/1/15/271
Cheers Glenn

The mm-of-the-moment snapshot 2010-01-15-15-34 has been uploaded to

   http://userweb.kernel.org/~akpm/mmotm/

and will soon be available at

   git://zen-kernel.org/kernel/mmotm.git
It contains the following patches against 2.6.33-rc4:
.
.
.
reiser4-adjust-to-the-new-aops-fixup.patch                                
                                                 
reiser4-adjust-to-the-new-aops.patch                                      
                                                 
reiser4-drop-journal-info.patch                                           
                                                 
reiser4-export-find_get_pages.patch                                       
                                                 
reiser4-export-remove_from_page_cache-fix.patch                           
                                                 
reiser4-export-remove_from_page_cache.patch                               
                                                 
reiser4-fix-compile-warnings.patch                                        
                                                 
reiser4-fix.patch                                                         
                                                 
reiser4-fixed-null-pointer-dereference.patch                              
                                                 
reiser4-generic_sync_sb_inodes-doesnt-exist-anymore.patch                 
                                                 
reiser4-handling-error-returned-by-d_obtain_alias-fixup.patch             
                                                 
reiser4-reduce-frame-size-of-reiser4_init_super_data-fixup.patch          
                                                 
reiser4-reduce-frame-size-of-reiser4_init_super_data.patch                
                                                 
reiser4-remove-simple_prepare_write-usage-checkpatch-fixes.patch          
                                                 
reiser4-remove-simple_prepare_write-usage.patch                           
                                                 
reiser4-rename-psched-to-dispatch.patch                                   
                                                 
reiser4-some-changes-from-reiser4-2631-patch.patch                        
                                                 
reiser4-some-comments-were-still-mentioning-pdflush.patch                 
                                                 
reiser4-update-names-of-quota-methods.patch                               
                                                 
reiser4-use-set_page_dirty_notag.patch                                    
                                                 
reiser4-vfs-add-super_operationssync_inodes-2.patch                       
                                                 
reiser4.patch        
