From: Mickael Marchand <Mickael.Marchand@ujf-grenoble.fr>
Subject: Re: reiser4: mv changes mtime ?
Date: Fri, 08 Apr 2005 10:51:21 +0200
Message-ID: <42564609.4040208@ujf-grenoble.fr>
References: <4254F10A.7060103@ujf-grenoble.fr> <1112944858.4420.94.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg=sha1; boundary="=_fourier.ujf-grenoble.fr-18172-1112950291-0001-2"
Return-path: <reiserfs-list-return-23810-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1112944858.4420.94.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com

--=_fourier.ujf-grenoble.fr-18172-1112950291-0001-2
Content-Type: multipart/mixed;
 boundary="------------030900000601020500050506"

This is a multi-part message in MIME format.
--------------030900000601020500050506
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

hmm just got 3 more soft lookups in a few hours (2/3 hours I think) ;)
my script (attached in case you want to try it) for backups basically do:
rm -rf hourly.11
mv hourly.10 hourly.11
...
mv hourly.1 hourly.2
mv hourly.0 hourly.1
cp -al hourly.1 hourly.0

rsync [various options] /home/ hourly.0/

the size of the base backup being about 37Go which is incrementally
rsync-ed thanks to hard links on a 500Go raid6 array.

another backups scripts just rsync some box over ssh once a day ...

tell me if I can provide more infos that could help you ...

Cheers,
Mik

reiser4[ktxnmgrd:md3:ti(3087)]: commit_current_atom
(fs/reiser4/txnmgr.c:1147)[nikita-3176]:
WARNING: Flushing like mad: 16384
reiser4[ktxnmgrd:md3:ti(3087)]: commit_current_atom
(fs/reiser4/txnmgr.c:1147)[nikita-3176]:
WARNING: Flushing like mad: 16384
reiser4[ktxnmgrd:md3:ti(3087)]: commit_current_atom
(fs/reiser4/txnmgr.c:1147)[nikita-3176]:
WARNING: Flushing like mad: 16384
ssh[4076]: segfault at 0000000000000000 rip 0000000000425b05 rsp
00007ffffffb0c50 error 4
ssh[4079]: segfault at 0000000000000000 rip 0000000000425b05 rsp
00007fffffef6a50 error 4
ssh[4082]: segfault at 0000000000000000 rip 0000000000425b05 rsp
00007ffffff92250 error 4
ssh[4085]: segfault at 0000000000000000 rip 0000000000425b05 rsp
00007fffff956810 error 4
ssh[4088]: segfault at 0000000000000000 rip 0000000000425b05 rsp
00007fffffe9f9f0 error 4
reiser4[ktxnmgrd:md3:ti(3087)]: commit_current_atom
(fs/reiser4/txnmgr.c:1147)[nikita-3176]:
WARNING: Flushing like mad: 16384
reiser4[ktxnmgrd:md3:ti(3087)]: commit_current_atom
(fs/reiser4/txnmgr.c:1147)[nikita-3176]:
WARNING: Flushing like mad: 16384
reiser4[ktxnmgrd:md3:ti(3087)]: commit_current_atom
(fs/reiser4/txnmgr.c:1147)[nikita-3176]:
WARNING: Flushing like mad: 16384
BUG: soft lockup detected on CPU#0!

Modules linked in: ipv6 parport_pc parport ehci_hcd eth1394 uhci_hcd
ohci1394 ieee1394 ohci_hcd usbcore snd_intel8x0 snd_ac97_codec snd_pcm
snd_timer snd snd_page_alloc i2c_amd756 i2c_amd8111 i2c_isa w83781d
i2c_sensor i2c_core e1000
Pid: 6131, comm: pdflush Not tainted 2.6.12-rc2-mm1
RIP: 0010:[<ffffffff801ea474>] <ffffffff801ea474>{jlookup+36}
RSP: 0018:ffff81001def3670  EFLAGS: 00000286
RAX: ffff81007f81b340 RBX: ffff8100c09f5000 RCX: 00000000000038b1
RDX: ffff81001c7171c0 RSI: 000000000030c1df RDI: ffff8100c739b020
RBP: 0000002000000000 R08: ffff81001def38a0 R09: ffff810011b54b54
R10: 0000000000000026 R11: ffffffff802118d0 R12: 00007fe01def35e0
R13: ffff8100c09f5004 R14: ffff81001def365c R15: 00007fe000000001
FS:  00002aaaaadfeae0(0000) GS:ffffffff806eb840(0000) knlGS:0000000000000000
CS:  0010 DS: 0018 ES: 0018 CR0: 000000008005003b
CR2: 00002aaaabb58dc8 CR3: 000000000dbab000 CR4: 00000000000006e0

Call Trace:<ffffffff8021f665>{protect_extent_nodes+213}
<ffffffff8021bf3e>{extent_size+30}
       <ffffffff801f5d49>{txnh_get_atom+41}
<ffffffff8021ff02>{alloc_extent+562}
       <ffffffff80209fec>{plugin_by_unsafe_id+28}
<ffffffff80220b01>{item_length_by_coord+17}
       <ffffffff801f899f>{handle_pos_on_twig+351}
