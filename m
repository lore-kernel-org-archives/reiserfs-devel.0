From: Maciej Matysiak <phoner.reiserfs@blah.pl>
Subject: kernel BUG at prints.c:334
Date: Thu, 02 Jan 2003 17:14:25 +0100
Message-ID: <hhr8bv7cm6.fsf@blah.pl>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12261-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


hi,

reiserfs went mad on one of my machines. it's debian woody, with 2.4.20 kernel.
in system logs i can see:

Jan  1 10:07:44 brzydal smartd: Device: /dev/sdc, Temperature changed 1 degrees to 40 degrees since last reading 
Jan  1 10:27:03 brzydal -- MARK --
Jan  1 10:37:44 brzydal smartd: Device: /dev/sdb, Temperature changed -1 degrees to 46 degrees since last reading 
Jan  1 10:39:34 brzydal smartd: /dev/sdc:Failed to read smart values 
Jan  1 10:39:34 brzydal kernel: < 0xff) 29(c 0x60, s 0x17, l 0, t 0xff) 30(c 0x60, s 0x17, l 0, t 0xff) 31(c 0x60, s 0x17, l 0, t 0xff) 
Jan  1 10:39:34 brzydal kernel: Pending list: 106(c 0x60, s 0x17, l 0), 103(c 0x60, s 0x27, l 0), 67(c 0x60, s 0x27, l 0), 83(c 0x60, s 0x37, l 0)
Jan  1 10:39:34 brzydal kernel: Kernel Free SCB list: 113 195 42 246 224 214 88 71 12 70 95 13 51 61 16 59 98 202 123 222 63 10 76 220 201 192 218 53 54 86 1 209 52 17 90 57 231 
117 30 56 21 19 230 43 91 78 199 223 227 226 9 35 233 6 221 4 37 191 72 108 60 203 243 82 245 242 239 208 116 236 8 206 234 102 3 68 248 194 94 44 207 46 33 93 215 62 237 118 87 
80 36 23 250 114 232 47 5 101 216 126 49 96 39 240 109 189 197 212 32 111 213 190 15 244 229 238 25 89 184 125 58 69 235 131 66 120 247 22 0 124 104 40 65 193 48 81 14 29 31 79 2
11 210 112 74 200 18 225 107 119 97 28 188 219 50 228 251 45 7 20 11 84 73 92 204 85 205 100 130 24 122 41 34 75 196 99 64 38 127 249 55 217 77 115 27 26 198 121 105 110 253 252 
2 185 186 187 180 181 182 183 176 177 178 179 172 173 174 175 168 169 170 171 164 165 166 167 160 161 162 163 156 157 158 159 152 153 154 155 148 149 150 151 144 145 146 147 140 
141 142 143 136 137 138 139 132 133 134 135 128 129 
Jan  1 10:39:34 brzydal kernel: DevQ(0:1:0): 0 waiting
Jan  1 10:39:34 brzydal kernel: DevQ(0:2:0): 0 waiting
Jan  1 10:39:34 brzydal kernel: DevQ(0:3:0): 0 waiting
Jan  1 10:39:34 brzydal kernel: DevQ(0:4:0): 0 waiting
Jan  1 10:39:34 brzydal kernel: DevQ(0:8:0): 0 waiting
Jan  1 10:39:34 brzydal kernel: scsi0:0:1:0: Cmd aborted from QINFIFO
Jan  1 10:39:34 brzydal kernel: aic7xxx_abort returns 0x2002
Jan  1 10:39:34 brzydal kernel: scsi0:0:2:0: Attempting to queue an ABORT message
Jan  1 10:39:34 brzydal kernel: scsi0: Dumping Card State in Command phase, at SEQADDR 0x16d
Jan  1 10:39:34 brzydal kernel: ACCUM = 0x80, SINDEX = 0xa0, DINDEX = 0xe4, ARG_2 = 0x14
Jan  1 10:39:35 brzydal kernel: HCNT = 0x0 SCBPTR = 0xc
Jan  1 10:39:35 brzydal kernel: SCSISEQ = 0x12, SBLKCTL = 0xa
Jan  1 10:39:35 brzydal kernel:  DFCNTRL = 0x4, DFSTATUS = 0x89
Jan  1 10:39:35 brzydal kernel: LASTPHASE = 0x80, SCSISIGI = 0x84, SXFRCTL0 = 0x88
Jan  1 10:39:35 brzydal kernel: SSTAT0 = 0x5, SSTAT1 = 0x2
Jan  1 10:39:35 brzydal kernel: STACK == 0x17b, 0x165, 0x0, 0x35
Jan  1 10:39:35 brzydal kernel: SCB count = 254
Jan  1 10:39:35 brzydal kernel: Kernel NEXTQSCB = 67
Jan  1 10:39:35 brzydal kernel: Card NEXTQSCB = 241
Jan  1 10:39:35 brzydal kernel: QINFIFO entries: 241 103 
Jan  1 10:39:35 brzydal kernel: Waiting Queue entries: 
Jan  1 10:39:35 brzydal kernel: Disconnected Queue entries: 
Jan  1 10:39:35 brzydal kernel: QOUTFIFO entries: 
Jan  1 10:39:35 brzydal kernel: Sequencer Free SCB List: 0 11 3 20 23 8 2 17 13 10 27 14 26 28 15 18 4 31 30 1 24 21 29 7 6 16 22 25 9 5 19 

then the above repeating several times, then:

