From: Oleg Drokin <green@namesys.com>
Subject: Re: fast approximate file count
Date: Sun, 22 Sep 2002 14:36:12 +0400
Message-ID: <20020922143612.A22422@namesys.com>
References: <E17scwJ-0003ij-00@yodel.jab.org> <20020922003546.A19135@namesys.com> <20020922054309.V8204@vestdata.no>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11515-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20020922054309.V8204@vestdata.no>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ragnar Kj?rstad <reiserfs@ragnark.vestdata.no>
Cc: Jeff Breidenbach <jeff@jab.org>, reiserfs-list@namesys.com

Hello!

On Sun, Sep 22, 2002 at 05:43:09AM +0200, Ragnar Kj?rstad wrote:
> > If you never/very seldom delete files,
> > you can create new file (any size), execute ls -i on it, like this:
> >  549661 z
> > This number is OID, oid grows up in case that there were no deletions/gaps
> > from previous deletions in OID.
> > OID is total number of objects on FS in this case.
> Hmm, why doesn't statfs return the correct number of inodes in use? I
> think that's what you would want to use here.

Well, something like that can be done even now, I'll think about it tomorrow.

Bye,
    Oleg
