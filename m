From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: Re: Reiser4 for 3.16.2 problem: mount: mount /dev/md125 on
 /mnt/backup failed: Cannot allocate memory
Date: Mon, 3 Nov 2014 14:28:41 +0100
Message-ID: <CADW=+3nzgJaYqAav475to7W4G4q6CoRMq83y-oNOOFLdU6xdSg@mail.gmail.com>
References: <CADW=+3nWaMdFCpoKQSErTQPu7YHm=4UJEZfZFnn8wOKX9tKrKg@mail.gmail.com>
	<CADW=+3ms6zaqzpkRBEgApi=gkMNPLCzzex8ShK4CkCFD-WNk8Q@mail.gmail.com>
	<5457629C.8040906@gmail.com>
	<CADW=+3=XfcVJsYTitCHdAsehw61Vyk0vHqM7wLr0dQNLiP94Fw@mail.gmail.com>
	<54576A09.6010901@gmail.com>
	<CADW=+3k0rgockXeT_mnPFSoRr0Xm4ttRG5ZVpPjd3DqWCNL6gw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=Mnr+jblLTGJXUkGp5kfY1HSTzWs1XgKLgwQs611LS5w=;
        b=FICeVxCKq43BD+fYonTyRE6lOv0o4bDXRO0tTDDKu0p/JN61V2QpBZHHHVgBkMAOS2
         Lel/Vz1Bo0BUx3uZq8P+d1c06MQ2T3AhK9z6BOev/Fvb7PoLELRuYD436ETwLNKDZsb4
         sYQ6Elg1280jbyyCIp2NIKZUfHsiaspIrvcZeZyJbw9MwjL87+/nk0ZjY+QuJX2SL1zh
         ah1P0XfbT3/ObH2/iBYjXejixHjaDSXs2iJJG4sqpF7ATevayhfBXX3LODGLVGn5OH4S
         opWp3KOPFgEbrBnG3bwZ5h3DBljXV6XOavG1oCqJVaRTAm+ObJjJ2QGZfdQfnUSskwkw
         +wOg==
In-Reply-To: <CADW=+3k0rgockXeT_mnPFSoRr0Xm4ttRG5ZVpPjd3DqWCNL6gw@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>, Ivan Shapovalov <intelfx100@gmail.com>

After an hour or more still nothing, one rsync went to zombie other
still in D state
I killed the main process and rebooted.

krshina3 goran # ps -aux | grep rsync
root      6655  0.0  0.1 101568  9328 pts/4    D    13:08   0:01
/usr/bin/rsync -ax --delete --numeric-ids --relative --delete-excluded
--exclude=3D/home/windows.qcow2
--link-dest=3D/mnt/backup/daily.1/localhost/ /home
/mnt/backup/daily.0/localhost/
root      6656  0.0  0.0      0     0 pts/4    Z    13:08   0:00
[rsync] <defunct>


Now I tried same command (rsnapshot -c /etc/rsnapshot.d/daily.conf
daily) and kernel BUGed with:

krshina3 goran # rsnapshot -c /etc/rsnapshot.d/daily.conf daily
rsync: writefd_unbuffered failed to write 5 bytes to socket
[generator]: Broken pipe (32)
-----------------------------------------------------------------------=
-----
rsnapshot encountered an error! The program was invoked with these opti=
ons:
/usr/bin/rsnapshot -c /etc/rsnapshot.d/daily.conf daily
-----------------------------------------------------------------------=
-----
ERROR: /usr/bin/rsync returned 0.04296875 while processing /home/
WARNING: Rolling back "localhost/"
rsync error: error in rsync protocol data stream (code 12) at
io.c(1532) [generator=3D3.0.9]