Jan  1 10:39:35 brzydal kernel: DevQ(0:1:0): 0 waiting
Jan  1 10:39:35 brzydal kernel: DevQ(0:2:0): 0 waiting
Jan  1 10:39:35 brzydal kernel: DevQ(0:3:0): 0 waiting
Jan  1 10:39:35 brzydal kernel: DevQ(0:4:0): 0 waiting
Jan  1 10:39:35 brzydal kernel: DevQ(0:8:0): 0 waiting
Jan  1 10:39:35 brzydal kernel: scsi0:0:3:0: Device is active, asserting ATN
Jan  1 10:39:35 brzydal kernel: Recovery code sleeping
Jan  1 10:39:35 brzydal kernel: Recovery code awake
Jan  1 10:39:35 brzydal kernel: Timer Expired
Jan  1 10:39:35 brzydal kernel: aic7xxx_abort returns 0x2003
Jan  1 10:39:35 brzydal kernel: scsi0:0:1:0: Attempting to queue a TARGET RESET message
Jan  1 10:39:35 brzydal kernel: aic7xxx_dev_reset returns 0x2003
Jan  1 10:39:35 brzydal kernel: scsi0:0:2:0: Attempting to queue a TARGET RESET message
Jan  1 10:39:35 brzydal kernel: aic7xxx_dev_reset returns 0x2003
Jan  1 10:39:35 brzydal kernel: scsi0:0:3:0: Attempting to queue a TARGET RESET message
Jan  1 10:39:35 brzydal kernel: aic7xxx_dev_reset returns 0x2003
Jan  1 10:39:35 brzydal kernel: Recovery SCB completes
Jan  1 10:39:35 brzydal kernel: scsi: device set offline - not ready or command retry failed after bus reset: host 0 channel 0 id 3 lun 0
Jan  1 11:00:29 brzydal kernel:  I/O error: dev 08:21, sector 65704
Jan  1 11:00:29 brzydal kernel: zam-7001: io error in reiserfs_find_entry
Jan  1 11:00:29 brzydal kernel:  I/O error: dev 08:21, sector 65704
Jan  1 11:00:29 brzydal kernel: zam-7001: io error in reiserfs_find_entry

i've just tried to unmount the device. umount segfaulted, but the device is
no longer mounted. in logs i can see:

Jan  2 16:47:44 brzydal kernel: zam-7001: io error in reiserfs_find_entry
Jan  2 16:52:13 brzydal kernel:  I/O error: dev 08:21, sector 64672
Jan  2 16:52:13 brzydal kernel: kernel BUG at prints.c:334!
Jan  2 16:52:13 brzydal kernel: invalid operand: 0000
Jan  2 16:52:13 brzydal kernel: CPU:    0
Jan  2 16:52:13 brzydal kernel: EIP:    0010:[reiserfs_panic+41/96]    Not tainted
Jan  2 16:52:13 brzydal kernel: EFLAGS: 00010282
Jan  2 16:52:13 brzydal kernel: eax: 00000024   ebx: c022fc60   ecx: ceb40000   edx: 00000001
Jan  2 16:52:13 brzydal kernel: esi: cf372c00   edi: 00000000   ebp: cf372c00   esp: ce00fe44
Jan  2 16:52:13 brzydal kernel: ds: 0018   es: 0018   ss: 0018
Jan  2 16:52:13 brzydal kernel: Process umount (pid: 20067, stackpage=ce00f000)
Jan  2 16:52:13 brzydal kernel: Stack: c022e0da c02c68a0 c022fc60 ce00fe68 d0e3c3c4 00000002 c016f40f cf372c00
Jan  2 16:52:13 brzydal kernel:        c022fc60 000013c4 00000012 00000010 00000000 d0e3c3f8 d0e3c3ec 00000003
Jan  2 16:52:13 brzydal kernel:        00000000 0000003b c1931bc0 c0172bbc cf372c00 d0e3c3c4 00000001 ce00ff38
Jan  2 16:52:13 brzydal kernel: Call Trace:    [flush_commit_list+687/928] [do_journal_end+1896/2672] [do_journal_release+37/152] [reiserfs_put_super+74/328] [journal_release+17/
24]
Jan  2 16:52:13 brzydal kernel:   [reiserfs_put_super+84/328] [kill_super+165/220] [__mntput+30/36] [path_release+39/44] [sys_umount+111/124] [sys_munmap+53/84]
Jan  2 16:52:13 brzydal kernel:   [sys_oldumount+12/16] [system_call+51/56]
Jan  2 16:52:13 brzydal kernel:
Jan  2 16:52:13 brzydal kernel: Code: 0f 0b 4e 01 e0 e0 22 c0 68 a0 68 2c c0 85 f6 74 16 0f b7 46

reiserfsck can't do anything:

brzydal:~/ReiserFS/reiserfsprogs-3.6.4/fsck# ./reiserfsck /dev/sdc1

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.6.4
[...]
Do you want to run this program?[N/Yes] (note need to type Yes if you do):Yes

reiserfsck: Cannot not open filesystem on "/dev/sdc1"
Aborted

the disk is:
 Vendor: IBM       Model: IC35L036UWD210-0  Rev: S5BS
 Type:   Direct-Access                      ANSI SCSI revision: 03

Attached scsi disk sdc at scsi0, channel 0, id 3, lun 0

(scsi0:A:3): 80.000MB/s transfers (40.000MHz, offset 63, 16bit)
SCSI device sdc: 71687340 512-byte hdwr sectors (36704 MB)
 sdc: sdc1

it's brand new, just 3 weeks ago installed. it's attached to:

scsi0 : Adaptec AIC7XXX EISA/VLB/PCI SCSI HBA DRIVER, Rev 6.2.8
        <Adaptec 2940B Ultra2 SCSI adapter>
        aic7890/91: Ultra2 Wide Channel A, SCSI Id=7, 32/253 SCBs

what's wrong (disk or kernel?) and what can with this problem?
i'm a bit afraid to reboot the machine at the moment.

 m.m.
-- 
 use gnus, not guns!
