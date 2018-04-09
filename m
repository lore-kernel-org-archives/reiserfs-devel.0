From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH?] reiserfs: prevent panic: don't allow %-char in journal
 dev. name
Date: Mon, 9 Apr 2018 16:34:23 +0200
Message-ID: <20180409143423.oekf73u27v2aviyg@quack2.suse.cz>
References: <d9b518a5-287a-72b3-05f1-ea89e25563ba@infradead.org>
 <20180404184517.9f2b91b856a56f71464f5f7f@linux-foundation.org>
 <5e9ea36a-6a6a-921c-81b3-bc623a9e125a@suse.com>
 <20180409142517.qrorcyng6puk4qed@quack2.suse.cz>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180409142517.qrorcyng6puk4qed@quack2.suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Mahoney <jeffm@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.com>, Frederic Weisbecker <fweisbec@gmail.com>, Artem Bityutskiy <dedekind1@gmail.com>, syzkaller-bugs@googlegroups.com, syzbot+6bd77b88c1977c03f584@syzkaller.appspotmail.com

On Mon 09-04-18 16:25:17, Jan Kara wrote:
> On Wed 04-04-18 21:48:53, Jeff Mahoney wrote:
> > On 4/4/18 9:45 PM, Andrew Morton wrote:
> > > On Wed, 4 Apr 2018 18:25:16 -0700 Randy Dunlap <rdunlap@infradead.org> wrote:
> > > 
> > >> From: Randy Dunlap <rdunlap@infradead.org>
> > >>
> > >> If the reiserfs mount option's journal name contains a '%' character,
> > >> it can lead to a WARN_ONCE() in lib/vsprintf.c::format_decode(),
> > >> saying: "Please remove unsupported %/ in format string."
> > >> That's OK until panic_on_warn is set, at which point it's dead, Jim.
> > >>
> > >> To placate this situation, check the journal name string for a '%'
> > >> character and return an error if one is found. Also print a warning
> > >> (one that won't panic the kernel) about the invalid journal name (e.g.):
> > >>
> > >>   reiserfs: journal device name is invalid: %/file0
> > >>
> > >> (In this example, the caller app specified the journal device name as
> > >> "%/file0".)
> > >>
> > > 
> > > Well, that is a valid filename and we should support it...
> > > 
> > > Isn't the bug in journal_init_dev()?
> > 
> > Yep.  That's exactly it.
> > 
> > Acked-by: Jeff Mahoney <jeffm@suse.com>
> 
> Thanks. I've picked up the patch from Andrew, added his Signed-off-by (OK,
> Andrew?), wrote a proper changelog and pushed it to my tree. The result is
> attached.

Ah, now I've noticed Andrew pushed the patch to his tree. Removing mine and
sorry for the noise.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
