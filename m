From: Daniel Phillips <phillips@arcor.de>
Subject: Re: precise characterization of ext3 atomicity
Date: Thu, 4 Sep 2003 23:08:54 +0200
Message-ID: <200309042308.54002.phillips@arcor.de>
References: <3F574A49.7040900@namesys.com> <200309042216.04121.phillips@arcor.de> <20030904131052.6ec6426d.akpm@osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15566-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030904131052.6ec6426d.akpm@osdl.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@osdl.org>
Cc: reiser@namesys.com, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

On Thursday 04 September 2003 22:10, Andrew Morton wrote:
> Daniel Phillips <phillips@arcor.de> wrote:
> > On Thursday 04 September 2003 17:55, Andrew Morton wrote:
> > > Hans Reiser <reiser@namesys.com> wrote:
> > > > Is it correct to say of ext3 that it guarantees and only guarantees
> > > > atomicity of writes that do not cross page boundaries?
> > >
> > > Yes.
> >
> > Is that just happenstance, or does Posix or similar mandate it?
>
> Happenstance.
>
> It's semi-trivial to do this in ext3.  You'd open the file with O_ATOMIC
> and a write() would either be completely atomic or would return -EFOO
> without having written anything.
>
> The thing which prevents this is the ranking order between journal_start()
> and lock_page().
>
> It's not trivial but also not too hard to change things so that
> journal_start() can rank outside lock_page() - this would also offer some
> CPU savings.
>
> Can't say that I'm terribly motivated about the feature though.

I'm relieved, I have always thought that some higher level synchronization is 
required for simultaneous writes.  So Hans might as well tell his fans that 
Ext3 makes no official guarantee, and neither does Linux.

Regards,

Daniel