<ffffffff801fab16>{flush_current_atom+2022}
       <ffffffff801f7a1a>{flush_some_atom+458}
<ffffffff801a27a3>{generic_sync_sb_inodes+723}
       <ffffffff8014cb90>{keventd_create_kthread+0}
<ffffffff80203ab5>{reiser4_sync_inodes+229}
       <ffffffff801a29e9>{writeback_inodes+137}
<ffffffff8015ff6c>{background_writeout+124}
       <ffffffff80160a50>{pdflush+0} <ffffffff80160b8c>{pdflush+316}
       <ffffffff8015fef0>{background_writeout+0}
<ffffffff8014ce09>{kthread+217}
       <ffffffff80133310>{schedule_tail+64} <ffffffff8010f59b>{child_rip+8}
       <ffffffff8014cb90>{keventd_create_kthread+0}
<ffffffff8014cd30>{kthread+0}
       <ffffffff8010f593>{child_rip+0}
BUG: soft lockup detected on CPU#0!

Modules linked in: ipv6 parport_pc parport ehci_hcd eth1394 uhci_hcd
ohci1394 ieee1394 ohci_hcd usbcore snd_intel8x0 snd_ac97_codec snd_pcm
snd_timer snd snd_page_alloc i2c_amd756 i2c_amd8111 i2c_isa w83781d
i2c_sensor i2c_core e1000
Pid: 6131, comm: pdflush Not tainted 2.6.12-rc2-mm1
RIP: 0010:[<ffffffff801ea474>] <ffffffff801ea474>{jlookup+36}
RSP: 0018:ffff81001def3670  EFLAGS: 00000282
RAX: ffff810058578880 RBX: ffff8100c0a5f000 RCX: 000000000000c0c3
RDX: ffff81004d60ec40 RSI: 000000000030c1df RDI: ffff8100c739b020
RBP: 0000002000000000 R08: ffff81001def38a0 R09: ffff810040f9570c
R10: 0000000000000018 R11: ffffffff802118d0 R12: 00007fe00001412a
R13: ffff8100c0a5f004 R14: ffff81001def365c R15: 00007fe000000001
FS:  00002aaaaadfeae0(0000) GS:ffffffff806eb840(0000) knlGS:0000000000000000
CS:  0010 DS: 0018 ES: 0018 CR0: 000000008005003b
CR2: 00002aaaaaac2000 CR3: 000000000dbab000 CR4: 00000000000006e0

Call Trace:<ffffffff8021f665>{protect_extent_nodes+213}
<ffffffff8021bf3e>{extent_size+30}
       <ffffffff801f5d49>{txnh_get_atom+41}
<ffffffff8021ff02>{alloc_extent+562}
       <ffffffff801f0013>{longterm_unlock_znode+275}
<ffffffff80220bad>{item_id_by_coord+45}
       <ffffffff801f899f>{handle_pos_on_twig+351}
<ffffffff801fab16>{flush_current_atom+2022}
       <ffffffff801f7a1a>{flush_some_atom+458}
<ffffffff801a27a3>{generic_sync_sb_inodes+723}
       <ffffffff8014cb90>{keventd_create_kthread+0}
<ffffffff80203ab5>{reiser4_sync_inodes+229}
       <ffffffff801a29e9>{writeback_inodes+137}
<ffffffff8015ff6c>{background_writeout+124}
       <ffffffff80160a50>{pdflush+0} <ffffffff80160b8c>{pdflush+316}
       <ffffffff8015fef0>{background_writeout+0}
<ffffffff8014ce09>{kthread+217}
       <ffffffff80133310>{schedule_tail+64} <ffffffff8010f59b>{child_rip+8}
       <ffffffff8014cb90>{keventd_create_kthread+0}
<ffffffff8014cd30>{kthread+0}
       <ffffffff8010f593>{child_rip+0}
BUG: soft lockup detected on CPU#0!

