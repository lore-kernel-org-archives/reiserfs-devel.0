From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: Re: KASAN: global-out-of-bounds Write in string
Date: Thu, 5 Apr 2018 20:02:06 +0900
Message-ID: <f1254802-d801-41d6-72ca-33f011e63253@I-love.SAKURA.ne.jp>
References: <000000000000b696800568f4a6c6@google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <000000000000b696800568f4a6c6@google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: dhowells@redhat.com, reiserfs-devel@vger.kernel.org
Cc: syzbot <syzbot+b890b3335a4d8c608963@syzkaller.appspotmail.com>, linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com

On 2018/04/04 2:01, syzbot wrote:
> BUG: KASAN: global-out-of-bounds in string+0x1cb/0x200 lib/vsprintf.c:598
> Write of size 1 at addr ffffffff89e166a0 by task syz-executor0/4522
> 
> CPU: 1 PID: 4522 Comm: syz-executor0 Not tainted 4.16.0+ #12
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Call Trace:
>  __dump_stack lib/dump_stack.c:17 [inline]
>  dump_stack+0x1a7/0x27d lib/dump_stack.c:53
>  print_address_description+0x178/0x250 mm/kasan/report.c:256
>  kasan_report_error mm/kasan/report.c:354 [inline]
>  kasan_report+0x23c/0x360 mm/kasan/report.c:412
>  __asan_report_store1_noabort+0x17/0x20 mm/kasan/report.c:435
>  string+0x1cb/0x200 lib/vsprintf.c:598
>  vsnprintf+0x863/0x1900 lib/vsprintf.c:2282
>  vsprintf+0x2a/0x40 lib/vsprintf.c:2462
>  prepare_error_buf+0x1d2/0x1820 fs/reiserfs/prints.c:240
>  __reiserfs_warning+0xc8/0x1a0 fs/reiserfs/prints.c:267
>  reiserfs_getopt fs/reiserfs/super.c:1044 [inline]
>  reiserfs_parse_options+0x11e5/0x24e0 fs/reiserfs/super.c:1194
>  reiserfs_fill_super+0x520/0x33a0 fs/reiserfs/super.c:1946

> The buggy address belongs to the variable:
>  error_buf+0x400/0x420

I guess this is a buffer overflow bug due to

  static char error_buf[1024];
  char *p = error_buf;
  vsprintf(p, fmt1, args);

at prepare_error_buf(). Need to check available bytes.

> 
> Memory state around the buggy address:
>  ffffffff89e16580: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>  ffffffff89e16600: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> ffffffff89e16680: 00 00 00 00 fa fa fa fa 04 fa fa fa fa fa fa fa
>                                ^
>  ffffffff89e16700: 00 fa fa fa fa fa fa fa 00 fa fa fa fa fa fa fa
>  ffffffff89e16780: 00 fa fa fa fa fa fa fa 00 fa fa fa fa fa fa fa
> ==================================================================
