From: butdiene <butdiene@yahoo.com>
Subject: Re: reiser4 firefox hangs due to fsync, sysrq-t dump
Date: Thu, 10 Jan 2008 19:56:40 -0800 (PST)
Message-ID: <14749379.post@talk.nabble.com>
References: <14514445.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <14514445.post@talk.nabble.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org


follow up,

/proc/mounts:

/dev/root / reiser4
rw,atom_max_size=0x200,atom_max_age=0x927c0,atom_min_size=0x100,atom_max_flushers=0x1,cbk_cache_slots=0x10
0 0

kernel messages:

http://www.nabble.com/file/p14749379/kernel-messages2.bz2
kernel-messages2.bz2 

vmstat
http://www.nabble.com/file/p14749379/vmstat_output.bz2 vmstat_output.bz2 

firefox still hangs with "sync"


butdiene wrote:
> 
> Hi,
> 
> the file contains several sysrq-t dumps when firefox hangs,
> 
>  http://www.nabble.com/file/p14514445/reiser4-sysrq-t.txt.bz2
> reiser4-sysrq-t.txt.bz2 
> 
> thanks!
> 

-- 
View this message in context: http://www.nabble.com/reiser4-firefox-hangs-due-to-fsync%2C-sysrq-t-dump-tp14514445p14749379.html
Sent from the ReiserFS - General mailing list archive at Nabble.com.