Nov  3 14:25:56 krshina3 kernel: [  282.735583] ------------[ cut here
]------------
Nov  3 14:25:56 krshina3 kernel: [  282.735905] kernel BUG at
fs/reiser4/plugin/item/ctail.c:669!
Nov  3 14:25:56 krshina3 kernel: [  282.736296] invalid opcode: 0000 [#=
1] SMP
Nov  3 14:25:56 krshina3 kernel: [  282.736575] CPU: 3 PID: 3890 Comm:
rsync Not tainted 3.16.5-gentoo #1
Nov  3 14:25:56 krshina3 kernel: [  282.736996] Hardware name:
Gigabyte Technology Co., Ltd. To be filled by O.E.M./B75-D3V, BIOS F5
07/04/2012
Nov  3 14:25:56 krshina3 kernel: [  282.737635] task: ffff8801adeeb010
ti: ffff880050d08000 task.ti: ffff880050d08000
Nov  3 14:25:56 krshina3 kernel: [  282.738132] RIP:
0010:[<ffffffff811c3a70>]  [<ffffffff811c3a70>]
do_readpage_ctail+0x2c0/0x420
Nov  3 14:25:56 krshina3 kernel: [  282.738713] RSP:
0018:ffff880050d0b978  EFLAGS: 00010246
Nov  3 14:25:56 krshina3 kernel: [  282.739080] RAX: 8000000000000025
RBX: ffffea0005586f98 RCX: ffff8800b9563800
Nov  3 14:25:56 krshina3 kernel: [  282.739546] RDX: 0000000000000035
RSI: 0000000000000000 RDI: ffff8800b9563000
Nov  3 14:25:56 krshina3 kernel: [  282.740013] RBP: ffff880050d0b9b8
R08: 0000000000001000 R09: 0000000000000001
Nov  3 14:25:56 krshina3 kernel: [  282.740480] R10: ffffffff811b3fc0
R11: ffffea00011718c8 R12: 0000000000000002
Nov  3 14:25:56 krshina3 kernel: [  282.740963] R13: ffff880075770d60
R14: ffff880050d0ba88 R15: 0000000000000001
Nov  3 14:25:56 krshina3 kernel: [  282.741429] FS:
00007f4355338700(0000) GS:ffff88022e380000(0000)
knlGS:0000000000000000
Nov  3 14:25:56 krshina3 kernel: [  282.741957] CS:  0010 DS: 0000 ES:
0000 CR0: 0000000080050033
Nov  3 14:25:56 krshina3 kernel: [  282.742329] CR2: 0000000003604268
CR3: 0000000050c86000 CR4: 00000000001427e0
Nov  3 14:25:56 krshina3 kernel: [  282.742794] Stack:
Nov  3 14:25:56 krshina3 kernel: [  282.742922]  ffff880050d0b9b8
ffffffff811b5c4f ffffea0005586f98 ffff880050d0ba88
Nov  3 14:25:56 krshina3 kernel: [  282.743449]  ffffea0005586f98
0000000000000000 ffff880075770d60 ffffffff811c3bd0
Nov  3 14:25:56 krshina3 kernel: [  282.743957]  ffff880050d0ba08
ffffffff811c3cea ffff880050d0ba08 00000000810e1785
Nov  3 14:25:56 krshina3 kernel: [  282.744465] Call Trace:
Nov  3 14:25:56 krshina3 kernel: [  282.744624]  [<ffffffff811b5c4f>]
? prepare_page_cluster+0xff/0x1f0
Nov  3 14:25:56 krshina3 kernel: [  282.745034]  [<ffffffff811c3bd0>]
? do_readpage_ctail+0x420/0x420
Nov  3 14:25:56 krshina3 kernel: [  282.745432]  [<ffffffff811c3cea>]
ctail_readpages_filler+0x11a/0x220
Nov  3 14:25:56 krshina3 kernel: [  282.745847]  [<ffffffff811c3bd0>]
? do_readpage_ctail+0x420/0x420
Nov  3 14:25:56 krshina3 kernel: [  282.746248]  [<ffffffff810ebdfa>]
read_cache_pages+0xba/0x120
Nov  3 14:25:56 krshina3 kernel: [  282.746623]  [<ffffffff811c4073>]
readpages_ctail+0x133/0x360
Nov  3 14:25:56 krshina3 kernel: [  282.746998]  [<ffffffff811b7e76>]
readpages_cryptcompress+0x46/0x80
Nov  3 14:25:56 krshina3 kernel: [  282.747413]  [<ffffffff811a2b8e>]
reiser4_readpages_dispatch+0x3e/0x50
Nov  3 14:25:56 krshina3 kernel: [  282.747841]  [<ffffffff810ec009>]
__do_page_cache_readahead+0x1a9/0x240
Nov  3 14:25:56 krshina3 kernel: [  282.748293]  [<ffffffff810ec1f7>]
ondemand_readahead+0x157/0x290
Nov  3 14:25:56 krshina3 kernel: [  282.748686]  [<ffffffff810e2326>]
? pagecache_get_page+0x36/0x1e0
Nov  3 14:25:56 krshina3 kernel: [  282.749084]  [<ffffffff810ec41e>]
page_cache_sync_readahead+0x2e/0x50
Nov  3 14:25:56 krshina3 kernel: [  282.749506]  [<ffffffff810e33e9>]
generic_file_read_iter+0x409/0x5f0
Nov  3 14:25:56 krshina3 kernel: [  282.749922]  [<ffffffff8112da8e>]
? link_path_walk+0x26e/0x880
Nov  3 14:25:56 krshina3 kernel: [  282.750304]  [<ffffffff810ed8e9>]
? lru_cache_add+0x9/0x10
Nov  3 14:25:56 krshina3 kernel: [  282.750663]  [<ffffffff8110c98e>]
? page_add_new_anon_rmap+0x7e/0xd0
Nov  3 14:25:56 krshina3 kernel: [  282.751082]  [<ffffffff81122b49>]
new_sync_read+0x79/0xb0
Nov  3 14:25:56 krshina3 kernel: [  282.751435]  [<ffffffff811b7f23>]
read_cryptcompress+0x73/0xb0
Nov  3 14:25:56 krshina3 kernel: [  282.751815]  [<ffffffff811b21c2>]
reiser4_read_dispatch+0x72/0x160
Nov  3 14:25:56 krshina3 kernel: [  282.752221]  [<ffffffff81123abb>]
vfs_read+0x9b/0x190
Nov  3 14:25:56 krshina3 kernel: [  282.752551]  [<ffffffff8112408a>]
SyS_read+0x4a/0xc0
Nov  3 14:25:56 krshina3 kernel: [  282.752875]  [<ffffffff8106d72c>]
? do_page_fault+0xc/0x10
Nov  3 14:25:56 krshina3 kernel: [  282.753245]  [<ffffffff816ab1d2>]
system_call_fastpath+0x16/0x1b
Nov  3 14:25:56 krshina3 kernel: [  282.753636] Code: fe ff ff 0f 1f
84 00 00 00 00 00 48 89 df e8 a8 e4 f1 ff e9 3c fe ff ff 0f 1f 00 48
89 df e8 98 e4 f1 ff e9 73 fe ff ff 0f 1f 00 <0f> 0b 48 8b 03 a8 08 0f
84 a1 00 00 00 49 8b be 80 00 00 00 e8
Nov  3 14:25:56 krshina3 kernel: [  282.755335] RIP
[<ffffffff811c3a70>] do_readpage_ctail+0x2c0/0x420
Nov  3 14:25:56 krshina3 kernel: [  282.755750]  RSP <ffff880050d0b978>
Nov  3 14:25:56 krshina3 kernel: [  282.888599] ---[ end trace
5749d003e849c626 ]---

