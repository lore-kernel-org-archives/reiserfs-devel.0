From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29162] Reiserfs hang with dataloss sometimes
Date: Tue, 14 Jun 2011 09:16:44 GMT
Message-ID: <201106140916.p5E9GilV021876@demeter1.kernel.org>
References: <bug-29162-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-29162-695@https.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=29162





--- Comment #33 from roucaries.bastien+kernel@gmail.com  2011-06-14 09:16:04 ---
@Jeff Mahoney It seems that in 90% of the case a background  deconnected (aka
cached) imap to a 6G google mail account is the good way to trigger this bug.

In all cases thanks to try to trigger. Can I test some patch ?

Bastien

My lsmod is case:

Module                  Size  Used by
nls_utf8                1256  0 
nls_cp437               5841  0 
vfat                    8039  0 
fat                    40599  1 vfat
acpi_cpufreq            5351  1 
mperf                   1259  1 acpi_cpufreq
cpufreq_powersave        942  0 
cpufreq_stats           2633  0 
cpufreq_userspace       2032  0 
cpufreq_conservative     7646  0 
parport_pc             18869  0 
ppdev                   5139  0 
lp                      7966  0 
parport                25742  3 parport_pc,ppdev,lp
rfcomm                 28534  0 
sco                     7563  2 
bnep                    9960  2 
l2cap                  30438  6 rfcomm,bnep
crc16                   1327  1 l2cap
binfmt_misc             6573  1 
uinput                  6942  1 
fuse                   54779  1 
nfsd                  257368  2 
exportfs                3130  1 nfsd
nfs                   242558  0 
lockd                  57791  2 nfsd,nfs                                        
fscache                29223  1 nfs                                             
nfs_acl                 2055  2 nfsd,nfs                                        
auth_rpcgss            33940  2 nfsd,nfs                                        
sunrpc                159774  6 nfsd,nfs,lockd,nfs_acl,auth_rpcgss              
tun                    12546  2                                                 
ext3                  106517  1 
jbd                    37104  1 ext3
mbcache                 5104  1 ext3
loop                   13835  0 
dm_crypt               10527  0 
snd_hda_codec_idt      45867  1 
snd_hda_intel          19434  4 
snd_hda_codec          62429  2 snd_hda_codec_idt,snd_hda_intel
snd_hwdep               5484  1 snd_hda_codec
snd_pcm_oss            32140  0 
snd_mixer_oss          12767  1 snd_pcm_oss
snd_pcm                61869  4 snd_hda_intel,snd_hda_codec,snd_pcm_oss
arc4                    1330  2 
snd_seq_midi            4486  0 
ecb                     1881  2 
snd_rawmidi            15945  1 snd_seq_midi
i915                  293539  2 
snd_seq_midi_event      4786  1 snd_seq_midi
btusb                   9679  0 
b43                   149467  0 
uvcvideo               51688  0 
bluetooth              44517  7 sco,rfcomm,bnep,l2cap,btusb
rng_core                3118  1 b43
mac80211              168449  1 b43
snd_seq                42518  3 snd_seq_midi,snd_seq_midi_event
drm_kms_helper         22053  1 i915
drm                   152749  3 i915,drm_kms_helper
videodev               54054  1 uvcvideo
i2c_algo_bit            4105  1 i915
i2c_i801                7318  0 
tpm_tis                 7141  0 
v4l1_compat            11622  2 uvcvideo,videodev
v4l2_compat_ioctl32     9011  1 videodev
snd_timer              16304  2 snd_pcm,snd_seq
snd_seq_device          4531  3 snd_seq_midi,snd_rawmidi,snd_seq
cfg80211              114501  2 b43,mac80211
dell_wmi                1421  0 
dell_laptop             7308  0 
tpm                     9907  1 tpm_tis
video                  11139  1 i915
joydev                  9160  0 
dcdbas                  4928  1 dell_laptop
serio_raw               3726  0 
sparse_keymap           2400  1 dell_wmi
i2c_core               16458  6
i915,drm_kms_helper,drm,videodev,i2c_algo_bit,i2c_i801
tpm_bios                4709  1 tpm
rfkill                 13886  4 bluetooth,dell_laptop,cfg80211
evdev                   8115  28 
pcspkr                  1739  0 
output                  1764  1 video
snd                    47164  19
snd_hda_codec_idt,snd_hda_intel,snd_hda_codec,snd_hwdep,snd_pcm_oss,snd_mixer_oss,snd_pcm,snd_rawmidi,snd_seq,snd_timer,snd_seq_device
psmouse                45290  0 
wmi                     7204  1 dell_wmi
battery                 5710  0 
ac                      2280  0 
shpchp                 21923  0 
soundcore               4614  1 snd
power_supply            7683  3 dell_laptop,battery,ac
processor              25140  3 acpi_cpufreq
button                  4722  1 i915
pci_hotplug            19711  1 shpchp
snd_page_alloc          6321  2 snd_hda_intel,snd_pcm
reiserfs              194515  2 
raid10                 18667  0 
raid456                44185  0 
async_raid6_recov       5027  1 raid456
async_pq                3471  2 raid456,async_raid6_recov
raid6_pq               77179  2 async_raid6_recov,async_pq
async_xor               2305  3 raid456,async_raid6_recov,async_pq
xor                     4228  1 async_xor
async_memcpy            1222  2 raid456,async_raid6_recov
async_tx                1950  5
raid456,async_raid6_recov,async_pq,async_xor,async_memcpy
raid1                  18177  0 
raid0                   7145  0 
multipath               5745  0 
linear                  3399  0 
md_mod                 79839  6 raid10,raid456,raid1,raid0,multipath,linear
dm_mirror              11770  0 
dm_region_hash          6672  1 dm_mirror
dm_log                  7693  2 dm_mirror,dm_region_hash
dm_mod                 56131  3 dm_crypt,dm_mirror,dm_log
btrfs                 412190  0 
zlib_deflate           17650  1 btrfs
crc32c                  2600  1 
libcrc32c               1114  1 btrfs
usbhid                 30874  0 
hid                    65142  1 usbhid
sg                     19095  0 
sd_mod                 28370  5 
sr_mod                 12759  0 
cdrom                  29865  1 sr_mod
crc_t10dif              1300  1 sd_mod
uas                     6917  0 
usb_storage            39639  0 
uhci_hcd               18426  0 
ahci                   19409  4 
libahci                15973  1 ahci
libata                143334  2 ahci,libahci
ssb                    37554  1 b43
ehci_hcd               31486  0 
mmc_core               54857  2 b43,ssb
sky2                   39697  0 
scsi_mod              154687  6 sg,sr_mod,sd_mod,uas,usb_storage,libata
pcmcia                 29451  2 b43,ssb
usbcore               118919  8
btusb,uvcvideo,usbhid,uas,usb_storage,uhci_hcd,ehci_hcd
pcmcia_core            10413  1 pcmcia
thermal                 7538  0 
nls_base                6369  5 nls_utf8,nls_cp437,vfat,fat,usbcore
thermal_sys            11764  3 video,processor,thermal

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
