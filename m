From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: linux-2.6.20-rc4-mm1 Reiser4 filesystem freeze and corruption
Date: Sat, 20 Jan 2007 03:34:07 +0300
Message-ID: <200701200334.07690.vs@namesys.com>
References: <1169229490.6266.11.camel@oberon>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932788AbXASXei@vger.kernel.org>
In-Reply-To: <1169229490.6266.11.camel@oberon>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Zan Lynx <zlynx@acm.org>
Cc: reiserfs-list@namesys.com, Linux kernel mailing list <linux-kernel@vger.kernel.org>

Hello

On Friday 19 January 2007 20:58, Zan Lynx wrote:
> I have been running 2.6.20-rc2-mm1 without problems, but both rc3-mm1
> and rc4-mm1 have been giving me these freezes.  They were happening
> inside X and without external console it was impossible to get anything,
> plus I was reluctant to test it since the freeze sometimes requires a
> full fsck.reiser4 --build-fs to recover the filesystem.
> 
> But I finally got some output in a console session.  I wasn't able to
> get it all, I made some notes of what I think the problem is.  I may try
> again later once I get netconsole working (netconsole fails as a
> built-in, I'll try it as a module next).
> 
> 1 lock held by pdflush/185:
> #0: (&type->s_umount_key#15) ... writeback_inodes+0x89
> 
> 3 locks held by realsync/12942:
> #0: (&type->s_umount_key#15) at ... __sync_inodes+0x78
> #1: (&mgr->commit_mutex) ... reiser4_txn_end+0x37a
> #2: (&qp->mutex) ... synchronize_qrcu+0x19
> 
> So, I *think* the problem is two locks on s_umount_key#15.  Does that
> sound likely?  I also noticed QRCU may be involved.
> 
> Perhaps someone will look at this and instantly know what the problem
> is.
> 
> If not, I'll be following up with more details like .config and perhaps
> a full sysrq-T dump as soon as that fsck finishes.
> 
yes, please provide more information. Full kernel output at time of freeze is very desirable.