On Mon, Nov 3, 2014 at 1:25 PM, Du=C5=A1an =C4=8Coli=C4=87 <dusanc@gmai=
l.com> wrote:
> On Mon, Nov 3, 2014 at 12:42 PM, Edward Shishkin
> <edward.shishkin@gmail.com> wrote:
>>
>> On 11/03/2014 12:12 PM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
>>>
>>> I fscked it yesterday before crash and now I'm fsck-ing it again bu=
t
>>> as you remember it lasts 1hr+ for some reason.
>>
>>
>>
>> For the full 70G partition it looks normal.
>>
>> OK, if you can reproduce this BUG at fs/reiser4/plugin/item/ctail.c:=
669
>> after fsck, then please let me know: it will essentially speed up th=
ings..
>>
> This time it fscked the same partition much faster (44 vs 70min) dunn=
o
> why as that partition is fscked daily with this cron script:
> #!/bin/sh
>
> echo "### RSNAPSHOT DAILY ###"
> fsck.reiser4 -a /dev/md125 && mount /mnt/backup && rsnapshot -c
> /etc/rsnapshot.d/daily.conf daily || echo "Backup failure"
> umount /mnt/backup
> logger -s "### RSNAPSHOT DAILY OK###"
>
> Now I executed rsnapshot -c /etc/rsnapshot.d/daily.conf daily and I
> can't see no action for last 10 minutes, nothing in iotop just in top
> rsync process in D state.
>
> krshina3 goran # ps -aux | grep rsync
> root      6655  0.1  0.1 101568  9328 pts/4    D+   13:08   0:01
> /usr/bin/rsync -ax --delete --numeric-ids --relative --delete-exclude=
d
> --exclude=3D/home/windows.qcow2
> --link-dest=3D/mnt/backup/daily.1/localhost/ /home
> /mnt/backup/daily.0/localhost/
> root      6656  0.0  0.0 112292  4380 pts/4    S+   13:08   0:00
> /usr/bin/rsync -ax --delete --numeric-ids --relative --delete-exclude=
d
> --exclude=3D/home/windows.qcow2
> --link-dest=3D/mnt/backup/daily.1/localhost/ /home
> /mnt/backup/daily.0/localhost/
> root      6657  0.0  0.0 101488  3496 pts/4    S+   13:08   0:00
> /usr/bin/rsync -ax --delete --numeric-ids --relative --delete-exclude=
d
> --exclude=3D/home/windows.qcow2
> --link-dest=3D/mnt/backup/daily.1/localhost/ /home
> /mnt/backup/daily.0/localhost/
>
>
> fsck results:
>
> krshina3 goran # fsck.reiser4 /dev/md125
> *******************************************************************
> This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
> *******************************************************************
>
> Fscking the /dev/md125 block device.
> Will check the consistency of the Reiser4 SuperBlock.
> Will check the consistency of the Reiser4 FileSystem.
> Continue?
> (Yes/No): y
> ***** fsck.reiser4 started at Mon Nov  3 12:13:15 2014
> Reiser4 fs was detected on /dev/md125.
> Master super block (16):
> magic:          ReIsEr4
> blksize:        4096
> format:         0x0 (format40)
> uuid:           184e9560-bdf9-42b0-896c-0af2a0c84066
> label:          <none>
>
> Format super block (17):
> plugin:         format40
> description:    Disk-format plugin.
> version:        0
> magic:          ReIsEr40FoRmAt
> mkfs id:        0x2a685787
> flushes:        0
> blocks:         17091120
> free blocks:    2838775
> root block:     7346608
> tail policy:    0x2 (smart)
> next oid:       0xbc056d
> file count:     856668
> tree height:    5
> key policy:     LARGE
>
>
> CHECKING THE STORAGE TREE
>         Read nodes 9972078
>         Nodes left in the tree 9972078
>                 Leaves of them 9855619, Twigs of them 115030
>         Time interval: Mon Nov  3 12:13:19 2014 - Mon Nov  3 12:27:35=
 2014
> CHECKING EXTENT REGIONS.
>         Read twigs 115030
>         Time interval: Mon Nov  3 12:27:35 2014 - Mon Nov  3 12:34:50=
 2014
> CHECKING THE SEMANTIC TREE
>         Found 2571171 objects (some could be encountered more then
> once).
>         Time interval: Mon Nov  3 12:34:50 2014 - Mon Nov  3 12:57:16=
 2014
> ***** fsck.reiser4 finished at Mon Nov  3 12:57:16 2014
> Closing fs...done
>
> FS is consistent.
>
>
>
>
>
>
>
>> Edward.
>>
>>
>>
>>
>>>
>>> On Mon, Nov 3, 2014 at 12:10 PM, Edward Shishkin
>>> <edward.shishkin@gmail.com> wrote:
>>>>
>>>> On 11/03/2014 11:58 AM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
>>>>
>>>> Now a Bug happened to me on this same ccreg40 partition with
>>>> Reiser4-for-3.16.2.patch and I don't know if it's related.
>>>>
>>>>
>>>>
>>>> It can not be related to inability to allocate memory at mount tim=
e.
>>>>
>>>>
>>>> I have a partition that I use for daily, weekly and monthly snapsh=
ots -
>>>> /dev/md125 with rsnapshot.
>>>> I fsck-ed it yesterday.
>>>>
>>>>
>>>>
>>>> Did you fsck-ed it before, or after crash?
>>>>
>>>> Edward.
>>>>
>>>>
>>>>
>>>> After mounting rsync starts and snapshots my /home directory. This=
 Bug
