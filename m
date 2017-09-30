From: Shankara Pailoor <sp3485@columbia.edu>
Subject: Hung Task Linux 4.13-rc7 Reiserfs
Date: Fri, 29 Sep 2017 23:56:30 -0400
Message-ID: <CAASgV=sdweCbYxZRn3RR_gEm5qzyjLRHq+Ctk1vTD0yj5VjjLw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LKML <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org
Cc: Andrew Zhu Aday <andrew.aday@columbia.edu>, syzkaller <syzkaller@googlegroups.com>

Hi,

I am fuzzing the kernel 4.13-rc7 with Syzkaller with Reiserfs. I am
getting the following crash:

INFO: task kworker/0:3:1103 blocked for more than 120 seconds.


Here is the full stack trace. I noticed that there are a few tasks
holding a sbi->lock. Below are a report and a log of all the programs
executing at the time of the incident.


Report: https://pastebin.com/uGTAw45E
Logs: https://pastebin.com/EaiE0JLf
Kernel Configs: https://pastebin.com/i6URdADw

I don't have a reproducer yet and any assistance would be appreciated.

Regards,
Shankara

