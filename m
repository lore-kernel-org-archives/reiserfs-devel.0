From: Hans Reiser <reiser@namesys.com>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Sat, 15 May 2004 10:13:19 -0700
Message-ID: <200405151013.19473.reiser@namesys.com>
References: <20040329185901.62166.qmail@web25008.mail.ukl.yahoo.com> <40A587FF.30103@namesys.com> <40A520DB.4080200@lindows.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18716-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40A520DB.4080200@lindows.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Clifford Beshers <clifford.beshers@lindows.com>
Cc: reiserfs-list@namesys.com

You are probably right about scp specifically, but in general @ is used by 
some things that expect it to mean user@host.  @ could be used, I think 
clearcase used it, I just don't see it as better than "metas".

Hans

On Friday 14 May 2004 12:41, Clifford Beshers wrote:
> Hans Reiser wrote:
> > Grant Miner wrote:
> >> Someone mentioned earlier, and I like just the at sign: @ Think of it
> >> short for "attributes".
> >>
> >> file/@/uid
> >>
> >> The nice thing about @ is it shows up early lexicographically, it's
> >> short and unlikely to be used.  This name is important to pick well
> >> because it will likely set a long precedent.
> >
> > It would be a problem for utilities like scp....
>
> Hans, are you sure?  I tried some examples and had no troubles.  From my
> history:
>
>       588  cd ~/tmp
>       589  mkdir -p foo/@
>       590  touch foo/@/uid
>       591  scp -rp foo/@/uid stan:/tmp
>       592  ssh stan 'mkdir -p /tmp/foo/@ ; touch /tmp/foo/@/uid'
>       593  scp -rp stan:/tmp/foo/@ .
>
> I'm not sure if @ is a good choice or not, but I don't think it would
> actually cause trouble syntactically, because everything expecting
> hostnames looks for a colon.
>
> --
>
> This message contains information which may be confidential and privileged.
> Unless you are the addressee (or authorized to receive for the addressee),
> you may not use, copy or disclose to anyone the message or any information
> contained in the message. If you have received the message in error, please
> advise the sender and delete the message.  Thank you.