>>>> happened on rsync start.
>>>>
>>>>
>>>> rsnapshot log:
>>>> fsck.reiser4 /dev/md125
>>>> rsync: writefd_unbuffered failed to write 5 bytes to socket [gener=
ator]:
>>>> Broken pipe (32)
>>>> rsync error: error in rsync protocol data stream (code 12) at io.c=
(1532)
>>>> [generator=3D3.0.9]
>>>> ------------------------------
>>>> ----------------------------------------------
>>>> rsnapshot encountered an error! The program was invoked with these
>>>> options:
>>>> /usr/bin/rsnapshot -c /etc/rsnapshot.d/daily.conf daily
>>>>
>>>> ------------------------------------------------------------------=
----------
>>>> ERROR: /usr/bin/rsync returned 0.04296875 while processing /home/
>>>> WARNING: Rolling back "localhost/"
>>>> Backup failure
>>>>
>>>> daily.conf:
>>>> include_conf    /etc/rsnapshot.d/base.conf
>>>>
>>>> # Daily (30 increments)
>>>> interval        daily   30
>>>> backup          /home/          localhost/
>>>> exclude         /home/windows.qcow2
>>>>
>>>> base.conf:
>>>>
>>>> # Default config version
>>>> config_version  1.2
>>>>
>>>> # So the hard disk is not polluted in case the backup filesystem i=
s not
>>>> available
>>>> no_create_root  1
>>>>
>>>> # Standard settings
>>>> cmd_cp                  /bin/cp
>>>> cmd_rm                  /bin/rm
>>>> cmd_rsync               /usr/bin/rsync
>>>> link_dest               1
>>>> cmd_rsnapshot_diff      /usr/bin/rsnapshot-diff
>>>>
>>>> # For convenience, so that mount points can be taken as backup sta=
rting
>>>> points
>>>> one_fs                  1
>>>>
>>>> # Store all backups in one directory per machine
>>>> # A useful alternative may be to create a separate directory for e=
ach
>>>> interval
>>>> snapshot_root   /mnt/backup/
>>>>
>>>> Logs:
>>>> Nov  3 07:00:10 krshina3 kernel: [ 1650.974059] reiser4: md125: fo=
und
>>>> disk
>>>> format 4.0.0.
>>>> Nov  3 07:00:13 krshina3 kernel: [ 1654.207021] reiser4: md125: us=
ing
>>>> Hybrid
>>>> Transaction Model.
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1692.914414] ------------[ cut =
here
>>>> ]------------
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1692.914682] kernel BUG at
>>>> fs/reiser4/plugin/item/ctail.c:669!
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1692.915010] invalid opcode: 00=
00 [#1]
>>>> SMP
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1692.915259] CPU: 0 PID: 4950 C=
omm:
>>>> rsync
>>>> Not tainted 3.16.5-gentoo #1
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1692.915625] Hardware name: Gig=
abyte
>>>> Technology Co., Ltd. To be filled by O.E.M./B75-D3V, BIOS F5 07/04=
/2012
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1692.916183] task: ffff88022d3f=
17d0
>>>> ti:
>>>> ffff880100004000 task.ti: ffff880100004000
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1692.916610] RIP:
>>>> 0010:[<ffffffff811c3a70>]  [<ffffffff811c3a70>]
>>>> do_readpage_ctail+0x2c0/0x420
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1692.917111] RSP:
>>>> 0018:ffff880100007978
>>>> EFLAGS: 00010246
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1692.917412] RAX: 8000000000000=
025
>>>> RBX:
>>>> ffffea0004570218 RCX: ffff8800b94f0800
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1692.917819] RDX: 0000000000000=
035
>>>> RSI:
>>>> 0000000000000000 RDI: ffff8800b94f0000
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1692.918226] RBP: ffff880100007=
9b8
>>>> R08:
>>>> 0000000000001000 R09: 0000000000000001
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1692.918632] R10: ffffffff811b3=
fc0
>>>> R11:
>>>> ffffea00023f1330 R12: 0000000000000002
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1692.919039] R13: ffff8801ebb78=
d20
>>>> R14:
>>>> ffff880100007a88 R15: 0000000000000001
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1692.919450] FS:
>>>> 00007f4d6b27c700(0000)
>>>> GS:ffff88022e200000(0000) knlGS:0000000000000000
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1692.919912] CS:  0010 DS: 0000=
 ES:
