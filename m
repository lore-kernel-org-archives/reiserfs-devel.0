From: Paavo Hartikainen <pahartik@sci.fi>
Subject: Still unable to use ReiserFS on PowerPC [Oops]
Date: Fri, 10 Sep 2004 01:45:49 +0300
Sender: Paavo Hartikainen <pahartik@pumbaa>
Message-ID: <878ybjqcwy.fsf@sci.fi>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21652-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On PowerPC, I have never got ReiserFS working.  It breaks apart when
trying to copy contents to ReiserFS from existing Ext3 filesystem.  I
tried this about one year ago (PowerPC 603e, latest Linux 2.4 kernel
back then), and now again (PowerPC 604e, Linux 2.4.27 kernel) with
same results.

Mounting with

  mount /dev/scsi/host1/bus0/target4/lun0/part2 /mnt/

It looks like this on "dmesg":

---
SCSI device sdb: 2134305 512-byte hdwr sectors (1093 MB)
 /dev/scsi/host1/bus0/target4/lun0: [mac] p1 p2 p3
reiserfs: found format "3.6" with standard journal
reiserfs: checking transaction log (device sd(8,18)) ...
for (sd(8,18))
sd(8,18):Using r5 hash to sort names
---

Then I try to copy filesystem contents with

  time nice sudo cp -ax / /mnt/

Everything starts as expected, but after 90 seconds this ends up with
segmentation fault.  By using "dmesg | ksymoops", I managed to extract
this:

---
ksymoops 2.4.9 on ppc 2.4.27.  Options used
     -V (default)
     -k /proc/ksyms (default)
     -l /proc/modules (default)
     -o /lib/modules/2.4.27/ (default)
     -m /boot/System.map-2.4.27 (default)

Warning: You did not tell me where to find symbol information.  I will
assume that the log matches the kernel and modules that are running
right now and I'll use the default options above for symbol resolution.
If the current kernel and/or modules do not match the log, you can get
more accurate output by telling me the kernel version and where to find
map, modules, ksyms etc.  ksymoops -h explains the options.

Warning (compare_maps): mismatch on symbol xchg_u32  , ksyms_base says c000b1c4, System.map says c00062b8.  Ignoring ksyms_base entry
Oops: kernel access of bad area, sig: 11
NIP: C90EC0BC XER: 00000000 LR: C90EC708 SP: C3CDFA70 REGS: c3cdf9c0 TRAP: 0300    Not tainted
Using defaults from ksymoops -t elf32-powerpc -a powerpc:common
MSR: 00009032 EE: 1 PR: 0 FP: 0 ME: 1 IR/DR: 11
TASK = c3cde000[640] 'cp' Last syscall: 4 
last math c3cde000 last altivec 00000000
GPR00: C8844000 C3CDFA70 C3CDE000 73000000 00000007 C3CDFAD8 00008000 00000001 
GPR08: 00000001 00000038 00000000 00003246 00000000 10025914 00000001 C3CDFE90 
GPR16: 00000001 C3CDFD40 00000000 00000000 00000000 C3CDFC10 00000001 00000007 
GPR24: 00000001 00000001 00008000 C4354400 C3CDFC10 C3CDFAD8 C8844038 00000007 
Call backtrace: 
00000000 C90EC708 C90ED780 C90F6358 C003BD38 C003C718 C90FACB4 
C002AEE0 C002B540 C003866C C0003C3C 6C696173 10008B8C 100040B4 
10005704 10003CC4 10005AEC 10003CC4 10005AEC 10003CC4 10005AEC 
100064A4 1000310C 10003ACC 0FE97100 00000000 
Warning (Oops_read): Code line not seen, dumping what data is available


>>NIP; c90ec0bc <[reiserfs]scan_bitmap_block+5c/540>   <=====

>>GPR0; c8844000 <[advansys].data.end+2b65/6bc5>
>>GPR1; c3cdfa70 <_end+3aae864/85f9e54>
>>GPR2; c3cde000 <_end+3aacdf4/85f9e54>
>>GPR5; c3cdfad8 <_end+3aae8cc/85f9e54>
>>GPR15; c3cdfe90 <_end+3aaec84/85f9e54>
>>GPR17; c3cdfd40 <_end+3aaeb34/85f9e54>
>>GPR21; c3cdfc10 <_end+3aaea04/85f9e54>
>>GPR27; c4354400 <_end+41231f4/85f9e54>
>>GPR28; c3cdfc10 <_end+3aaea04/85f9e54>
>>GPR29; c3cdfad8 <_end+3aae8cc/85f9e54>
>>GPR30; c8844038 <[advansys].data.end+2b9d/6bc5>

Trace; 00000000 Before first symbol
Trace; c90ec708 <[reiserfs]scan_bitmap+168/23c>
Trace; c90ed780 <[reiserfs]reiserfs_allocate_blocknrs+7a8/910>
Trace; c90f6358 <[reiserfs]reiserfs_get_block+488/1660>
Trace; c003bd38 <__block_prepare_write+1f8/384>
Trace; c003c718 <block_prepare_write+34/68>
Trace; c90facb4 <[reiserfs]reiserfs_prepare_write+8c/a0>
Trace; c002aee0 <do_generic_file_write+244/474>
Trace; c002b540 <generic_file_write+1a0/1d4>
Trace; c003866c <sys_write+b4/148>
Trace; c0003c3c <ret_from_syscall_1+0/b4>
Trace; 6c696173 Before first symbol
Trace; 10008b8c Before first symbol
Trace; 100040b4 Before first symbol
Trace; 10005704 Before first symbol
Trace; 10003cc4 Before first symbol
Trace; 10005aec Before first symbol
Trace; 10003cc4 Before first symbol
Trace; 10005aec Before first symbol
Trace; 10003cc4 Before first symbol
Trace; 10005aec Before first symbol
Trace; 100064a4 Before first symbol
Trace; 1000310c Before first symbol
Trace; 10003acc Before first symbol
Trace; 0fe97100 Before first symbol
Trace; 00000000 Before first symbol


3 warnings issued.  Results may not be reliable.
---

Same thing happens when I tried to copy
"/usr/src/kernel-source-2.4.27" to empty ReiserFS.  Any attempt to
access mounted ReiserFS filesystem will hang after that, and I have to
reboot to get back to it.  I have heard that some persons are using
ReiserFS on PowerPC but I have not seen it myself.  Also, I have seen
<URL:http://www.namesys.com/faq.html#non-i386> but I have not bothered
to try on my Alpha or SPARC hosts since I prefer uptime.

-- 
 "pienena   /  Paavo "Rainbow Rat" Hartikainen
  minusta  /  E-mail: pahartik@sci.fi
  tulee   /  URL: http://www.sci.fi/~pahartik/
  rotta" /  EFnet: pahartik at #Atari and #LionKing
