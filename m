From: Jan Kara <jack@ucw.cz>
Subject: Re: reiser4 not supporting quota
Date: Tue, 5 Apr 2005 17:20:54 +0200
Message-ID: <20050405152054.GA15940@atrey.karlin.mff.cuni.cz>
References: <75a6e5ba0504050008427613d2@mail.gmail.com> <20050405103726.GA26711@atrey.karlin.mff.cuni.cz> <1112710982.3360.366.camel@tribesman.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23781-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1112710982.3360.366.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vladimir Saveliev <vs@namesys.com>
Cc: Dudi Indrasetiadi <dudi.indrasetiadi@gmail.com>, reiserfs-list@namesys.com

  Hello,

> On Tue, 2005-04-05 at 14:37, Jan Kara wrote:
> > > Sorry for this ``not so smart'' question, is there quota support in
> > > reiser4? Or quota is not in the main idea of reiser4?
> >   There is not quota support for Reiser4. I'm looking into it but first
> > I have to come up with a reasonable semantics + idea of efficient
> > implementation :) The framework of plugins and the fact that Reiser4 first
> > overestimates the needed space and then releases it (and eventually
> > uses also some of the "reserved" space) makes the quota implementation harder
> > than in other filesystems...
> 
> Wouldn't be simpler if quota limited a user in terms of number of
> files/total size of files and not in term of space used by filesystem
> internally to store those files?
> 
> I think that anyway it is not possible to calculate exactly number of
> bytes of disk space reiserX filesystem allocates to store a file in
> filesystem because of rebalancing.
  Yes, I agree that accounting metadata is almost impossible. But still
I think it would be nice if especially compressed file would be
accounted only for its compressed size and not for the uncompressed
one. This is basically the only reason why I didn't yet decide to use
just the plain amount of file's data.

> For quota in reiser4 : we probably need to make it "transactional".
> Do you think we can make quota counter update in the same transaction
> with the quoted operation?
  Yes, that should be possible and not very complicated - ext3 and
reiser3 already support this. If the quota callbacks are set properly
then each call of DQUOT_ALLOC/FREE_... will end up as a call to
foofs_quota_write() to update data in the quota file and filesystem can
then attach this update to the running transaction - at least this way
it works for ext3 and reiser3.

								Honza
