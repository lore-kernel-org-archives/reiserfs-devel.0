From: Hans Reiser <reiser@namesys.com>
Subject: Re: Status of reiserfs in Redhat 2.4.7-10 kernel ?
Date: Wed, 16 Apr 2003 11:33:24 +0400
Message-ID: <3E9D0744.9090907@namesys.com>
References: <Pine.NEB.4.44.0304151610230.25702-100000@slick.sigje.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13669-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.NEB.4.44.0304151610230.25702-100000@slick.sigje.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ahorn@deorth.org
Cc: reiserfs-list@namesys.com

ahorn@deorth.org wrote:

>Hi folks,
>
>Can anyone point me towards a list of bugs that existed in the
>implementation of reiserfs in this redhat kernel (the last kernel released
>with a redhat 7.2 distribution CD)
>
>I may obtain support and talk to redhat, but I just thought I'd check here
>first and see if anyone knew. The customer is very conservative and
>upgrading the kernel is not an option for other reasons. Therefore I need
>to provide assurance that we can or cannot viably use reiserfs with that
>kernel.
>
>Thanks in advance for your help.
>
>Cheers,
>
>Al
>
>
>
>
>
>  
>
I am afraid that I can only say that Redhat kernels are not standard 
kernels, and non-standard kernels should not be preferred for use in 
production systems.  They are not as well tested (or as debugged) as 
Linus/Marcelo kernels.  Linus/Marcelo kernels are the official kernels, 
and Linus and Marcelo, not RedHat or any other distro, are the Linux 
kernel maintainers.  I personally try to avoid any use of a non-standard 
kernel in systems I care about because I know that no distro has the 
testing ability of those who test the Marcelo kernels, and Marcelo's 
level of skill and caution exceeds that of any other maintainer I am 
familiar with in detail, but I am more conservative than most.

-- 
Hans


