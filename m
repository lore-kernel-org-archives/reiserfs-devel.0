From: myciel <myciel@dotcom.pl>
Subject: 2.4.18 & journal_mark_dirty?
Date: Thu, 13 Mar 2003 09:42:30 +0100
Message-ID: <3E704476.9090601@dotcom.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13239-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi All

I run nfs server using reiserfs on 2.4.18 + NFSALL patches, and
I've just got "nice" oops.  System did not crash, but anyway I had to 
reboot to restart nfs.
Could You please tell me if  "journal_mark_dirty:...." in following log 
is harmless or not?


Mar 12 22:07:28 hostname journal-1413: journal_mark_dirty: j_len (1024) 
is too big
Mar 12 22:07:28 hostname invalid operand: 0000
Mar 12 22:07:28 hostname CPU:    0
Mar 12 22:07:28 hostname EIP:    0010:[<c01c3fd8>]    Not tainted
Mar 12 22:07:28 hostname EFLAGS: 00010286
Mar 12 22:07:28 hostname eax: 0000003d   ebx: f65d3400   ecx: f6912000   
edx: e051e08c
Mar 12 22:07:28 hostname esi: f45a19e0   edi: f65d3400   ebp: 00000000   
esp: f6913ad0
Mar 12 22:07:28 hostname ds: 0018   es: 0018   ss: 0018
Mar 12 22:07:28 hostname Process nfsd (pid: 12583, stackpage=f6913000)
Mar 12 22:07:28 hostname Stack: c02a6d77 c0369280 f6913e78 f6913e78 
c01d1d02 f65d3400 c02b9840 00000400 12 22:07:28 hostname 00000000 
f6913e78 0200a4d0 00000000 00000000 f65d3400 000024d0 00000401
Mar 12 22:07:28 hostname 0200a4d0 c01b19f1 f6913e78 f65d3400 f45a19e0 
f49ac000 f49cf4a0 f49b2000
Mar 12 22:07:28 hostname Call Trace: [<c01d1d02>] [<c01b19f1>] 
[<c01cacd1>] [<c01c0f84>] [<c01cb10b>] r 12 22:07:28 hostname 
[<c01cba78>] [<c01cc17e>] [<c01cb5bd>] [<c01b8467>] [<c01b83a0>] 
[<c0156bd3>]  12 22:07:28 hostname [<c014c880>] [<c01a0555>] 
[<c019b8a4>] [<c019a40e>] [<c028fbdf>] [<c019a1fe>]  12 22:07:28 
hostname [<c01057ae>] [<c0199ff0>]
Mar 12 22:07:28 hostname Code: 0f 0b 85 db 74 12 0f b7 43 08 89 04 24 e8 
f6 b2 f7 ff eb 09


sincerely

rafal mycielski


