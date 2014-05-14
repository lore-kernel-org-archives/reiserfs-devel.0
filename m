From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH V2] fs/reiserfs/stree.c: remove obsolete __constant
Date: Thu, 15 May 2014 00:29:52 +0200
Message-ID: <20140514222952.GA21766@quack.suse.cz>
References: <20140503223324.4357f591dc8994b74f456440@skynet.be>
 <20140514220143.GA20841@quack.suse.cz>
 <CAFLxGvzp_8Qgg0wN2v0SncAB+eDEn4s-p86ZW9+DzosBKb53yw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAFLxGvzp_8Qgg0wN2v0SncAB+eDEn4s-p86ZW9+DzosBKb53yw@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: Jan Kara <jack@suse.cz>, Fabian Frederick <fabf@skynet.be>, linux-kernel <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org, akpm <akpm@linux-foundation.org>

On Thu 15-05-14 00:08:34, Richard Weinberger wrote:
> On Thu, May 15, 2014 at 12:01 AM, Jan Kara <jack@suse.cz> wrote:
> > On Sat 03-05-14 22:33:24, Fabian Frederick wrote:
> >> __constant_cpu_to_le32 converted to cpu_to_le32
> >>
> >> Cc: reiserfs-devel@vger.kernel.org
> >> Cc: Andrew Morton <akpm@linux-foundation.org>
> >> Signed-off-by: Fabian Frederick <fabf@skynet.be>
> >   Just for my education, where have you learned that __constant_...
> > functions are obsolete?
> 
> IIRC checkpatch.pl barks if you use __constant_... outside of include/uapi/
  OK. I've merged the patch into my tree.

								Honza
-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
