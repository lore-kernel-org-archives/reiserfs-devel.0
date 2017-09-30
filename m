From: Shankara Pailoor <sp3485@columbia.edu>
Subject: Re: Hung Task Linux 4.13-rc7 Reiserfs
Date: Sat, 30 Sep 2017 15:20:25 -0400
Message-ID: <CAASgV=tjsY1tdxryj_3_TeA_N_SjbXUoUfVd8fu33+dHTx13tw@mail.gmail.com>
References: <CAASgV=sdweCbYxZRn3RR_gEm5qzyjLRHq+Ctk1vTD0yj5VjjLw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <CAASgV=sdweCbYxZRn3RR_gEm5qzyjLRHq+Ctk1vTD0yj5VjjLw@mail.gmail.com>
Sender: owner-linux-mm@kvack.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LKML <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org, linux-mm@kvack.org
Cc: Andrew Zhu Aday <andrew.aday@columbia.edu>, syzkaller <syzkaller@googlegroups.com>

Hi,

I have a reproducer program. It takes about 3-5 minutes to trigger the
hang. The only calls are mmap, open, write, and readahead and the
writes are fairly small (512 bytes).

Reproducer Program: https://pastebin.com/cx1cgABc
Report: https://pastebin.com/uGTAw45E
Logs: https://pastebin.com/EaiE0JLf
Kernel Configs: https://pastebin.com/i6URdADw

Regards,
Shankara

On Fri, Sep 29, 2017 at 11:56 PM, Shankara Pailoor <sp3485@columbia.edu> wrote:
> Hi,
>
> I am fuzzing the kernel 4.13-rc7 with Syzkaller with Reiserfs. I am
> getting the following crash:
>
> INFO: task kworker/0:3:1103 blocked for more than 120 seconds.
>
>
> Here is the full stack trace. I noticed that there are a few tasks
> holding a sbi->lock. Below are a report and a log of all the programs
> executing at the time of the incident.
>
>
> Report: https://pastebin.com/uGTAw45E
> Logs: https://pastebin.com/EaiE0JLf
> Kernel Configs: https://pastebin.com/i6URdADw
>
> I don't have a reproducer yet and any assistance would be appreciated.
>
> Regards,
> Shankara

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