Modules linked in: ipv6 parport_pc parport ehci_hcd eth1394 uhci_hcd
ohci1394 ieee1394 ohci_hcd usbcore snd_intel8x0 snd_ac97_codec snd_pcm
snd_timer snd snd_page_alloc i2c_amd756 i2c_amd8111 i2c_isa w83781d
i2c_sensor i2c_core e1000
Pid: 8037, comm: rsync Not tainted 2.6.12-rc2-mm1
RIP: 0010:[<ffffffff801ea474>] <ffffffff801ea474>{jlookup+36}
RSP: 0018:ffff81007539f3f0  EFLAGS: 00000282
RAX: ffff81001fdf8580 RBX: ffff8100c0940000 RCX: 000000000001c54e
RDX: ffff81001ae99880 RSI: 000000000030c1df RDI: ffff8100c739b020
RBP: 0000002000000000 R08: ffff81007539f620 R09: ffff81008ab989bc
R10: 000000000000003b R11: ffffffff802118d0 R12: 00007fe07539f360
R13: ffff8100c0940004 R14: ffff81007539f3dc R15: 00007fe000000001
FS:  00002aaaab01b6d0(0000) GS:ffffffff806eb840(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
CR2: 00002aaaaaac2000 CR3: 000000000dbab000 CR4: 00000000000006e0

Call Trace:<ffffffff8021f665>{protect_extent_nodes+213}
<ffffffff8021bf3e>{extent_size+30}
       <ffffffff801f5d49>{txnh_get_atom+41}
<ffffffff8021ff02>{alloc_extent+562}
       <ffffffff801f0013>{longterm_unlock_znode+275}
<ffffffff801fb4f2>{handle_pos_end_of_twig+642}
       <ffffffff80220b01>{item_length_by_coord+17}
<ffffffff801f899f>{handle_pos_on_twig+351}
       <ffffffff801fab16>{flush_current_atom+2022}
<ffffffff8020b38b>{owns_item_common+75}
       <ffffffff801f71f3>{txn_end+419} <ffffffff801f7519>{txn_restart+9}
       <ffffffff80203b19>{reiser4_throttle_write+9}
<ffffffff8021e805>{write_extent+1509}
       <ffffffff80220b01>{item_length_by_coord+17}
<ffffffff8021bf89>{nr_units_extent+9}
       <ffffffff8021d359>{init_coord_extension_extent+121}
       <ffffffff8021e220>{write_extent+0} <ffffffff8022a920>{write_flow+640}
       <ffffffff804c7e41>{__down_read+49}
<ffffffff8022ad73>{write_unix_file+835}
       <ffffffff801f74aa>{txn_end+1114}
<ffffffff8020655d>{reiser4_write+157}
       <ffffffff8017e4ae>{vfs_write+190} <ffffffff8017ea73>{sys_write+83}
       <ffffffff8010e9e2>{system_call+126}
reiser4[ktxnmgrd:md3:ti(3087)]: commit_current_atom
(fs/reiser4/txnmgr.c:1147)[nikita-3176]:
WARNING: Flushing like mad: 16384
reiser4[ktxnmgrd:md3:ti(3087)]: commit_current_atom
(fs/reiser4/txnmgr.c:1147)[nikita-3176]:
WARNING: Flushing like mad: 16384
reiser4[ktxnmgrd:md3:ti(3087)]: commit_current_atom
(fs/reiser4/txnmgr.c:1147)[nikita-3176]:
WARNING: Flushing like mad: 16384


Vladimir Saveliev wrote:
> Hello
> 
> On Thu, 2005-04-07 at 12:36, Mickael Marchand wrote:
> 
>>Hi,
>>
>>I am giving a shot at reiser4 to make rsync snapshots backups (using
>>hard links and incremental rsync).
>>this works definitely great apart from 2 minor bugs :)
>>
>>1 : it seems that mv directory/ directory2/ changes the mtime of the
>>directory. This is not the case with reiser3.
> 
> 
> I am not sure which is correct.
> ext2 also changes mtime when it renames a directory.
> 
> Also, renaming directory changes its ".." entry because on rename it may
> get new parent. So, probably, updating mtime on directory rename is not
> very incorrect. 
> 
> 
>> Is this intentional ?
>>(it basically breaks my recover-from-snapshots script which uses the
>>mtime ;)
>>
>>2 : this was posted on lkml today but it fits better here I guess :
>>
>>2.6.12-rc1-mm4 config at
>>http://www-fourier.ujf-grenoble.fr/~mmarcha/config-2.6.12-rc1-mm4.gz
>>
>>running on a bi-opteron (debian-amd64),
>>I got some "flushing like mad" warning messages from reiser4 (which
>>are safe apparently).
> 
> 
> yes, if its counter does not increase endlessly.
> 
> 
>>and this soft lookup BUG caused by reiser4 I think :
>>
> 
> 
> Have you found a test on which this soft lockup get detected 10 times in
> 10 attempts?
> 
> 
>>BUG: soft lockup detected on CPU#0!
>>
>>Modules linked in: ipv6 parport_pc parport eth1394 ehci_hcd uhci_hcd
>>ohci1394 ieee1394 ohci_hcd usbcore snd_intel8x0 snd_ac97_codec snd_pcm
>>snd_timer snd snd_page_alloc i2c_amd756 i2c_amd8111 i2c_isa w83781d
>>i2c_sensor i2c_core e1000
>>Pid: 25291, comm: pdflush Not tainted 2.6.12-rc1-mm4
>>RIP: 0010:[<ffffffff8021f7de>] <ffffffff8021f7de>{protect_extent_nodes+382}
>>RSP: 0018:ffff81007df45678  EFLAGS: 00000202
>>RAX: ffff810015c7c5e0 RBX: ffff81007c609000 RCX: ffff81001074ba60
>>RDX: ffff81001074b220 RSI: ffff81001074b1c0 RDI: ffff81001074b210
>>RBP: 0000002000000000 R08: ffff81007df458a0 R09: ffff810044068e14
>>R10: 000000000000001c R11: ffffffff802119a0 R12: 00007fe07df455e0
>>R13: ffff81007c609004 R14: ffff81007df4565c R15: 00007fe000000001
>>FS:  00002aaaaadfeae0(0000) GS:ffffffff806e7840(0000) knlGS:0000000000000000
>>CS:  0010 DS: 0018 ES: 0018 CR0: 000000008005003b
>>CR2: 00002aaaaaac2000 CR3: 000000009bc83000 CR4: 00000000000006e0
>>
>>Call Trace:<ffffffff8021f7da>{protect_extent_nodes+378}
>><ffffffff8021c00e>{extent_size+30}
>>       <ffffffff801f5df9>{txnh_get_atom+41}
>><ffffffff8021ffd2>{alloc_extent+562}
>>       <ffffffff8020a0bc>{plugin_by_unsafe_id+28}
>><ffffffff80220bd1>{item_length_by_coord+17}
>>       <ffffffff801f8a4f>{handle_pos_on_twig+351}
>><ffffffff801fabc6>{flush_current_atom+2022}
>>       <ffffffff801f7aca>{flush_some_atom+458}
>><ffffffff801a2993>{generic_sync_sb_inodes+723}
>>       <ffffffff8014cc50>{keventd_create_kthread+0}
>><ffffffff80203b85>{reiser4_sync_inodes+229}
>>       <ffffffff801a2bd9>{writeback_inodes+137}
>><ffffffff8016012c>{background_writeout+124}
>>       <ffffffff80160c10>{pdflush+0} <ffffffff80160d4c>{pdflush+316}
>>       <ffffffff801600b0>{background_writeout+0}
>><ffffffff8014cec9>{kthread+217}
>>       <ffffffff80133160>{schedule_tail+64} <ffffffff8010f59b>{child_rip+8}
>>       <ffffffff8014cc50>{keventd_create_kthread+0}
>><ffffffff8014cdf0>{kthread+0}
>>       <ffffffff8010f593>{child_rip+0}
>>
>>Please CC-me in answers, I am not subscribed here.
>>
>>Cheers,
>>Mik
>>
> 
> 


