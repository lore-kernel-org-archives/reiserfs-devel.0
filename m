From: Oleg Drokin <green@namesys.com>
Subject: Re: Question on new volumes
Date: Wed, 11 Sep 2002 10:54:28 +0400
Message-ID: <20020911105428.A6164@namesys.com>
References: <OF90C8A0AB.075F13E9-ON85256C30.0079AA70@pok.ibm.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11411-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <OF90C8A0AB.075F13E9-ON85256C30.0079AA70@pok.ibm.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Pratt <slpratt@us.ibm.com>
Cc: reiserfs-list@namesys.com, vitaly@namesys.com

Hello!

On Tue, Sep 10, 2002 at 05:15:34PM -0500, Steve Pratt wrote:

> During some EVMS testing we have run into an interesting behavior.  It
> seems that new mkfsed Reiserfs volumes are not mountable read only.  Here

They are. It tries to replay the log and since your snapshot is readonly,
it cannot.

> If the original volume is mounted and unmount prior to taking the snapshot
> everything is fine.

Journal is no longer looks like it can be replayed.

> I know that this is not an important (or even sane)  order of events (ie
> snapshotting a never mounted and thus empty volume) but was just something
> that we ran across in testing.  Is there some reason that the log is not
> fully initialized by mkfs?  fsck says it is fine.

Probably there is no specific reason. And the journal is zeroed on mkfs of
course.

Bye,
    Oleg
