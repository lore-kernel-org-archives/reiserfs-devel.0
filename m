From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: On plugins, on-disk formatting and such
Date: Mon, 12 Apr 2004 19:28:10 +0400
Message-ID: <1081783690.1343.2.camel@tribesman.namesys.com>
References: <20040410100701.GE5229@nysv.org>
	 <20040412133006.GA1579@backtop.namesys.com>  <407AB210.9060305@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17868-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <407AB210.9060305@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Alex Zarochentsev <zam@namesys.com>, reiserfs-list@namesys.com

On Mon, 2004-04-12 at 19:13, Hans Reiser wrote:
> Alex Zarochentsev wrote:
> 
> >
> >>   
> >>   4.2) What exactly does it mean that CONFIG_REISER4_COPY_ON_CAPTURE
> >>        is stabler than before? Is it soon safe to configure in?
> >>        Is it possible for me to test it on only one filesystem or
> >>        do I risk rootfs (and home directory) stability by trying it
> >>        out? If I compile it in, what's the best way of testing it?
> >>    
> >>
> >
> >we still see fs errors if COC enable. they are rare now, but COC is not stable
> >yet.
> >
> >  
> >
> Is Vladimir working on it today?

No.
I am working on reiser4 not being able to compile glibc

