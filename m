From: tytso@mit.edu
Subject: Re: [RFC 1/1] fs/reiserfs/journal.c: Remove obsolete  __GFP_NOFAIL
Date: Sat, 22 Mar 2014 13:32:07 -0400
Message-ID: <20140322173207.GC23583@thunk.org>
References: <20140321171830.ef47fdea1a3a2f2921c8fe86@skynet.be>
 <20140321130055.c0ea32946f3543cd7f6bedd6@linux-foundation.org>
 <20140322170322.GA23583@thunk.org>
 <20140322101512.eaeb542b.akpm@linux-foundation.org>
 <20140322172606.GB23583@thunk.org>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=thunk.org; s=mail;
	t=1395509527; bh=0ezcttqoJB9C6Lnwj1YQBjzv3pxkAOzULenGoLMBpj0=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=0ABbsWM14Zd/0RnuA4XFNlb3QEx8y0PmiTzLL0cl6/bs8FrvmI1E2sWIiWS5qEjhA
	 QbDCik9kqxk3mGzzgaNNBfD8WhVonoFP5YZ6dReNBrbNZfZTlrWs09jdbNbt2dEBjA
	 v/0DQ5Sx9QW5UY9bMHvjDeJB1BleT0TmfXQR2xp0=
Content-Disposition: inline
In-Reply-To: <20140322172606.GB23583@thunk.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, Fabian Frederick <fabf@skynet.be>, linux-kernel <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org

On Sat, Mar 22, 2014 at 01:26:06PM -0400, tytso@MIT.EDU wrote:
> > Well.  Converting an existing retry-for-ever caller to GFP_NOFAIL is
> > good.  Adding new retry-for-ever code is not good.

Oh, and BTW --- now that checkpatch.pl now flags an warning whenever
GFP_NOFAIL is used, because it is deprecated, patches that convert a
loop to use GFP_NOFAIL will get flagged with checkpatch, and this will
also incentivize people writing new code and who can't find any other
way to deal with an allocation failure to simply open code the loop...

  	 	    	   	     	 - Ted




     	    	   
