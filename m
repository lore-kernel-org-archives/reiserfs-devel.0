From: markw@osdl.org
Subject: Re: AS performance with reiser4 on 2.6.3
Date: Fri, 27 Feb 2004 08:56:17 -0800 (PST)
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <200402271656.i1RGuME16838@mail.osdl.org>
References: <16446.13520.5837.193556@laputa.namesys.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
In-Reply-To: <16446.13520.5837.193556@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikita@Namesys.COM
Cc: piggin@cyberone.com.au, reiserfs-list@Namesys.COM, linux-kernel@vger.kernel.org

On 26 Feb, Nikita Danilov wrote:
> markw@osdl.org writes:
>  > Hi Nick,
>  > 
>  > I started getting some results with dbt-2 on 2.6.3 and saw that reiser4
>  > is doing a bit worse with the AS elevator.  Although reiser4 wasn't
>  > doing well to begin with, compared to the other filesystems.  I have
>  > links to the STP results on our 4-ways and 8-ways here:
>  > 	http://developer.osdl.org/markw/fs/dbt2_stp_results.html
> 
> There were no changes between 2.6.2 and 2.6.3 that could affect reiser4
> performance, so it is not clear why numbers are so different. Probably
> results should be averaged over several runs. Also can you run test with
> 
> http://www.namesys.com/snapshots/2004.02.25/extra/e_05-proc-sleep.patch
> 
> applied? To use it turn CONFIG_PROC_SLEEP on (depends on
> CONFIG_FRAME_POINTER), and do "cat /proc/sleep" before and after test
> run.

http://khack.osdl.org/stp/288905/results/

There are a set of /proc/sleep files there from a 4-way system.

Mark