-- 
Mickael Marchand,
Ingenieur de recherche CNRS
Service Informatique, Institut Fourier - UFR Maths
Tel : 0476635655 Fax : 0476514478

--------------030900000601020500050506
Content-Type: application/x-shellscript;
 name="snapshot-home.sh"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
 filename="snapshot-home.sh"

IyEvYmluL2Jhc2gKIyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiMgbWlrZXMgaGFuZHkgcm90YXRpbmct
ZmlsZXN5c3RlbS1zbmFwc2hvdCB1dGlsaXR5CiMgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQojIFJDUyBp
bmZvOiAkSWQ6IG1ha2Vfc25hcHNob3Quc2gsdiAxLjYgMjAwMi8wNC8wNiAwNDoyMDowMCBt
cnViZWwgRXhwICQKIyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiMgdGhpcyBuZWVkcyB0byBiZSBhIGxv
dCBtb3JlIGdlbmVyYWwsIGJ1dCB0aGUgYmFzaWMgaWRlYSBpcyBpdCBtYWtlcwojIHJvdGF0
aW5nIGJhY2t1cC1zbmFwc2hvdHMgb2YgL21vemFydC91c2Vycy9lbnNjaCB3aGVuZXZlciBj
YWxsZWQKIyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgojIC0tLS0tLS0tLS0tLS0gc3lzdGVtIGNvbW1h
bmRzIHVzZWQgYnkgdGhpcyBzY3JpcHQgLS0tLS0tLS0tLS0tLS0tLS0tLS0KSUQ9L3Vzci9i
aW4vaWQ7CkVDSE89L2Jpbi9lY2hvOwoKTU9VTlQ9L2Jpbi9tb3VudDsKUk09L2Jpbi9ybTsK
TVY9L2Jpbi9tdjsKQ1A9L2Jpbi9jcDsKVE9VQ0g9L2Jpbi90b3VjaDsKClJTWU5DPS91c3Iv
YmluL3JzeW5jOwojdGVzdCwgc2hvdWxkIGJlIHNldCBpbiBjcm9uL3NjcmlwdApTT1VSQ0U9
L2hvbWUvClNFUlY9Zm91cmllcgoKIyAtLS0tLS0tLS0tLS0tIGZpbGUgbG9jYXRpb25zIC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgpNT1VOVF9ERVZJQ0U9
L2V4cG9ydHMvYmFja3VwczsKU05BUFNIT1RfUlc9L3Jvb3Qvc25hcHNob3Q7CkVYQ0xVREVT
PS9ldGMvYmFja3VwX2V4Y2x1ZGU7CgoKIyAtLS0tLS0tLS0tLS0tIHRoZSBzY3JpcHQgaXRz
ZWxmIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgojbG9ja2luZwpp
ZiBbIC1mIC90bXAvaG9tZS5sb2NrIF07IHRoZW4KCWVjaG8gIlNvcnJ5LCBzbmFwc2hvdCBy
dW5uaW5nIjsKCWV4aXQgMDsKZmkgOwoKCnRvdWNoIC90bXAvaG9tZS5sb2NrCgojIG1ha2Ug
c3VyZSB3ZSdyZSBydW5uaW5nIGFzIHJvb3QKaWYgKCggYCRJRCAtdWAgIT0gMCApKTsgdGhl
biB7ICRFQ0hPICJTb3JyeSwgbXVzdCBiZSByb290LiAgRXhpdGluZy4uLiI7IGV4aXQ7IH0g
ZmkKCiMgc3RlcCAxOiBkZWxldGUgdGhlIG9sZGVzdCBzbmFwc2hvdCwgaWYgaXQgZXhpc3Rz
OgppZiBbIC1kICRTTkFQU0hPVF9SVy8kU0VSVi8kU09VUkNFL2hvdXJseS4xMSBdIDsgdGhl
biAgICAgICAgICAgICAgICAgICAgIFwKCSRSTSAtcmYgJFNOQVBTSE9UX1JXLyRTRVJWLyRT
T1VSQ0UvaG91cmx5LjExIDsgICAgICAgICAgICAgICAgICAgICAgICAgICAgXApmaSA7Cgoj
IHN0ZXAgMjogc2hpZnQgdGhlIG1pZGRsZSBzbmFwc2hvdHMocykgYmFjayBieSBvbmUsIGlm
IHRoZXkgZXhpc3QKaWYgWyAtZCAkU05BUFNIT1RfUlcvJFNFUlYvJFNPVVJDRS9ob3VybHku
MTAgXSA7IHRoZW4gICAgICAgICAgICAgICAgICAgICBcCgkkTVYgJFNOQVBTSE9UX1JXLyRT
RVJWLyRTT1VSQ0UvaG91cmx5LjEwICRTTkFQU0hPVF9SVy8kU0VSVi8kU09VUkNFL2hvdXJs
eS4xMSA7ICAgICBcCmZpOwppZiBbIC1kICRTTkFQU0hPVF9SVy8kU0VSVi8kU09VUkNFL2hv
dXJseS45IF0gOyB0aGVuICAgICAgICAgICAgICAgICAgICAgXAoJJE1WICRTTkFQU0hPVF9S
Vy8kU0VSVi8kU09VUkNFL2hvdXJseS45ICRTTkFQU0hPVF9SVy8kU0VSVi8kU09VUkNFL2hv
dXJseS4xMCA7ICAgICBcCmZpOwppZiBbIC1kICRTTkFQU0hPVF9SVy8kU0VSVi8kU09VUkNF
L2hvdXJseS44IF0gOyB0aGVuICAgICAgICAgICAgICAgICAgICAgXAoJJE1WICRTTkFQU0hP
VF9SVy8kU0VSVi8kU09VUkNFL2hvdXJseS44ICRTTkFQU0hPVF9SVy8kU0VSVi8kU09VUkNF
L2hvdXJseS45IDsgICAgIFwKZmk7CmlmIFsgLWQgJFNOQVBTSE9UX1JXLyRTRVJWLyRTT1VS
Q0UvaG91cmx5LjcgXSA7IHRoZW4gICAgICAgICAgICAgICAgICAgICBcCgkkTVYgJFNOQVBT
SE9UX1JXLyRTRVJWLyRTT1VSQ0UvaG91cmx5LjcgJFNOQVBTSE9UX1JXLyRTRVJWLyRTT1VS
Q0UvaG91cmx5LjggOyAgICAgXApmaTsKaWYgWyAtZCAkU05BUFNIT1RfUlcvJFNFUlYvJFNP
VVJDRS9ob3VybHkuNiBdIDsgdGhlbiAgICAgICAgICAgICAgICAgICAgIFwKCSRNViAkU05B
UFNIT1RfUlcvJFNFUlYvJFNPVVJDRS9ob3VybHkuNiAkU05BUFNIT1RfUlcvJFNFUlYvJFNP
VVJDRS9ob3VybHkuNyA7ICAgICBcCmZpOwppZiBbIC1kICRTTkFQU0hPVF9SVy8kU0VSVi8k
U09VUkNFL2hvdXJseS41IF0gOyB0aGVuICAgICAgICAgICAgICAgICAgICAgXAoJJE1WICRT
TkFQU0hPVF9SVy8kU0VSVi8kU09VUkNFL2hvdXJseS41ICRTTkFQU0hPVF9SVy8kU0VSVi8k
U09VUkNFL2hvdXJseS42IDsgICAgIFwKZmk7CmlmIFsgLWQgJFNOQVBTSE9UX1JXLyRTRVJW
LyRTT1VSQ0UvaG91cmx5LjQgXSA7IHRoZW4gICAgICAgICAgICAgICAgICAgICBcCgkkTVYg
JFNOQVBTSE9UX1JXLyRTRVJWLyRTT1VSQ0UvaG91cmx5LjQgJFNOQVBTSE9UX1JXLyRTRVJW
LyRTT1VSQ0UvaG91cmx5LjUgOyAgICAgXApmaTsKaWYgWyAtZCAkU05BUFNIT1RfUlcvJFNF
UlYvJFNPVVJDRS9ob3VybHkuMyBdIDsgdGhlbiAgICAgICAgICAgICAgICAgICAgIFwKCSRN
ViAkU05BUFNIT1RfUlcvJFNFUlYvJFNPVVJDRS9ob3VybHkuMyAkU05BUFNIT1RfUlcvJFNF
UlYvJFNPVVJDRS9ob3VybHkuNCA7ICAgICBcCmZpOwppZiBbIC1kICRTTkFQU0hPVF9SVy8k
U0VSVi8kU09VUkNFL2hvdXJseS4yIF0gOyB0aGVuICAgICAgICAgICAgICAgICAgICAgXAoJ
JE1WICRTTkFQU0hPVF9SVy8kU0VSVi8kU09VUkNFL2hvdXJseS4yICRTTkFQU0hPVF9SVy8k
U0VSVi8kU09VUkNFL2hvdXJseS4zIDsgICAgIFwKZmk7CmlmIFsgLWQgJFNOQVBTSE9UX1JX
LyRTRVJWLyRTT1VSQ0UvaG91cmx5LjEgXSA7IHRoZW4gICAgICAgICAgICAgICAgICAgICBc
CgkkTVYgJFNOQVBTSE9UX1JXLyRTRVJWLyRTT1VSQ0UvaG91cmx5LjEgJFNOQVBTSE9UX1JX
LyRTRVJWLyRTT1VSQ0UvaG91cmx5LjIgOyAgICAgXApmaTsKCiMgc3RlcCAzOiBtYWtlIGEg
aGFyZC1saW5rLW9ubHkgKGV4Y2VwdCBmb3IgZGlycykgY29weSBvZiB0aGUgbGF0ZXN0IHNu
YXBzaG90LAojIGlmIHRoYXQgZXhpc3RzCmlmIFsgLWQgJFNOQVBTSE9UX1JXLyRTRVJWLyRT
T1VSQ0UvaG91cmx5LjAgXSA7IHRoZW4gICAgICAgICAgICAgICAgICAgICBcCgkkQ1AgLWFs
ICRTTkFQU0hPVF9SVy8kU0VSVi8kU09VUkNFL2hvdXJseS4wICRTTkFQU0hPVF9SVy8kU0VS
Vi8kU09VUkNFL2hvdXJseS4xIDsgXApmaTsKCiMgc3RlcCA0OiByc3luYyBmcm9tIHRoZSBz
eXN0ZW0gaW50byB0aGUgbGF0ZXN0IHNuYXBzaG90IChub3RpY2UgdGhhdAojIHJzeW5jIGJl
aGF2ZXMgbGlrZSBjcCAtLXJlbW92ZS1kZXN0aW5hdGlvbiBieSBkZWZhdWx0LCBzbyB0aGUg
ZGVzdGluYXRpb24KIyBpcyB1bmxpbmtlZCBmaXJzdC4gIElmIGl0IHdlcmUgbm90IHNvLCB0
aGlzIHdvdWxkIGNvcHkgb3ZlciB0aGUgb3RoZXIKIyBzbmFwc2hvdChzKSB0b28hCiRSU1lO
QyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCi12YSAtLWRlbGV0ZSAtLWRlbGV0ZS1leGNsdWRlZCAgICAgICAgICAgICAgICAg
ICAgICAgICAgXAotLWV4Y2x1ZGUtZnJvbT0iJEVYQ0xVREVTIiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKJFNPVVJDRSAkU05BUFNIT1RfUlcvJFNFUlYvJFNPVVJDRS9ob3Vy
bHkuMCA7CgojIHN0ZXAgNTogdXBkYXRlIHRoZSBtdGltZSBvZiBob3VybHkuMCB0byByZWZs
ZWN0IHRoZSBzbmFwc2hvdCB0aW1lCiRUT1VDSCAvZXhwb3J0cy9iYWNrdXBzLyRTRVJWLyRT
T1VSQ0UvaG91cmx5LjAgOwoKcm0gLWYgL3RtcC9ob21lLmxvY2sK
--------------030900000601020500050506--

