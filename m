From: Oleg Drokin <green@namesys.com>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Fri, 14 Feb 2003 11:18:29 +0300
Message-ID: <20030214111829.A21849@namesys.com>
References: <3E4AA902.86F15815@interface-ag.com> <b2h7dc$ipp$1@satsuki.furryterror.org> <3E4C392A.2070909@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12754-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E4C392A.2070909@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Zygo Blaxell <eazgwmir@umail.furryterror.org>, reiserfs-list@namesys.com

Hello!

On Fri, Feb 14, 2003 at 03:32:42AM +0300, Hans Reiser wrote:

> > I really like
> >systems that can still boot and let me (attempt to) run diagnostic
> >tools even when they're otherwise really unhealthy.  I don't care if
> >recently written data is corrupt or missing--I probably didn't write to
> >the diagnostic tools within the last journal interval, and if the
> >filesystem is read-only I can't make any metadata corruption worse.
> >I would think that most people notice that something's wrong if they
> >can't write to their filesystems any more.  I certainly wouldn't want
> >the filesystem to be modified if there's something known to be wrong
> >with the metadata.  But if I can't read any of the data at all because
> >some tiny part of it is suspicious, I just get annoyed.  :-P
> Agreed.  I think that this is actually what we do currently.  Oleg, can 
> you check that?

Currently we panic if write to journal area fails. We report IO error to
userspace if non-journaled write fails it seems (I will check it again).

Bye,
    Oleg 