>>>> 0000
>>>> CR0: 0000000080050033
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1692.920239] CR2: 0000000003035=
ddf
>>>> CR3:
>>>> 0000000008a76000 CR4: 00000000001427e0
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1692.920645] Stack:
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1692.920756]  ffff8801000079b8
>>>> ffffffff811b5c4f ffffea0004570218 ffff880100007a88
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1692.921200]  ffffea0004570218
>>>> 0000000000000000 ffff8801ebb78d20 ffffffff811c3bd0
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1692.921643]  ffff880100007a08
>>>> ffffffff811c3cea ffff880100007a08 00000000810e1785
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1692.922087] Call Trace:
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1692.922226]  [<ffffffff811b5c4=
f>] ?
>>>> prepare_page_cluster+0xff/0x1f0
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1692.922583]  [<ffffffff811c3bd=
0>] ?
>>>> do_readpage_ctail+0x420/0x420
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1692.922931]  [<ffffffff811c3ce=
a>]
>>>> ctail_readpages_filler+0x11a/0x220
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1692.923299]  [<ffffffff811c3bd=
0>] ?
>>>> do_readpage_ctail+0x420/0x420
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1692.923646]  [<ffffffff810ebdf=
a>]
>>>> read_cache_pages+0xba/0x120
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1692.923973]  [<ffffffff811c407=
3>]
>>>> readpages_ctail+0x133/0x360
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1692.924299]  [<ffffffff811b7e7=
6>]
>>>> readpages_cryptcompress+0x46/0x80
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1692.924656]  [<ffffffff811a2b8=
e>]
>>>> reiser4_readpages_dispatch+0x3e/0x50
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1692.925029]  [<ffffffff810ec00=
9>]
>>>> __do_page_cache_readahead+0x1a9/0x240
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1692.925407]  [<ffffffff810ec1f=
7>]
>>>> ondemand_readahead+0x157/0x290
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1692.925749]  [<ffffffff810e232=
6>] ?
>>>> pagecache_get_page+0x36/0x1e0
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1692.926097]  [<ffffffff810ec41=
e>]
>>>> page_cache_sync_readahead+0x2e/0x50
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1692.926464]  [<ffffffff810e33e=
9>]
>>>> generic_file_read_iter+0x409/0x5f0
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1692.926827]  [<ffffffff8112da8=
e>] ?
>>>> link_path_walk+0x26e/0x880
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1692.927160]  [<ffffffff81122b4=
9>]
>>>> new_sync_read+0x79/0xb0
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1692.927470]  [<ffffffff811b7f2=
3>]
>>>> read_cryptcompress+0x73/0xb0
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1692.927803]  [<ffffffff811b21c=
2>]
>>>> reiser4_read_dispatch+0x72/0x160
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1692.928156]  [<ffffffff81123ab=
b>]
>>>> vfs_read+0x9b/0x190
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1692.928443]  [<ffffffff8112408=
a>]
>>>> SyS_read+0x4a/0xc0
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1692.928726]  [<ffffffff816ab1d=
2>]
>>>> system_call_fastpath+0x16/0x1b
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1692.929068] Code: fe ff ff 0f =
1f 84
>>>> 00
>>>> 00 00 00 00 48 89 df e8 a8 e4 f1 ff e9 3c fe ff ff 0f 1f 00 48 89 =
df e8
>>>> 98
>>>> e4 f1 ff e9 73 fe ff ff 0f 1f 00 <0f> 0b 48 8b 03 a8 08 0f 84 a1 0=
0 00 00
>>>> 49
>>>> 8b be 80 00 00 00 e8
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1692.930505] RIP  [<ffffffff811=
c3a70>]
>>>> do_readpage_ctail+0x2c0/0x420
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1692.930868]  RSP <ffff88010000=
7978>
>>>> Nov  3 07:00:52 krshina3 kernel: [ 1693.043372] ---[ end trace
>>>> 36e8590f8aa347d3 ]---
>>>>
>>>> On Sun, Nov 2, 2014 at 9:38 AM, Du=C5=A1an =C4=8Coli=C4=87 <dusanc=
@gmail.com> wrote:
>>>>>
>>>>> When I try to mount a cc reiser4 partition (reiser4-for-3.16.2.pa=
tch)
>>>>> I get: mount: mount /dev/md125 on /mnt/backup failed: Cannot allo=
cate
>>>>> memory
>>>>> Uptime is almost 7 days and mounting of this partition worked eve=
ry
>>>>> day untill last night (I get automated messages on mail when some=
thing
>>>>> goes wrong).
>>>>>
>>>>> Now I tried on kernel 3.10 and everything works OK
>>>>>
>>>>> krshina3 goran # uname -a
>>>>> Linux krshina3 3.10.6-gentoo #2 SMP Wed Aug 14 17:33:45 CEST 2013
>>>>> x86_64 Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz GenuineIntel GNU/L=
inux
>>>>>
>>>>> krshina3 goran# free -m
>>>>>               total       used       free     shared    buffers
>>>>> cached
>>>>> Mem:          7681       6794        887         30          0
>>>>> 2933
>>>>> -/+ buffers/cache:       3860       3821
>>>>> Swap:          580        325        254
>>>>>
>>>>> krshina3 goran# cat /etc/fstab | grep -v "#"
>>>>>
>>>>> /dev/sda1               /boot           ext2            noauto,no=
atime
>>>>> 1
>>>>> 2
>>>>> /dev/md123              none            swap            sw
>>>>> 0
>>>>> 0
>>>>> /dev/sda2               /               reiser4
>>>>> noatime,onerror=3Dremount-ro              0 0
>>>>> /dev/md125              /mnt/backup     reiser4
>>>>> noatime,noauto,onerror=3Dremount-ro       0 0
>>>>> /dev/md126              /mnt/media      reiser4
>>>>> noatime,users,onerror=3Dremount-ro        0 0
>>>>> /dev/md127              /usr/portage    reiser4
>>>>> noatime,onerror=3Dremount-ro              0 0
>>>>> shm                     /dev/shm        tmpfs
>>>>> nodev,nosuid,noexec     0 0
>>>>>
>>>>>
>>>>> krshina3 goran # df
>>>>> Filesystem     1K-blocks      Used Available Use% Mounted on
>>>>> /dev/sda2       37017728  24870384  12147344  68% /
>>>>> tmpfs             786872       832    786040   1% /run
>>>>> udev               10240         0     10240   0% /dev
>>>>> shm              3934340        80   3934260   1% /dev/shm
>>>>> /dev/md126     383034100 298007740  85026360  78% /mnt/media
>>>>> /dev/md127       6113484   5427288    686196  89% /usr/portage
>>>>> /dev/md125      64959612  57618884   7340728  89% /mnt/backup
>>>>>
>>>>> I get these in logs:
>>>>>
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221513] reiser4: md125: =
found
>>>>> disk format 4.0.0.
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221749] mount: page
>>>>> allocation failure: order:4, mode:0x2040d0
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221752] CPU: 0 PID: 517 =
Comm:
>>>>> mount Not tainted 3.16.5-gentoo #1
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221753] Hardware name:
>>>>> Gigabyte Technology Co., Ltd. To be filled by O.E.M./B75-D3V, BIO=
S F5
>>>>> 07/04/2012
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221754]  000000000000000=
0
>>>>> ffff88020ece7968 ffffffff816a31b4 0000000000000007
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221757]  00000000002040d=
0
>>>>> ffff88020ece79f8 ffffffff810e609a ffffffff00000040
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221758]  000000000000028=
6
>>>>> ffffffff819a8a78 fffffff00000000f ffff88020ece79c8
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221760] Call Trace:
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221765]  [<ffffffff816a3=
1b4>]
>>>>> dump_stack+0x46/0x58
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221768]  [<ffffffff810e6=
09a>]
>>>>> warn_alloc_failed+0xda/0x130
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221770]  [<ffffffff810e8=
6c9>]
>>>>> __alloc_pages_nodemask+0x5d9/0x7a0
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221774]  [<ffffffff8111f=
16a>]
>>>>> cache_alloc_refill+0x31a/0x550
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221776]  [<ffffffff8111e=
e23>]
>>>>> kmem_cache_alloc+0xb3/0xe0
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221778]  [<ffffffff81186=
529>]
>>>>> znodes_tree_init+0xc9/0x120
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221781]  [<ffffffff8118e=
7b4>]
>>>>> reiser4_init_tree+0x44/0xd0
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221784]  [<ffffffff811cb=
905>]
>>>>> init_format_format40+0x265/0x5b0
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221787]  [<ffffffff8119e=
8b1>]
>>>>> fill_super+0x101/0x200
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221789]  [<ffffffff81126=
be4>]
>>>>> mount_bdev+0x194/0x1d0
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221792]  [<ffffffff8119e=
7b0>]
>>>>> ? reiser4_mount+0x20/0x20
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221794]  [<ffffffff8119e=
7a0>]
>>>>> reiser4_mount+0x10/0x20
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221796]  [<ffffffff81126=
e2b>]
>>>>> mount_fs+0x1b/0xd0
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221799]  [<ffffffff81140=
42f>]
>>>>> vfs_kern_mount+0x6f/0x130
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221801]  [<ffffffff81141=
f68>]
>>>>> do_mount+0x218/0xab0
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221803]  [<ffffffff810e8=
8a2>]
>>>>> ? __get_free_pages+0x12/0x60
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221805]  [<ffffffff81141=
bf5>]
>>>>> ? copy_mount_options+0x35/0x150
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221808]  [<ffffffff81142=
ad9>]
>>>>> SyS_mount+0x89/0xd0
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221811]  [<ffffffff816ab=
1d2>]
>>>>> system_call_fastpath+0x16/0x1b
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221812] Mem-Info:
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221813] DMA per-cpu:
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221814] CPU    0: hi:   =
 0,
