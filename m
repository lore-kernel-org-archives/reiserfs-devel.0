From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiserfsprogs scm tree?
Date: Tue, 24 Mar 2009 22:12:02 +0300
Message-ID: <49C93082.9030005@gmail.com>
References: <alpine.DEB.2.01.0903241127290.16244@bogon.housecafe.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.01.0903241127290.16244@bogon.housecafe.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Kujau <lists@nerdbynature.de>
Cc: reiserfs-devel@vger.kernel.org

Christian Kujau wrote:
> Hi there,
>   

Hello.

> I see that reiserfsprogs 3.6.21 have been announced [0] and I wonder if 
> there's a public scm (git?) repo available for this.

Not yet.
I'll put it to kernel.org/pub/scm/ soon.
It will contain only stable brunch developed
by Jeff Mahoney.

>  Also, in the README 
> one can see that there are now two forks: 3.6.20(.1) and 3.6.21 - will 
> they be merged at some point in time again?

At least it should be merged, but I can not guarantee that it will be
merged..

>  If not, are they maintained,
> or is 3.6.20.1

3.6.20.1 is not developed, but Vladimir Saveliev
promised to consider complaints a yeah ago.


>  "finished" and development goes on in 3.6.21?
>
> Oh, and one more question pops in: since the namesys website seems to be 
> gone now, is there a need for reiserfs.wiki.kernel.org or something?
>   

Yup, it would be fine:
many people don't know that reiserfs has a mount option "data=journal".

Edward.
