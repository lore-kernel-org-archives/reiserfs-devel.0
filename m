From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: reiser4 not supporting quota
Date: Tue, 05 Apr 2005 18:23:02 +0400
Message-ID: <1112710982.3360.366.camel@tribesman.namesys.com>
References: <75a6e5ba0504050008427613d2@mail.gmail.com>
	 <20050405103726.GA26711@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23780-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050405103726.GA26711@atrey.karlin.mff.cuni.cz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Kara <jack@ucw.cz>
Cc: Dudi Indrasetiadi <dudi.indrasetiadi@gmail.com>, reiserfs-list@namesys.com

Hello

On Tue, 2005-04-05 at 14:37, Jan Kara wrote:
> > Sorry for this ``not so smart'' question, is there quota support in
> > reiser4? Or quota is not in the main idea of reiser4?
>   There is not quota support for Reiser4. I'm looking into it but first
> I have to come up with a reasonable semantics + idea of efficient
> implementation :) The framework of plugins and the fact that Reiser4 first
> overestimates the needed space and then releases it (and eventually
> uses also some of the "reserved" space) makes the quota implementation harder
> than in other filesystems...

Wouldn't be simpler if quota limited a user in terms of number of
files/total size of files and not in term of space used by filesystem
internally to store those files?

I think that anyway it is not possible to calculate exactly number of
bytes of disk space reiserX filesystem allocates to store a file in
filesystem because of rebalancing.

For quota in reiser4 : we probably need to make it "transactional".
Do you think we can make quota counter update in the same transaction
with the quoted operation?

