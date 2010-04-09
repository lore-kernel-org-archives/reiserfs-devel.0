From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH #3] reiserfs: Fix permissions on .reiserfs_priv
Date: Thu, 08 Apr 2010 20:04:28 -0400
Message-ID: <4BBE6F0C.6020207@suse.com>
References: <4BBE42A9.2010506@suse.com>  <4BBE4CE2.8030805@gmail.com> <1270766367.3441.4.camel@mattlaptop2.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1270766367.3441.4.camel@mattlaptop2.local>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matt McCutchen <matt@mattmccutchen.net>
Cc: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Edward Shishkin <edward.shishkin@gmail.com>, Andrew Morton <akpm@linux-foundation.org>

On 04/08/2010 06:39 PM, Matt McCutchen wrote:
> On Thu, 2010-04-08 at 23:38 +0200, Edward Shishkin wrote:
>> Jeff Mahoney wrote:
>>>  [...] This patch resolves the issue by properly hiding .reiserfs_priv. This
>>>  was the intent of the xattr poisoning code, but it appears to have
>>>  never worked as expected. This is fixed by using d_revalidate instead
>>>  of d_compare. [...]
> 
> The patch seems to rely on the fact that the priv_root dentry is stuck
> in the dcache for as long as the filesystem is mounted, so that attempts
> to follow ".reiserfs_priv" are guaranteed to match that dentry in the
> cache and be refused by xattr_hide_revalidate.  Is my understanding
> correct?
> 

Yes. The other half of it is that the priv_root dentry being stuck in
the dcache for as long as the flie system is mounted is a guaranteed
since REISERFS_SB(sb) holds a reference to it until reiserfs_kill_sb is
called.

-Jeff

-- 
Jeff Mahoney
SuSE Labs
