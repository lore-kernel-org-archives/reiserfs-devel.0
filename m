From: mjt@nysv.org (Markus  =?ISO-8859-1?Q?=20T=F6rnqvist?=)
Subject: Re: [RFC] Pathname Semantics with //
Date: Fri, 10 Sep 2004 12:11:03 +0300
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <20040910091103.GA26192@nysv.org>
References: <200409091933.06100.christian.mayrhuber@gmx.net> <20040909201301.1165215D64@mail03.powweb.com> <20040909204102.GB27331@schnapps.adilger.int>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040909204102.GB27331@schnapps.adilger.int>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Dabbs <david@dabbs.net>, 'Christian Mayrhuber' <christian.mayrhuber@gmx.net>, linux-fsdevel@vger.kernel.org, reiserfs-list@namesys.com

On Thu, Sep 09, 2004 at 02:41:02PM -0600, Andreas Dilger wrote:
>One problem that using "//" may have (thought it is personally my favourite
>option right now) is that "realpath(3)" may cause the "//" to be eaten, and

Exactly.

However, I must say that adding // somewhere is IMO _much_ uglier than
doing ./file/..metas/ for real.

I'd also imagine that it's easier to teach progs ..metas/ than ^//(.*)
but I may be proven wrong and my opinion cated to /dev/null ;)

>this is used by many programs to "resolve" pathnames to remvoe symlinks,
>bogus "/./" etc.  This may need a small fix in glibc, but at least it is
>still central instead of teaching a million apps about different sematics.

Different semantics?
Like you wouldn't teach old programs the // syntax? Or what am I missing :)
You don't have to teach them "streams as files-as-dirs" if you have a mirror
namespace with //?

Well, I'd rather stick to teaching progs about ..metas/ :P

-- 
mjt

