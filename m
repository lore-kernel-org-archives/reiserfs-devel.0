From: Oleg Drokin <green@namesys.com>
Subject: Re: big reiserfs regression in 2.4.20-pre2
Date: Wed, 21 Aug 2002 08:50:38 +0400
Message-ID: <20020821085038.A4525@namesys.com>
References: <20020821032632.GA3774@rushmore>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11260-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20020821032632.GA3774@rushmore>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rwhron@earthlink.net
Cc: reiserfs-list@namesys.com

Hello!

On Tue, Aug 20, 2002 at 11:26:32PM -0400, rwhron@earthlink.net wrote:
> > Great, I just found that we forgot to enable preallocation with new block
> > allocator by default. This is easily fixable of course.
> Is that in the 2.5.patch:
> http://marc.theaimsgroup.com/?l=linux-kernel&m=102984193227185&w=2

Yes, I included it into 2.5 patch, since I see no reason to supply buggy
patch and then several bugfixes.

Bye,
    Oleg
