From: Mat <jackdachef@gmail.com>
Subject: vs-13070: =?utf-8?b?cmVpc2VyZnNfcmVhZF9sb2NrZWRfaW5vZGU=?= during backup (rsync) & much load on VFS
Date: Mon, 25 Aug 2008 13:27:08 +0000 (UTC)
Message-ID: <loom.20080825T132117-502@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hi Edward,

I just got the above mentioned error message during a backup from a reiserfs
partition to another one (both encrypted using cryptsetup-luks & dm):

vs-13070: reiserfs_read_locked_inode

the settings of VFS I were using were:

echo "10" > /proc/sys/vm/page-cluster
echo "60" > /proc/sys/vm/swappiness
echo "3000" > /proc/sys/vm/dirty_expire_centisecs
echo "6000"  > /proc/sys/vm/dirty_writeback_centisecs
echo "15" > /proc/sys/vm/dirty_background_ratio (in this case it was temporarily
set to "20")
echo "50"   > /proc/sys/vm/dirty_ratio 
echo "25" > /proc/sys/vm/vfs_cache_pressure

the i/o-scheduler is anticipatory (I found out that it performs best that way
with reiser4 & reiserfs)

tweaked settings for anticipatory were:
for i in /sys/block/sd*; do
         /bin/echo "0" >  $i/queue/iosched/antic_expire
done

for i in /sys/block/sd*; do
         /bin/echo "150" >  $i/queue/iosched/read_expire
done

for i in /sys/block/sd*; do
         /bin/echo "750" >  $i/queue/iosched/read_batch_expire
done

# applicable to anticipatory scheduler:
for i in /sys/block/sd*; do
         /bin/echo "1200" >  $i/queue/iosched/write_batch_expire
done

before this error message I had run a shorter backup-queue with rsync syncing
only about 15 directories

below you'll find the error-messages:

dmesg
S: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11121.553547] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11121.556159] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11121.558109] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11121.560772] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11121.562823] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11121.565309] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11121.580503] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11121.582814] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11121.663373] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11121.666232] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11121.721539] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11121.723713] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11121.832399] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11121.835273] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11121.837567] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11121.839880] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11121.904665] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11121.907047] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11121.909316] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11121.911639] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11121.958033] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11121.961002] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11122.098776] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11122.100761] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11122.103397] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11122.105573] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11122.190676] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11122.194029] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11122.276801] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11122.279648] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11122.353241] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11122.356047] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11122.397172] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11122.399571] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11122.473560] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11122.475880] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11122.597531] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11122.600874] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11122.603187] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11122.605502] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11122.668004] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11122.670320] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11122.760597] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11122.762912] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11122.811523] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11122.813838] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11122.890031] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11122.893083] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11122.945775] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11122.948098] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11123.023999] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11123.026799] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11123.163373] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11123.166232] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11123.241572] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11123.244391] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11123.300461] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11123.311029] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11123.380967] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11123.383283] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11123.508195] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11123.511139] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11123.644613] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11123.647376] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11123.650019] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11123.652343] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11123.670388] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11123.672630] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11123.737446] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11123.739761] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11123.827726] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11123.830041] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11123.885376] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11123.888454] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11124.019226] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11124.022168] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11124.024483] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11124.027344] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11124.085174] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11124.087529] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11124.142541] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11124.144856] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11124.311522] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11124.313838] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11124.316153] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11124.318468] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11124.380681] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11124.383280] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11124.451240] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11124.453062] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11124.494393] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11124.496707] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11124.559207] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11124.561522] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11124.621271] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11124.624564] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11124.676624] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11124.679576] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11124.721365] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11124.723560] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11124.774718] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11124.776800] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11124.854033] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11124.855991] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11124.966615] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11124.968930] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11124.971244] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11124.973558] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11125.047664] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11125.049948] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11125.128342] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11125.130964] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11125.264745] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11125.267539] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11125.318466] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11125.320782] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11125.380778] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11125.383279] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11125.447703] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11125.450953] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11125.500711] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11125.503642] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11125.612398] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11125.614761] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11125.693466] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11125.695782] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11125.737982] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11125.740305] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11125.781407] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11125.783745] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11125.859503] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11125.862445] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11125.996593] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11125.999020] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.054577] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.056893] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.297172] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.300481] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.302806] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.305121] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.307436] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200317 208109 0x0 SD]
[11126.309751] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200317 208109 0x0 SD]
[11126.312066] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200317 208109 0x0 SD]
[11126.314380] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200317 208109 0x0 SD]
[11126.348559] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.350874] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.353188] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.355503] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.363787] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.366206] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.368301] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.370383] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.372324] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.374288] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.377310] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.379403] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.487959] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.490305] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.492621] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200318 208978 0x0 SD]
[11126.494936] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.583771] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.585469] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.587528] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.589842] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.681539] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.684205] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.686520] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.688834] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.695751] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200318 363446 0x0 SD]
[11126.698077] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.700381] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200318 363447 0x0 SD]
[11126.702226] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.747724] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.750138] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.752114] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.754099] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.756087] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.763318] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.765196] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.767946] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200318 362084 0x0 SD]
[11126.769842] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200318 362084 0x0 SD]
[11126.772715] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.775028] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.777343] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.779441] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.781548] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.783741] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.786211] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.788907] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.791231] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.793547] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.795861] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.798176] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.800142] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.802783] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.805114] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.807434] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.809751] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.811674] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.814380] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.816695] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.819010] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.821325] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.823639] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.825956] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.828258] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.830583] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.832899] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200318 362110 0x0 SD]
[11126.835213] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200318 362110 0x0 SD]
[11126.837694] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.839297] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.841914] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.844027] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.846244] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.848559] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.850871] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.853186] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.855501] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.857794] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.860109] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.862464] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.864760] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200318 25847 0x0 SD]
[11126.867075] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200318 25847 0x0 SD]
[11126.869390] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.872250] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.874566] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.876881] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.879195] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.883279] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.885593] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.887908] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.934372] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200318 362084 0x0 SD]
[11126.937156] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200318 362084 0x0 SD]
[11126.938927] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.941152] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.943466] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11126.946418] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11127.219471] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11127.221786] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11127.224102] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11127.226417] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11127.292969] __ratelimit: 1230 callbacks suppressed
[11127.292969] Buffer I/O error on device dm-2, logical block 36069176
[11127.292969] lost page write due to I/O error on dm-2
[11127.292969] Buffer I/O error on device dm-2, logical block 35295748
[11127.292969] lost page write due to I/O error on dm-2
[11127.295182] Buffer I/O error on device dm-2, logical block 55869541
[11127.295280] lost page write due to I/O error on dm-2
[11127.295280] Buffer I/O error on device dm-2, logical block 55867407
[11127.295280] lost page write due to I/O error on dm-2
[11127.295280] Buffer I/O error on device dm-2, logical block 55856562
[11127.295280] lost page write due to I/O error on dm-2
[11127.295280] Buffer I/O error on device dm-2, logical block 59117662
[11127.295280] lost page write due to I/O error on dm-2
[11127.295280] Buffer I/O error on device dm-2, logical block 36070229
[11127.295280] lost page write due to I/O error on dm-2
[11127.295280] Buffer I/O error on device dm-2, logical block 36070222
[11127.295280] lost page write due to I/O error on dm-2
[11127.295280] Buffer I/O error on device dm-2, logical block 55915788
[11127.295280] lost page write due to I/O error on dm-2
[11127.295280] Buffer I/O error on device dm-2, logical block 55958340
[11127.295280] lost page write due to I/O error on dm-2
[11127.336981] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11127.339297] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11127.394850] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11127.397168] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11127.547630] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11127.549945] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11127.619842] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11127.621735] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11127.635578] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11127.693469] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11127.696342] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11127.735775] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11127.737349] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11127.783187] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11127.785501] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11127.787816] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11127.790576] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11127.882724] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11127.885092] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11127.938260] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200318 362110 0x0 SD]
[11127.941048] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200318 362110 0x0 SD]
[11128.010037] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11128.012353] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11128.262324] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11128.264639] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11128.343371] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11128.345686] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11128.399850] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11128.402023] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11128.404107] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11128.406339] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11128.408464] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11128.410949] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11128.648927] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200318 25847 0x0 SD]
[11128.651242] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200318 25847 0x0 SD]
[11128.683274] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11128.686368] ReiserFS: dm-2: warning: zam-7001: io error in reiserfs_find_entry
[11128.817978] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [25248 38367 0x0 SD]
[11128.820223] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [25248 26122 0x0 SD]
[11128.822772] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [25248 26123 0x0 SD]
[11128.825080] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [25248 26124 0x0 SD]
[11128.831756] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [25248 26125 0x0 SD]
[11128.834073] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [25248 26126 0x0 SD]
[11128.836388] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [25248 26127 0x0 SD]
[11128.838703] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200319 209657 0x0 SD]
[11128.841718] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200319 209658 0x0 SD]
[11128.843755] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200319 208630 0x0 SD]
[11128.847975] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200319 208630 0x0 SD]
[11128.850279] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200319 208631 0x0 SD]
[11128.852587] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200319 208631 0x0 SD]
[11128.854906] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200319 208630 0x0 SD]
[11128.857221] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200319 208630 0x0 SD]
[11128.860791] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200319 208631 0x0 SD]
[11128.863205] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200319 208631 0x0 SD]
[11128.895451] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200320 209782 0x0 SD]
[11128.899151] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200320 209783 0x0 SD]
[11128.901300] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200320 209784 0x0 SD]
[11128.903567] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200320 209785 0x0 SD]
[11128.908185] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200320 209786 0x0 SD]
[11128.910457] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200320 209787 0x0 SD]
[11128.912777] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200320 209788 0x0 SD]
[11128.915092] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200320 209789 0x0 SD]
[11129.070203] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200320 209790 0x0 SD]
[11129.072939] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200320 209791 0x0 SD]
[11129.075284] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200320 209792 0x0 SD]
[11129.077522] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200320 209793 0x0 SD]
[11129.079909] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200320 209794 0x0 SD]
[11129.114182] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200320 209795 0x0 SD]
[11129.419760] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200320 209796 0x0 SD]
[11129.425465] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200320 209797 0x0 SD]
[11129.428285] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [25253 38368 0x0 SD]
[11129.430499] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [25253 38369 0x0 SD]
[11129.432740] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200321 209798 0x0 SD]
[11129.494165] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200321 209799 0x0 SD]
[11129.496933] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200321 209800 0x0 SD]
[11129.499766] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200321 209801 0x0 SD]
[11129.502523] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200321 209802 0x0 SD]
[11129.504798] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [200321 209803 0x0 SD]
[11130.308632] ReiserFS: dm-2: warning: vs-13070: reiserfs_read_locked_inode:
i/o failure occurred trying to find stat data of [2 223587 0x0 SD]

I hope you can tell what to do next

Many thanks in advance

Mat

