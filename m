From: "Randy.Dunlap" <rdunlap@xenotime.net>
Subject: Re: [BUG] Reiserfs: reiserfs_panic while running fs stress tests
Date: Thu, 11 May 2006 10:50:06 -0700
Message-ID: <20060511105006.e4811957.rdunlap@xenotime.net>
References: <445ADA05.5000801@in.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28605-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <445ADA05.5000801@in.ibm.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Suzuki <suzuki@in.ibm.com>
Cc: reiserfs-dev@namesys.com, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com, akpm@osdl.org, suparna@in.ibm.com, amitarora@in.ibm.com

On Fri, 05 May 2006 10:22:21 +0530 Suzuki wrote:

> Hi,
> 
> 
> I was working on a reiserfs panic with 2.6.17-rc3, while running fs
> stress tests.

Hi,
What test(s) do you use?

> The panic message looked like :
> 
> " REISERFS: panic (device Null superblock): reiserfs[4248]: assertion
> !(truncate && (REISERFS_I(inode)->i_flags & i_link_saved_truncate_mask)
> ) failed at fs/reiserfs/super.c:328:add_save_link: saved link already re
> exists for truncated inode 13b5a "

Thanks,
---
~Randy
