From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH] reiserfs: fix corruption introduced by balance_leaf
 refactor
Date: Tue, 5 Aug 2014 23:19:08 +0200
Message-ID: <20140805211908.GA13523@quack.suse.cz>
References: <53E01C93.4050801@suse.com>
 <20140805083902.GA19945@quack.suse.cz>
 <CAAJw_Zuqs+3OFCaQC8AcPP1cVgMnhQgc6GxB+Uyrby80fe3rLQ@mail.gmail.com>
 <CAAJw_Zs0Kx_NTbi4uvvOp3NiKv9-VQJoN+LXU-mrz+2Ve2djEQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAAJw_Zs0Kx_NTbi4uvvOp3NiKv9-VQJoN+LXU-mrz+2Ve2djEQ@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Chua <jeff.chua.linux@gmail.com>
Cc: Jan Kara <jack@suse.cz>, Jeff Mahoney <jeffm@suse.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>, stable@vger.kernel.org

On Wed 06-08-14 03:23:58, Jeff Chua wrote:
> On Tue, Aug 5, 2014 at 5:28 PM, Jeff Chua <jeff.chua.linux@gmail.com> wrote:
> > On Tue, Aug 5, 2014 at 4:39 PM, Jan Kara <jack@suse.cz> wrote:
> >> On Mon 04-08-14 19:51:47, Jeff Mahoney wrote:
> >>> Commits f1f007c308e (reiserfs: balance_leaf refactor, pull out
> >>   Thanks. I've added the patch to my tree and I'll push it to Linus in this
> >> merge window (after basic test runs finish).
> >
> > It's holding so far. I'm compiling mozilla brower, xul-runner and gcc
> > now and all the compilings are still running in vmware ... not yet
> > finished though.
> >
> > Then, I'll run more tests on my real h/w.
> 
> Jan, Jeff,
> 
> Running on real h/w with many more compilations ... all good. No
> coruptions. Patch worked!
  Thanks a lot for testing!

								Honza

-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
