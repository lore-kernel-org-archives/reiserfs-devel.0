From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH] reiserfs: fix __RASSERT format string
Date: Tue, 17 Mar 2015 10:26:44 -0400
Message-ID: <550839A4.9070608@suse.com>
References: <5506D81C.50805@m4x.org> <1426513506-30171-1-git-send-email-nicolas.iooss_linux@m4x.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1426513506-30171-1-git-send-email-nicolas.iooss_linux@m4x.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nicolas Iooss <nicolas.iooss_linux@m4x.org>
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, Jan Kara <jack@suse.cz>

On 3/16/15 9:45 AM, Nicolas Iooss wrote:
> __RASSERT format string does not use the PID argument.
> reiserfs_panic arguments are therefore formatted with the wrong
> format specifier (for example __LINE__ with %s).  This bug was
> introduced when commit c3a9c2109f84 ("reiserfs: rework
> reiserfs_panic") removed a "reiserfs[%i]" prefix.
> 
> This bug is only triggered when using CONFIG_REISERFS_CHECK,
> otherwise __RASSERT is never used.
> 
> Signed-off-by: Nicolas Iooss <nicolas.iooss_linux@m4x.org>
Acked-by: Jeff Mahoney <jeffm@suse.com>

> Fixes: c3a9c2109f84 ("reiserfs: rework reiserfs_panic") --- 
> fs/reiserfs/reiserfs.h | 1 - 1 file changed, 1 deletion(-)
> 
> diff --git a/fs/reiserfs/reiserfs.h b/fs/reiserfs/reiserfs.h index
> bb79cddf0a1f..2adcde137c3f 100644 --- a/fs/reiserfs/reiserfs.h +++
> b/fs/reiserfs/reiserfs.h @@ -910,7 +910,6 @@ do {									\ if
> (!(cond))							\ reiserfs_panic(NULL, "assertion failure", "("
> #cond ") at " \ __FILE__ ":%i:%s: " format "\n",		\ -
> in_interrupt() ? -1 : task_pid_nr(current), \ __LINE__, __func__ ,
> ##args);		\ } while (0)
> 
> 


-- 
Jeff Mahoney
SUSE Labs