>>>>> btch:   1 usd:   0
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221815] CPU    1: hi:   =
 0,
>>>>> btch:   1 usd:   0
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221816] CPU    2: hi:   =
 0,
>>>>> btch:   1 usd:   0
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221817] CPU    3: hi:   =
 0,
>>>>> btch:   1 usd:   0
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221817] DMA32 per-cpu:
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221819] CPU    0: hi:  1=
86,
>>>>> btch:  31 usd:   0
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221819] CPU    1: hi:  1=
86,
>>>>> btch:  31 usd:   0
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221820] CPU    2: hi:  1=
86,
>>>>> btch:  31 usd:   0
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221821] CPU    3: hi:  1=
86,
>>>>> btch:  31 usd:   0
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221822] Normal per-cpu:
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221823] CPU    0: hi:  1=
86,
>>>>> btch:  31 usd:   0
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221824] CPU    1: hi:  1=
86,
>>>>> btch:  31 usd:   0
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221825] CPU    2: hi:  1=
86,
>>>>> btch:  31 usd:  56
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221826] CPU    3: hi:  1=
86,
>>>>> btch:  31 usd:   0
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221828] active_anon:7016=
41
>>>>> inactive_anon:138699 isolated_anon:0
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221828]  active_file:399=
519
>>>>> inactive_file:396920 isolated_file:0
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221828]  unevictable:0
>>>>> dirty:204 writeback:0 unstable:0
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221828]  free:155878
>>>>> slab_reclaimable:126123 slab_unreclaimable:9074
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221828]  mapped:21535
>>>>> shmem:5701 pagetables:10162 bounce:0
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221828]  free_cma:0
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221833] DMA free:15900kB
>>>>> min:20kB low:24kB high:28kB active_anon:0kB inactive_anon:0kB
>>>>> active_file:0kB inactive_file:0kB unevictable:0kB isolated(anon):=
0kB
>>>>> isolated(file):0kB present:15984kB managed:15900kB mlocked:0kB
>>>>> dirty:0kB writeback:0kB mapped:0kB shmem:0kB slab_reclaimable:0kB
>>>>> slab_unreclaimable:0kB kernel_stack:0kB pagetables:0kB unstable:0=
kB
>>>>> bounce:0kB free_cma:0kB writeback_tmp:0kB pages_scanned:0
>>>>> all_unreclaimable? yes
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221834] lowmem_reserve[]=
: 0
>>>>> 2950 7665 7665
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221839] DMA32 free:25018=
0kB
>>>>> min:4308kB low:5384kB high:6460kB active_anon:1026572kB
>>>>> inactive_anon:257356kB active_file:616152kB inactive_file:612572k=
B
>>>>> unevictable:0kB isolated(anon):0kB isolated(file):0kB
>>>>> present:3098560kB managed:3022260kB mlocked:0kB dirty:4kB
>>>>> writeback:0kB mapped:33232kB shmem:9336kB slab_reclaimable:180492=
kB
>>>>> slab_unreclaimable:12176kB kernel_stack:2496kB pagetables:16872kB
>>>>> unstable:0kB bounce:0kB free_cma:0kB writeback_tmp:0kB pages_scan=
ned:0
>>>>> all_unreclaimable? no
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221840] lowmem_reserve[]=
: 0 0
>>>>> 4714 4714
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221844] Normal free:3574=
32kB
>>>>> min:6884kB low:8604kB high:10324kB active_anon:1779992kB
>>>>> inactive_anon:297440kB active_file:981924kB inactive_file:975108k=
B
>>>>> unevictable:0kB isolated(anon):0kB isolated(file):0kB
>>>>> present:4954112kB managed:4828124kB mlocked:0kB dirty:812kB
>>>>> writeback:0kB mapped:52908kB shmem:13468kB slab_reclaimable:32400=
0kB
>>>>> slab_unreclaimable:24120kB kernel_stack:4160kB pagetables:23776kB
>>>>> unstable:0kB bounce:0kB free_cma:0kB writeback_tmp:0kB
>>>>> pages_scanned:24 all_unreclaimable? no
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221845] lowmem_reserve[]=
: 0 0 0
>>>>> 0
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221847] DMA: 1*4kB (U) 1=
*8kB
>>>>> (U) 1*16kB (U) 0*32kB 2*64kB (U) 1*128kB (U) 1*256kB (U) 0*512kB
>>>>> 1*1024kB (U) 1*2048kB (R) 3*4096kB (M) =3D 15900kB
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221855] DMA32: 52520*4kB
>>>>> (UEM) 5030*8kB (UE) 3*16kB (UR) 0*32kB 1*64kB (R) 0*128kB 0*256kB
>>>>> 0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 250432kB
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221861] Normal: 62961*4k=
B
>>>>> (UEM) 11874*8kB (UEM) 640*16kB (UEMR) 17*32kB (UEMR) 1*64kB (E)
>>>>> 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 357684kB
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221867] Node 0
>>>>> hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0
>>>>> hugepages_size=3D2048kB
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221868] 804788 total pag=
ecache
>>>>> pages
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221869] 2600 pages in sw=
ap
>>>>> cache
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221870] Swap cache stats=
: add
>>>>> 91111, delete 88511, find 38599/41340
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221871] Free swap  =3D 2=
77028kB
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221872] Total swap =3D 5=
94300kB
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221873] 2017164 pages RA=
M
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221873] 0 pages
>>>>> HighMem/MovableOnly
>>>>> Nov  2 03:30:01 krshina3 kernel: [562035.221874] 31497 pages rese=
rved
>>>>>
>>>>>
>>>>>
>>>>>
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.900521] reiser4: md125: =
found
>>>>> disk format 4.0.0.
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.900907] mount: page
>>>>> allocation failure: order:4, mode:0x2040d0
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.900910] CPU: 1 PID: 1414
>>>>> Comm: mount Not tainted 3.16.5-gentoo #1
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.900912] Hardware name:
>>>>> Gigabyte Technology Co., Ltd. To be filled by O.E.M./B75-D3V, BIO=
S F5
>>>>> 07/04/2012
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.900914]  000000000000000=
0
>>>>> ffff880148093968 ffffffff816a31b4 0000000000000007
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.900917]  00000000002040d=
0
>>>>> ffff8801480939f8 ffffffff810e609a ffffffff00000040
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.900919]  000000000000028=
6
>>>>> ffffffff819a8a78 fffffff00000000f ffff8801480939c8
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.900922] Call Trace:
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.900929]  [<ffffffff816a3=
1b4>]
>>>>> dump_stack+0x46/0x58
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.900933]  [<ffffffff810e6=
09a>]
>>>>> warn_alloc_failed+0xda/0x130
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.900937]  [<ffffffff810e8=
6c9>]
>>>>> __alloc_pages_nodemask+0x5d9/0x7a0
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.900941]  [<ffffffff8111f=
16a>]
>>>>> cache_alloc_refill+0x31a/0x550
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.900945]  [<ffffffff8111e=
e23>]
>>>>> kmem_cache_alloc+0xb3/0xe0
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.900948]  [<ffffffff81186=
529>]
>>>>> znodes_tree_init+0xc9/0x120
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.900951]  [<ffffffff8118e=
7b4>]
>>>>> reiser4_init_tree+0x44/0xd0
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.900955]  [<ffffffff811cb=
905>]
>>>>> init_format_format40+0x265/0x5b0
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.900959]  [<ffffffff8119e=
8b1>]
>>>>> fill_super+0x101/0x200
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.900963]  [<ffffffff81126=
be4>]
>>>>> mount_bdev+0x194/0x1d0
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.900966]  [<ffffffff8119e=
7b0>]
>>>>> ? reiser4_mount+0x20/0x20
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.900969]  [<ffffffff8119e=
7a0>]
>>>>> reiser4_mount+0x10/0x20
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.900972]  [<ffffffff81126=
e2b>]
>>>>> mount_fs+0x1b/0xd0
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.900976]  [<ffffffff81140=
42f>]
>>>>> vfs_kern_mount+0x6f/0x130
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.900979]  [<ffffffff81141=
f68>]
>>>>> do_mount+0x218/0xab0
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.900982]  [<ffffffff810e8=
8a2>]
>>>>> ? __get_free_pages+0x12/0x60
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.900986]  [<ffffffff81141=
bf5>]
>>>>> ? copy_mount_options+0x35/0x150
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.900989]  [<ffffffff81142=
ad9>]
>>>>> SyS_mount+0x89/0xd0
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.900993]  [<ffffffff816ab=
1d2>]
>>>>> system_call_fastpath+0x16/0x1b
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.900994] Mem-Info:
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.900996] DMA per-cpu:
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.900997] CPU    0: hi:   =
 0,
