From: Christian Kujau <lists@nerdbynature.de>
Subject: Re: reiserfsprogs scm tree?
Date: Tue, 24 Mar 2009 21:26:01 -0700 (PDT)
Message-ID: <alpine.DEB.2.01.0903242115430.16244@bogon.housecafe.de>
References: <alpine.DEB.2.01.0903241127290.16244@bogon.housecafe.de> <49C93082.9030005@gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <49C93082.9030005@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On Tue, 24 Mar 2009, Edward Shishkin wrote:
> I'll put it to kernel.org/pub/scm/ soon.
> It will contain only stable brunch developed
> by Jeff Mahoney.

That's good news. If you/Jeff decide to put the development branch in a 
public SCM tree as well, I'm sure some lunatics out there will be happy to 
do some testing :)

> 3.6.20.1 is not developed, but Vladimir Saveliev
> promised to consider complaints a yeah ago.

Hm, 3.6.20.1 is about "improving of overall reiserfsck performance". If 
the changes are not trivial to merge and there's not really a need for it 
(I don't see many "reiserfsck is too slow" requests on this list).

> Yup, it would be fine:
> many people don't know that reiserfs has a mount option "data=journal".

Good example for a FAQ. And perhaps some of the (archived) 
in-depth documentation from Namesys can find its place there. Should I 
contact the kernel.org webmasters to get this set up?

Christian.
-- 
Bruce Schneier can bend titanium alloy into a Penrose triangle.
