From: Edward Shishkin <edward@namesys.com>
Subject: Re: metas
Date: Fri, 10 Feb 2006 18:08:59 +0300
Message-ID: <43ECAC8B.8090204@namesys.com>
References: <43E68E3F.8000806@namesys.com> <5c7c368b0602090958w58103871pe7cc83735c20f063@mail.gmail.com> <43EB8361.9000801@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28064-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43EB8361.9000801@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Marcus Furlong <furlongm@hotmail.com>
Cc: Reiserfs List <reiserfs-list@namesys.com>

    Edward Shishkin wrote:

>>
>>     > there are metas-patches on our ftp-server, although it is
>>     > not fresh. I'll advance it on the next week, ok?
>>     >
>>     > Edward.
>>
>>     Attached is a patch for 2.6.15 that I threw together from the
>>     2.5.14-rc5-mm1
>>     patch on the ftp server. Please check if it's ok.
>>
>>     Have a few problems/observations:
>>
>>     1. I get an oops if I try `cat items`. Reproduced with
>>     2.6.14-rc5-mm1 and
>>     it's patch on the namesys ftp server, so it's been there for a 
>> while.
>>
>>     $ cd test/....
>>     $ cat items
>>
>>     Unable to handle kernel NULL pointer dereference at virtual
>>     address 00000000
>>     printing eip:
>>     f8f32083
>>     *pde = 00000000
>>     Oops: 0000 [#1]
>>     PREEMPT
>>     Modules linked in: reiser4 i2c_i801 i2c_core intel_agp agpgart 
>> ipw2200
>>     ieee80211 ieee80211_crypt
>>     CPU:    0
>>     EIP:    0060:[<f8f32083>]    Not tainted VLI
>>     EFLAGS: 00010286   (2.6.15.1 <http://2.6.15.1>)
>>     EIP is at get_current_lock_stack+0x13/0x80 [reiser4]
>>     eax: 00000000   ebx: cadd9000   ecx: 00000000   edx: 00000000
>>     esi: d6a357fc   edi: ee151c10   ebp: ee151bf8   esp: cadd9db8
>>     ds: 007b   es: 007b   ss: 0068
>>     Process cat (pid: 17667, threadinfo=cadd9000 task=ddfa4a50)
>>     Stack: c0514a14 fffffff5 de4e9005 de4e9005 00000000 cadd9e0c 
>> c017511f
>>     ea5763c0
>>            cadd9e0c ee151bf8 f8f705d9 cadd9e14 00000000 00000000 
>> c01443cb
>>     d69463a0
>>            00000101 dbc1aebc cadd9f38 dfff4d40 00000000 c017eb55 
>> ea5763c0
>>     00000000
>>     Call Trace:
>>     [<c017511f>] __link_path_walk+0xbbf/0xf50
>>     [<f8f705d9>] object_lookup+0x79/0x380 [reiser4]
>>     [<c01443cb>] do_generic_mapping_read+0x4bb/0x570
>>     [<c017eb55>] dput+0x55/0x280
>>     [<c0147be4>] bad_range+0x34/0x50
>>     [<c01487b2>] buffered_rmqueue+0x1e2/0x240
>>     [<f8f9ff07>] key_by_inode_and_offset_common+0x17/0x230 [reiser4]
>>     [<f8f9b060>] permission_common+0x0/0x10 [reiser4]
>>     [<f9014970>] get_inode_host+0x10/0xd0 [reiser4]
>>     [<f9016791>] items_start+0xe1/0x230 [reiser4]
>>     [<c0188f3b>] seq_read+0x16b/0x2f0
>>     [<c016536c>] vfs_read+0x19c/0x1b0
>>     [<c01656b1>] sys_read+0x51/0x80
>>     [<c010316b>] sysenter_past_esp+0x54/0x75
>>     Code: af c3 8b 74 24 0c 8b 5c 24 08 83 c4 10 c3 90 90 90 90 90 90
>>     90 90 90
>>     90 53 83 ec 24 bb 00 f0 ff ff 21 e3 8b 03 8b 80 ac 04 00 00 <81>
>>     38 0b 5d
>>     1b 4b 75 08 83 c4 24 83 c0 04 5b c3 e8 68 26 fe ff
>>
>>
>>     2. I also get an oops using `cat readir` in a directory.
>>     Reproduced with
>>     2.6.14-rc5-mm1 and it's patch on the ftp server.
>>
>>     $ cd testdir/....
>>     $ cat readdir
>>
>>     Unable to handle kernel NULL pointer dereference at virtual
>>     address 00000000
>>     printing eip:
>>     f8f32083
>>     *pde = 00000000
>>     Oops: 0000 [#1]
>>     PREEMPT
>>     Modules linked in: reiser4 i2c_i801 i2c_core intel_agp agpgart
>>     ipw2200
>>     ieee80211 ieee80211_crypt
>>     CPU:    0
>>     EIP:    0060:[<f8f32083>]    Not tainted VLI
>>     EFLAGS: 00010286   (2.6.15.1 <http://2.6.15.1>)
>>     EIP is at get_current_lock_stack+0x13/0x80 [reiser4]
>>     eax: 00000000   ebx: ef00f000   ecx: 00000000   edx: 00000000
>>     esi: f0ee2c7c   edi: ed88de10   ebp: ed88ddf8   esp: ef00fdac
>>     ds: 007b   es: 007b   ss: 0068
>>     Process cat (pid: 1649, threadinfo=ef00f000 task=ef5cbad0)
>>     Stack: f7f8a007 c017eb55 ef420998 c0514a14 fffffff5 f7f8a007 
>> f7f8a007
>>     00000000
>>            ef00fe0c ed88ddf8 f8f705d9 ef00fe08 ef00fe04 ef00f000 
>> c17f5980
>>     00000000
>>            00000000 c01443cb f73f5b48 00000101 f0eed37c ef00ff38 
>> dfff4d40
>>     00000000
>>     Call Trace:
>>     [<c017eb55>] dput+0x55/0x280
>>     [<f8f705d9>] object_lookup+0x79/0x380 [reiser4]
>>     [<c01443cb>] do_generic_mapping_read+0x4bb/0x570
>>     [<c0175532>] link_path_walk+0x82/0xf0
>>     [<c0147be4>] bad_range+0x34/0x50
>>     [<c01487b2>] buffered_rmqueue+0x1e2/0x240
>>     [<f8fcb335>] build_entry_key_hashed+0x75/0x2a0 [reiser4]
>>     [<f8f9b060>] permission_common+0x0/0x10 [reiser4]
>>     [<f9014970>] get_inode_host+0x10/0xd0 [reiser4]
>>     [<f90159cb>] readdir_start+0x10b/0x200 [reiser4]
>>     [<c0188f3b>] seq_read+0x16b/0x2f0
>>     [<c016536c>] vfs_read+0x19c/0x1b0
>>     [<c01656b1>] sys_read+0x51/0x80
>>     [<c010316b>] sysenter_past_esp+0x54/0x75
>>     Code: af c3 8b 74 24 0c 8b 5c 24 08 83 c4 10 c3 90 90 90 90 90 90
>>     90 90 90
>>     90 53 83 ec 24 bb 00 f0 ff ff 21 e3 8b 03 8b 80 ac 04 00 00 <81>
>>     38 0b 5d
>>     1b 4b 75 08 83 c4 24 83 c0 04 5b c3 e8 68 26 fe ff
>>

Thanks for the report,
I put fixed patches (including the one against 2.6.15) on our ftp-server.

>>     3. At http://www.namesys.com/v4/pseudo.html
>>     <http://www.namesys.com/v4/pseudo.html> there is a  _pagecache_ 
>> pseudo
>>     file that seems to be missing. There is also a pseudo file called
>>     _new_
>>     that isn't described there. What is it for?
>

This is an alternative interface to create regular files
with specified names (currently within directory): try
echo -e "foo\0" >  some_dir/..../new

>>
>>     4. I couldn't reproduce the bash-crashing bug described at
>>     http://pvh.ca/trac/wiki/Reiser4Bugs
>>     Has it been fixed?
>>

Perhaps it got fixed when migrating to the new code
for reiser4/vfs interface (Peter used the old one).

Edward.