>>>>> btch:   1 usd:   0
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.900999] CPU    1: hi:   =
 0,
>>>>> btch:   1 usd:   0
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.901000] CPU    2: hi:   =
 0,
>>>>> btch:   1 usd:   0
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.901001] CPU    3: hi:   =
 0,
>>>>> btch:   1 usd:   0
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.901002] DMA32 per-cpu:
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.901004] CPU    0: hi:  1=
86,
>>>>> btch:  31 usd:   0
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.901005] CPU    1: hi:  1=
86,
>>>>> btch:  31 usd:   0
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.901006] CPU    2: hi:  1=
86,
>>>>> btch:  31 usd:   0
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.901008] CPU    3: hi:  1=
86,
>>>>> btch:  31 usd:   0
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.901009] Normal per-cpu:
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.901010] CPU    0: hi:  1=
86,
>>>>> btch:  31 usd:   0
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.901011] CPU    1: hi:  1=
86,
>>>>> btch:  31 usd:   0
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.901013] CPU    2: hi:  1=
86,
>>>>> btch:  31 usd:  21
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.901014] CPU    3: hi:  1=
86,
>>>>> btch:  31 usd:   0
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.901017] active_anon:7197=
13
>>>>> inactive_anon:145280 isolated_anon:0
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.901017]  active_file:390=
035
>>>>> inactive_file:389999 isolated_file:0
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.901017]  unevictable:0
>>>>> dirty:1180 writeback:0 unstable:0
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.901017]  free:161223
>>>>> slab_reclaimable:112227 slab_unreclaimable:9155
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.901017]  mapped:35966
>>>>> shmem:7263 pagetables:10549 bounce:0
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.901017]  free_cma:0
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.901024] DMA free:15900kB
>>>>> min:20kB low:24kB high:28kB active_anon:0kB inactive_anon:0kB
>>>>> active_file:0kB inactive_file:0kB unevictable:0kB isolated(anon):=
0kB
>>>>> isolated(file):0kB present:15984kB managed:15900kB mlocked:0kB
>>>>> dirty:0kB writeback:0kB mapped:0kB shmem:0kB slab_reclaimable:0kB
>>>>> slab_unreclaimable:0kB kernel_stack:0kB pagetables:0kB unstable:0=
kB
>>>>> bounce:0kB free_cma:0kB writeback_tmp:0kB pages_scanned:0
>>>>> all_unreclaimable? yes
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.901026] lowmem_reserve[]=
: 0
>>>>> 2950 7665 7665
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.901033] DMA32 free:24345=
6kB
>>>>> min:4308kB low:5384kB high:6460kB active_anon:1055312kB
>>>>> inactive_anon:268364kB active_file:605480kB inactive_file:605344k=
B
>>>>> unevictable:0kB isolated(anon):0kB isolated(file):0kB
>>>>> present:3098560kB managed:3022260kB mlocked:0kB dirty:1728kB
>>>>> writeback:0kB mapped:55944kB shmem:11860kB slab_reclaimable:16490=
0kB
>>>>> slab_unreclaimable:12340kB kernel_stack:2496kB pagetables:17284kB
>>>>> unstable:0kB bounce:0kB free_cma:0kB writeback_tmp:0kB pages_scan=
ned:0
>>>>> all_unreclaimable? no
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.901034] lowmem_reserve[]=
: 0 0
>>>>> 4714 4714
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.901040] Normal free:3855=
36kB
>>>>> min:6884kB low:8604kB high:10324kB active_anon:1823540kB
>>>>> inactive_anon:312756kB active_file:954660kB inactive_file:954652k=
B
>>>>> unevictable:0kB isolated(anon):0kB isolated(file):0kB
>>>>> present:4954112kB managed:4828124kB mlocked:0kB dirty:2992kB
>>>>> writeback:0kB mapped:87920kB shmem:17192kB slab_reclaimable:28400=
8kB
>>>>> slab_unreclaimable:24280kB kernel_stack:4368kB pagetables:24912kB
>>>>> unstable:0kB bounce:0kB free_cma:0kB writeback_tmp:0kB
>>>>> pages_scanned:21 all_unreclaimable? no
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.901041] lowmem_reserve[]=
: 0 0 0
>>>>> 0
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.901044] DMA: 1*4kB (U) 1=
*8kB
>>>>> (U) 1*16kB (U) 0*32kB 2*64kB (U) 1*128kB (U) 1*256kB (U) 0*512kB
>>>>> 1*1024kB (U) 1*2048kB (R) 3*4096kB (M) =3D 15900kB
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.901054] DMA32: 46552*4kB=
 (UE)