--=_fourier.ujf-grenoble.fr-18172-1112950291-0001-2
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIL+TCC
A20wggJVoAMCAQICAQIwDQYJKoZIhvcNAQEEBQAwKzELMAkGA1UEBhMCRlIxDTALBgNVBAoT
BENOUlMxDTALBgNVBAMTBENOUlMwHhcNMDEwNDI3MDU0NjQ5WhcNMTEwNDI1MDU0NjQ5WjA0
MQswCQYDVQQGEwJGUjENMAsGA1UEChMEQ05SUzEWMBQGA1UEAxMNQ05SUy1TdGFuZGFyZDCC
ASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANzhHiE9BovqvV60iNsPk5e0bQc9hmIA
Lcr/tUqO51akj2Es8aAqq/Yq3Xwsv+91VQusCU7nTmHA5wzwkBVFEgLCjOvDEmTiYxAYLssH
MdmB5dwpgpsxVuKBHopvp+ipWBFEVoNds054cC3ftv1ygUXV8e5Nzu++1T0MkCBFmgmArw9M
2iAOgL86s+sngMC5D8ChTkDcOv1qKr9A1SxxgPn4umvk6ioAqy++mvCndm2YKZwPL/BC8hiX
W8n2zBlfusK+EtJcsJCUwLfLBgTvjzDtMi16SveTu6AJpLTuM8vQg5u1tbOQ3o6QHlmcINVL
Hu3XTE+G+hw6KqHprAWgnb8CAwEAAaOBkjCBjzAMBgNVHRMEBTADAQH/MB0GA1UdDgQWBBRn
WaXlB3RJA+8Fz8wupBjVEMiePDBTBgNVHSMETDBKgBRW62i50lx+mLWlU8ORb2NYxPlrt6Ev
pC0wKzELMAkGA1UEBhMCRlIxDTALBgNVBAoTBENOUlMxDTALBgNVBAMTBENOUlOCAQAwCwYD
VR0PBAQDAgEGMA0GCSqGSIb3DQEBBAUAA4IBAQAGA0eDckWQwk7hIderF6kBVQbKQG1Voh1e
6+IUI1nkCeKQ9jyNNgYPS6cmI2XC6gaacru4jMuKX+95NiV+ANfzBpT7g0QpJjfH7umHzmyG
gBtxPdJir/bNYmxTD+Z6kwCMey4z4EEdqr5lmHbxlQd0s+Y/U3XVSwY2SynE9tyOE4BAEHOC
rRV7BHFQtTcz8shku6EQfjbGra9vcFKm0a7MzLqw6FkSj2INrQPdSyroiTmIUS/tYei3MIfb
J1VtZoejUQmAYXFRBb4THdlBMPx1XwqWmxj/vpCBtBPAchEI/Wqaage99IMstGA2ZAf6PWqn
sJAEdoPdM8s04heYBAuhMIIEQDCCAyigAwIBAgICFX8wDQYJKoZIhvcNAQEEBQAwNDELMAkG
A1UEBhMCRlIxDTALBgNVBAoTBENOUlMxFjAUBgNVBAMTDUNOUlMtU3RhbmRhcmQwHhcNMDQx
MjA5MjAyODMyWhcNMDUxMjA5MjAyODMyWjB6MQswCQYDVQQGEwJGUjENMAsGA1UEChMEQ05S
UzEQMA4GA1UECxMHR0RTMjc1NDEZMBcGA1UEAxMQTWlja2FlbCBNYXJjaGFuZDEvMC0GCSqG
SIb3DQEJARYgTWlja2FlbC5NYXJjaGFuZEB1amYtZ3Jlbm9ibGUuZnIwgZ8wDQYJKoZIhvcN
AQEBBQADgY0AMIGJAoGBAN9svCyGyJS+zLj36WziVjKmC73BCcI64sK5QMMaFd/4yuG/9CEr
1kNzDLAB64s3xdETQhfAjRQTgqT5UfXWudKjKF+QAyQeeHEPX1Dk1Pl7qS5aC45z+Xn3H3pS
iuVOdMkylk1X/wLK1SVC5MljlOEU6AGBCAP/yZuwCmvcmq+TAgMBAAGjggGYMIIBlDAMBgNV
HRMBAf8EAjAAMBEGCWCGSAGG+EIBAQQEAwIEsDAOBgNVHQ8BAf8EBAMCBeAweAYJYIZIAYb4
QgENBGsWaUNlcnRpZmljYXQgQ05SUy1TdGFuZGFyZC4gUG91ciB0b3V0ZSBpbmZvcm1hdGlv
biBzZSByZXBvcnRlciDgIGh0dHA6Ly9pZ2Muc2VydmljZXMuY25ycy5mci9DTlJTLVN0YW5k
YXJkLzAdBgNVHQ4EFgQU2ohbz2VSzXAIgw0NxJcpJXvcS44wUwYDVR0jBEwwSoAUZ1ml5Qd0
SQPvBc/MLqQY1RDInjyhL6QtMCsxCzAJBgNVBAYTAkZSMQ0wCwYDVQQKEwRDTlJTMQ0wCwYD
VQQDEwRDTlJTggECMCsGA1UdEQQkMCKBIE1pY2thZWwuTWFyY2hhbmRAdWpmLWdyZW5vYmxl
LmZyMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmxzLnNlcnZpY2VzLmNucnMuZnIvQ05S
Uy1TdGFuZGFyZC9nZXRkZXIuY3JsMA0GCSqGSIb3DQEBBAUAA4IBAQDceOh3Tg0ZSU2sspa5
9Ta0RjqdW/RW+bJx8CeexLtgMSxuTU87erfXFNsjFcLQCIR2DU1bM6HO75K5VzNfe8vGHpgm
2Gnw51vUDczk+Un/4cp8FgExi0P/uabWkEfuAQ0SC9Z18pjfHecfiKXD0z8GOfMMbUfsfYpv
Y8FnvB8AT3b3H39M31WdZyNO3mm63X/fblDvfksG29CIY+agUAUdFHTFdV/u93mQW4zuz8tD
HQqELxHCDIp4hWr635mn9aXpcR0o30VzHgdKBJjo6ojj3jvJAj+d2BM2pZA++FVaAs1a29Hk
woxTy/wND9FkeRNuWFq2xilf3RVSDHKeWcOaMIIEQDCCAyigAwIBAgICFX8wDQYJKoZIhvcN
AQEEBQAwNDELMAkGA1UEBhMCRlIxDTALBgNVBAoTBENOUlMxFjAUBgNVBAMTDUNOUlMtU3Rh
bmRhcmQwHhcNMDQxMjA5MjAyODMyWhcNMDUxMjA5MjAyODMyWjB6MQswCQYDVQQGEwJGUjEN
MAsGA1UEChMEQ05SUzEQMA4GA1UECxMHR0RTMjc1NDEZMBcGA1UEAxMQTWlja2FlbCBNYXJj
aGFuZDEvMC0GCSqGSIb3DQEJARYgTWlja2FlbC5NYXJjaGFuZEB1amYtZ3Jlbm9ibGUuZnIw
gZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAN9svCyGyJS+zLj36WziVjKmC73BCcI64sK5
QMMaFd/4yuG/9CEr1kNzDLAB64s3xdETQhfAjRQTgqT5UfXWudKjKF+QAyQeeHEPX1Dk1Pl7
qS5aC45z+Xn3H3pSiuVOdMkylk1X/wLK1SVC5MljlOEU6AGBCAP/yZuwCmvcmq+TAgMBAAGj
ggGYMIIBlDAMBgNVHRMBAf8EAjAAMBEGCWCGSAGG+EIBAQQEAwIEsDAOBgNVHQ8BAf8EBAMC
BeAweAYJYIZIAYb4QgENBGsWaUNlcnRpZmljYXQgQ05SUy1TdGFuZGFyZC4gUG91ciB0b3V0
ZSBpbmZvcm1hdGlvbiBzZSByZXBvcnRlciDgIGh0dHA6Ly9pZ2Muc2VydmljZXMuY25ycy5m
ci9DTlJTLVN0YW5kYXJkLzAdBgNVHQ4EFgQU2ohbz2VSzXAIgw0NxJcpJXvcS44wUwYDVR0j
BEwwSoAUZ1ml5Qd0SQPvBc/MLqQY1RDInjyhL6QtMCsxCzAJBgNVBAYTAkZSMQ0wCwYDVQQK
EwRDTlJTMQ0wCwYDVQQDEwRDTlJTggECMCsGA1UdEQQkMCKBIE1pY2thZWwuTWFyY2hhbmRA
dWpmLWdyZW5vYmxlLmZyMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmxzLnNlcnZpY2Vz
LmNucnMuZnIvQ05SUy1TdGFuZGFyZC9nZXRkZXIuY3JsMA0GCSqGSIb3DQEBBAUAA4IBAQDc
eOh3Tg0ZSU2sspa59Ta0RjqdW/RW+bJx8CeexLtgMSxuTU87erfXFNsjFcLQCIR2DU1bM6HO
75K5VzNfe8vGHpgm2Gnw51vUDczk+Un/4cp8FgExi0P/uabWkEfuAQ0SC9Z18pjfHecfiKXD
0z8GOfMMbUfsfYpvY8FnvB8AT3b3H39M31WdZyNO3mm63X/fblDvfksG29CIY+agUAUdFHTF
dV/u93mQW4zuz8tDHQqELxHCDIp4hWr635mn9aXpcR0o30VzHgdKBJjo6ojj3jvJAj+d2BM2
pZA++FVaAs1a29HkwoxTy/wND9FkeRNuWFq2xilf3RVSDHKeWcOaMYICLTCCAikCAQEwOjA0
MQswCQYDVQQGEwJGUjENMAsGA1UEChMEQ05SUzEWMBQGA1UEAxMNQ05SUy1TdGFuZGFyZAIC
FX8wCQYFKw4DAhoFAKCCAUkwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0B
CQUxDxcNMDUwNDA4MDg1MTIxWjAjBgkqhkiG9w0BCQQxFgQUGwh1m1oGfYTvD50m0sJkosXW
A5UwSQYJKwYBBAGCNxAEMTwwOjA0MQswCQYDVQQGEwJGUjENMAsGA1UEChMEQ05SUzEWMBQG
A1UEAxMNQ05SUy1TdGFuZGFyZAICFX8wSwYLKoZIhvcNAQkQAgsxPKA6MDQxCzAJBgNVBAYT
AkZSMQ0wCwYDVQQKEwRDTlJTMRYwFAYDVQQDEw1DTlJTLVN0YW5kYXJkAgIVfzBSBgkqhkiG
9w0BCQ8xRTBDMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIAgDANBggqhkiG9w0DAgIBQDAH
BgUrDgMCBzANBggqhkiG9w0DAgIBKDANBgkqhkiG9w0BAQEFAASBgEC8KNGgkp+/dPl9ifVZ
8yghkVcMVLCS8YUD8NSYf/+pRXVBGvlu7U6ev/Ei3T332NRg58uaDs4MPAASpVJhet7g/fDk
sFK1kpocyA6Bp8sS1wrQFDGx7dkcTyStozjZESnrP8+wpv9jAUlYCj71UvH1LTGCl34o4UwP
789xhpvJAAAAAAAA
--=_fourier.ujf-grenoble.fr-18172-1112950291-0001-2--
