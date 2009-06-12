From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: What kernel rpm do i need  for      reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64.rpm
Date: Fri, 12 Jun 2009 10:12:01 -0400
Message-ID: <4A326231.10502@suse.com>
References: <21747.202.168.22.19.1244777575.squirrel@webmail.velocity.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <21747.202.168.22.19.1244777575.squirrel@webmail.velocity.net.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

doiggl@velocitynet.com.au wrote:
> Hello,
> Im just trying to install
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64.rpm
> What kernel rpm do i need ?
> Do you have a link to the kernel it wants, as Im having difficulty finding
> the correct kernel ?

I think you need this kernel:
http://download.opensuse.org/repositories/Base:/Kernel/standard

For some reason, our normal method of appending rc* to the release
string isn't working in the build service.

- -Jeff


> Other info
> (source)
> http://download.opensuse.org/repositories/drivers:/filesystems/openSUSE_Factory/x86_64/reiser4-kmp-debug-0.1_2.6.30_rc8_6-28.1.x86_64.rpm
>  11-Jun-2009 06:11
> 
> Thanks for the info Glenn
> 
> # rpm -ivhU reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64.rpm
> warning: reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64.rpm: Header V3
> DSA signature: NOKEY, key ID 74de2879
> error: Failed dependencies:
> ksym(default:schedule) = 1000e51 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:d_alloc_root) = 1098bf5b is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:call_rcu) = 1251d30f is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:alloc_pages_current) = 153f7f6d is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:iput) = 159ab62a is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:radix_tree_tagged) = 17c85a66 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:_read_lock) = 1a75caa3 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:wait_for_completion) = 1cefe352 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:__copy_user_nocache) = 1db7706b is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:generic_file_llseek) = 200c27e1 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:__wait_on_page_locked) = 2229c898 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:find_get_pages) = 228b5c5d is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:wait_on_page_bit) = 25696947 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:lzo1x_decompress_safe) = 2a1538ca is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:add_to_page_cache_lru) = 2af8b65a is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:kill_block_super) = 2c790724 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:malloc_sizes) = 2d1952d2 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:lzo1x_1_compress) = 2e1d43cf is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:generic_file_splice_read) = 2e39baf3 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:unregister_filesystem) = 2e857a13 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:memcmp) = 2fa5a500 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:file_remove_suid) = 30a40ffa is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:zlib_deflateInit2) = 315c65fd is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:generic_write_checks) = 335bd415 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:prepare_to_wait) = 33d92f9a is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:strchr) = 349cba85 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:vsnprintf) = 35b0650f is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:bio_add_page) = 35c11253 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:refrigerator) = 35c2ba9e is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:sb_set_blocksize) = 368ef77f is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:kfree) = 37a0cba is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:read_cache_pages) = 3941687c is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:is_bad_inode) = 39aad82e is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:bio_get_nr_vecs) = 3a10f06b is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:__init_rwsem) = 3b67cbbf is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:sprintf) = 3c2c5af5 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:kmem_cache_free) = 3c68d742 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:radix_tree_gang_lookup) = 3db2e258 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:zlib_inflateReset) = 3ed63055 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:zlib_inflateInit2) = 4211c3c1 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:sscanf) = 42224298 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:per_cpu__kernel_stack) = 431c2e0f is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:unregister_shrinker) = 44161c19 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:__tracepoint_kmalloc) = 4661e311 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:find_next_zero_bit) = 479c3c86 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:seq_printf) = 479e3dad is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:zlib_deflateReset) = 48034724 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:default_llseek) = 4bc45c0a is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:file_update_time) = 4d534d6d is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:inode_add_bytes) = 4e0d3fc8 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:unlock_new_inode) = 4f0e2b2f is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:module_layout) = 4f6c659d is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:per_cpu__current_task) = 574042c8 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:__kmalloc) = 5a34a45c is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:d_rehash) = 5aa7d9ff is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:radix_tree_delete) = 605c8bde is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:rcu_barrier) = 60a13e90 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:__wake_up) = 642e54ac is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:init_waitqueue_head) = 64cd5d16 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:current_kernel_time) = 67053080 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:unmap_mapping_range) = 68b4ba56 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:put_page) = 6ab65f29 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:cancel_dirty_page) = 6b227c91 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:dump_stack) = 6b2dc060 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:radix_tree_lookup_slot) = 6b4e5a52 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:end_page_writeback) = 6c178e93 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:radix_tree_lookup) = 6de6bf83 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:inode_set_bytes) = 6e461e89 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:__bread) = 6f8afcc8 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:touch_atime) = 71463509 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:jiffies) = 7d11c268 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:__mutex_init) = 7de307f0 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:strncpy) = 7ec9bfbc is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:_spin_trylock) = 7ee91c1d is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:test_set_page_writeback) = 80ac5b2 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:pv_irq_ops) = 8145e7f9 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:do_sync_read) = 8149ac19 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:bio_alloc) = 823654ca is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:register_filesystem) = 832b127f is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:strncmp) = 85abc85f is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:radix_tree_tag_set) = 8631f188 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:generic_file_aio_read) = 8728cd20 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:grab_cache_page_write_begin) = 8736dafc is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:zlib_inflate) = 881039d0 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:__free_pages) = 88717a22 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:kmem_cache_alloc) = 891aeaf8 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:clear_inode) = 8c9e1cf0 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:submit_bio) = 8e91a066 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:set_page_dirty_notag) = 8fd254e4 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:wake_up_process) = 90596055 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:find_or_create_page) = 918671f2 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:make_bad_inode) = 942d0b1b is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:num_physpages) = 948cde9 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:up_read) = 96f33400 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:_spin_lock) = 973873ab is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:radix_tree_preload) = 9754ec10 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:vfree) = 999e8297 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:finish_wait) = 9ccb2622 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:_write_lock) = 9d258f is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:snprintf) = 9edbecae is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:__lock_page) = a15b0c23 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:_cond_resched) = a1c76e0a is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:register_shrinker) = a329f07e is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:memmove) = a3a5be95 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:d_splice_alias) = a4ed1e34 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:inode_sub_bytes) = a57f2074 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:generic_file_mmap) = a630a5d8 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:kmem_cache_destroy) = a78e280a is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:down_read) = a822dae7 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:init_special_inode) = a866cfae is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:__vmalloc) = a9bd2676 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:inode_get_bytes) = aa28f753 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:radix_tree_tag_clear) = ac383451 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:inode_init_once) = ace2eef2 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:generic_read_dir) = af126f04 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:zlib_deflate) = af64ad0d is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:inode_setattr) = b01be4e0 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:vfs_dq_transfer) = b076cc8c is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:radix_tree_gang_lookup_tag) = b18e02c3 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:pv_lock_ops) = b279da12 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:unlock_page) = b3dfc73e is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:block_sync_page) = b4d063ba is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:sg_init_one) = b6244511 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:clear_page_dirty_for_io) = b74bdce1 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:debugfs_remove) = b8d4af5 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:down_read_trylock) = b9805b0c is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:up_write) = c4d489e9 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:truncate_inode_pages_range) = c5f06725 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:autoremove_wake_function) = c8b57c27 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:balance_dirty_pages_ratelimited_nr) = cb25e4f1 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:generic_permission) = cbfc2991 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:zlib_inflate_workspacesize) = ce5ac24f is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:debugfs_create_u32) = cf7ed467 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:kthread_create) = cfe19573 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:kthread_should_stop) = d2965f6f is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:debugfs_create_dir) = d457c760 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:schedule_timeout) = d62c833f is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:vm_stat) = d6d68c6b is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:get_sb_bdev) = d75cb705 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:igrab) = d88579b0 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:radix_tree_insert) = da4629e4 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:__mark_inode_dirty) = da81f0db is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:new_inode) = dbbe5fee is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:totalram_pages) = de9360ba is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:mutex_trylock) = de98f65 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:__pagevec_release) = deb67b44 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:kmem_cache_create) = dfb5ce58 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:strcmp) = e2d5255a is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:iget5_locked) = e386da2e is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:complete) = e456bd3a is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:kthread_stop) = e4665e36 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:d_instantiate) = e4c3795f is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:panic) = e52592a is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:mark_page_accessed) = e5832bb6 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:generic_file_splice_write) = e6c34606 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:mutex_lock) = e8525ee3 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:strcpy) = e914e41e is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:printk) = ea147363 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:__set_page_dirty_nobuffers) = eaa48111 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:copy_user_generic) = eb77efbb is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:_spin_lock_irq) = ecde1418 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:inode_change_ok) = ecfe9688 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:__brelse) = eeab57df is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:truncate_inode_pages) = eed0c6fb is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:put_pages_list) = f0009fee is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:__insert_inode_hash) = f0b1eef is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:zlib_deflate_workspacesize) = f0caf44b is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:__stack_chk_fail) = f0fdf6cb is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:bio_put) = f222514b is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:iget_locked) = f57342c4 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:vfs_dq_drop) = f72201e8 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:read_cache_page) = f789d5f8 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:down_write) = fa842fdc is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:mutex_unlock) = fc5f49ac is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:generic_readlink) = fd8fcdae is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:d_obtain_alias) = fdd46e89 is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> ksym(default:generic_sync_sb_inodes) = fff408cc is needed by
> reiser4-kmp-default-0.1_2.6.30_rc8_6-28.1.x86_64
> 
> 
> 


- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iEYEARECAAYFAkoyYjAACgkQLPWxlyuTD7IiCwCeNh3eQfqT1OfERBxpfAaruzID
w74An3N3AZDbLGAGkW5uAk++jvi3IyCj
=4Xub
-----END PGP SIGNATURE-----