>>>>> 7159*8kB (U) 2*16kB (R) 0*32kB 1*64kB (R) 0*128kB 0*256kB 0*512kB
>>>>> 0*1024kB 0*2048kB 0*4096kB =3D 243576kB
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.901063] Normal: 40881*4k=
B
>>>>> (UEM) 27461*8kB (UEM) 151*16kB (UR) 2*32kB (R) 0*64kB 0*128kB 0*2=
56kB
>>>>> 0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 385692kB
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.901072] Node 0
>>>>> hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0
>>>>> hugepages_size=3D2048kB
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.901073] 789766 total pag=
ecache
>>>>> pages
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.901075] 2404 pages in sw=
ap
>>>>> cache
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.901076] Swap cache stats=
: add
>>>>> 94924, delete 92520, find 40323/43073
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.901077] Free swap  =3D 2=
61888kB
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.901078] Total swap =3D 5=
94300kB
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.901079] 2017164 pages RA=
M
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.901080] 0 pages
>>>>> HighMem/MovableOnly
>>>>> Nov  2 09:13:48 krshina3 kernel: [582660.901081] 31497 pages rese=
rved
>>>>>
>>>>>
>>>>> Now I'm gonna fsck all partitions and report if anything comes up=
=2E
>>>>>
>>>>> Ask if you need more info
>>>>>
>>>>> Thanks in advance
>>>>> Dushan
>>>>
>>>>
>>>>
>>
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
