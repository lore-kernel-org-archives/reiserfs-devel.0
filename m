From: "David Dabbs" <david@dabbs.net>
Subject: RE: mongo_copy: cp: cannot stat `/mnt/testfs/testdir0-0-0/f92': Input/output error
Date: Wed, 4 Aug 2004 09:14:49 -0500
Message-ID: <20040804141752.E344D15D07@mail03.powweb.com>
References: <4110A561.9050200@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19981-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4110A561.9050200@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Hans Reiser' <reiser@namesys.com>, "'Vladimir V. Saveliev'" <vs@namesys.com>
Cc: reiserfs-list@namesys.com


This is different from the mount issue, which was fixed by the new code
drop. This was built with 8k stacks.

David


> -----Original Message-----
> From: Hans Reiser [mailto:reiser@namesys.com]
> Sent: Wednesday, August 04, 2004 3:59 AM
> To: Vladimir V. Saveliev
> Cc: David Dabbs; reiserfs-list@namesys.com
> Subject: Re: mongo_copy: cp: cannot stat `/mnt/testfs/testdir0-0-0/f92':
> Input/output error
> 
> Vladimir V. Saveliev wrote:
> 
> > Hello
> >
> > Hans Reiser wrote:
> >
> >> David Dabbs wrote:
> >>
> >>> I was running mongo when the following occurred:
> >>>
> >>> cp: cannot stat `/mnt/testfs/testdir0-0-0/f92': Input/output error
> >>> cp: cannot stat `/mnt/testfs/testdir0-0-0/f93': Input/output error
> >>> cp: cannot stat `/mnt/testfs/testdir0-0-0/f94': Input/output error
> >>> cp: cannot stat `/mnt/testfs/testdir0-0-0/f95': Input/output error
> >>> cp: cannot stat `/mnt/testfs/testdir0-0-0/f97': Input/output error
> >>>
> >>>
> >>> I found the following in the log:
> >>>
> >>> Aug  3 21:59:58 linux kernel: reiser4[cp(10066)]: cbk_level_lookup
> >>> (fs/reiser4/search.c:1033)[vs-3533]:
> >>> Aug  3 21:59:58 linux kernel: WARNING: Keys are inconsistent. Fsck?
> >>> Aug  3 21:59:58 linux kernel: reiser4[cp(10066)]: cbk_level_lookup
> >>> (fs/reiser4/search.c:1033)[vs-3533]:
> >>> Aug  3 21:59:58 linux kernel: WARNING: Keys are inconsistent. Fsck?
> >>> Aug  3 21:59:58 linux kernel: reiser4[cp(10066)]: cbk_level_lookup
> >>> (fs/reiser4/search.c:1033)[vs-3533]:
> >>> Aug  3 21:59:58 linux kernel: WARNING: Keys are inconsistent. Fsck?
> >>> Aug  3 21:59:58 linux kernel: reiser4[cp(10066)]: cbk_level_lookup
> >>> (fs/reiser4/search.c:1033)[vs-3533]:
> >>> Aug  3 21:59:58 linux kernel: WARNING: Keys are inconsistent. Fsck?
> >>> Aug  3 21:59:58 linux kernel: reiser4[cp(10066)]: cbk_level_lookup
> >>> (fs/reiser4/search.c:1033)[vs-3533]:
> >>> Aug  3 21:59:58 linux kernel: WARNING: Keys are inconsistent. Fsck?
> >>> Aug  3 21:59:58 linux kernel: reiser4[cp(10066)]: cbk_level_lookup
> >>> (fs/reiser4/search.c:1033)[vs-3533]:
> >>> Aug  3 21:59:58 linux kernel: WARNING: Keys are inconsistent. Fsck?
> >>> Aug  3 21:59:58 linux kernel: reiser4[cp(10066)]: cbk_level_lookup
> >>> (fs/reiser4/search.c:1033)[vs-3533]:
> >>> Aug  3 21:59:59 linux kernel: WARNING: Keys are inconsistent. Fsck?
> >>> Aug  3 21:59:59 linux kernel: reiser4[cp(10066)]: key_warning
> >>> (fs/reiser4/plugin/object.c:97)[nikita-717]:
> >>> Aug  3 21:59:59 linux kernel: WARNING: Error for inode 661097 (-5)
> >>> Aug  3 21:59:59 linux kernel: reiser4[cp(10066)]:
> >>> write_sd_by_inode_common
> >>> (fs/reiser4/plugin/object.c:480)[nikita-2221]:
> >>> Aug  3 21:59:59 linux kernel: WARNING: Failed to save sd for 661097: -
> 5
> >>> Aug  3 21:59:59 linux kernel: reiser4[cp(10066)]: create_child_common
> >>> (fs/reiser4/plugin/dir/dir.c:499)[nikita-2219]:
> >>> Aug  3 21:59:59 linux kernel: WARNING: Failed to create sd for 661097
> >>> Aug  3 21:59:59 linux kernel: reiser4[cp(10066)]: cbk_level_lookup
> >>> (fs/reiser4/search.c:1033)[vs-3533]:
> >>> Aug  3 21:59:59 linux kernel: WARNING: Keys are inconsistent. Fsck?
> >>> Aug  3 21:59:59 linux kernel: reiser4[cp(10066)]: key_warning
> >>>
> >>> I had been switching back and forth between computers via a kvm
> >>> switch. I
> >>> attempted to reproduce the error by rerunning the benchmark and
> >>> figddling
> >>> with the switch, but was not able to see the same behavior.
> >>>
> >>> Running with latest auto-snapshot and reiser4fsprogs.
> >>>
> >>> David
> >>>
> >>>
> >>>
> >>>
> >>>
> >>>
> >> Well, it seems you found a bug just as we were about to ship.   Sigh.
> >>
> >>
> >
> > Hans, should we solve this before sending reiser4 to Andrew?
> >
> >
> >
> >
> >
> If it is due to 4k stacks, then find a way to ensure that use of reiser4
> turns off 4k stacks before sending to Andrew.
> 
> Hans

