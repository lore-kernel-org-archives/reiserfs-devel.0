From: David Rientjes <rientjes@google.com>
Subject: Re: [RFC 1/1] fs/reiserfs/journal.c: Remove obsolete  __GFP_NOFAIL
Date: Tue, 25 Mar 2014 18:06:17 -0700 (PDT)
Message-ID: <alpine.DEB.2.02.1403251800320.21733@chino.kir.corp.google.com>
References: <20140321171830.ef47fdea1a3a2f2921c8fe86@skynet.be> <20140321130055.c0ea32946f3543cd7f6bedd6@linux-foundation.org> <20140322170322.GA23583@thunk.org> <20140322101512.eaeb542b.akpm@linux-foundation.org> <20140322172606.GB23583@thunk.org>
 <20140322173207.GC23583@thunk.org> <20140322105524.7baec73a.akpm@linux-foundation.org> <20140322192423.GA10176@redhat.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version:content-type;
        bh=5EMfjCoXUET/IOy+Ro1+mrf/G7gEhyaelaLGk4o/5Ko=;
        b=QGU0jZj7F8Bg6iGPD1/SQJonmW8i7YyX56yd2h5oRRYaXAgG7zfYTMIfcJW9zkMFhW
         Ne2seywPhMFf9ju1TEkRdUykfUR/sKE7si9iAy/BnAKupw8wSj2eQD7XtLLbfVd+x/Rv
         2qYKcEBviMqYn5QlD5j6e6MNGlv/1TzEcawTeuytK/TPV2l5nwauiBn7hLV2IKjbTLAa
         rBzrp5ZR3oAwQdZqow2qJbw+3xjkA5bJnqZG/T2IVoH57Qpf2eHTpw9JykwjoZD6EcHo
         vKgs1Voa9MqW/ovsGvVKwI0nzcOVehmraDFJG/vQXjP45ZwqtiqGUvgCU8mBxa2Oonkg
         /zDQ==
In-Reply-To: <20140322192423.GA10176@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, tytso@mit.edu, Fabian Frederick <fabf@skynet.be>, linux-kernel <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org, Joe Perches <joe@perches.com>

On Sat, 22 Mar 2014, Dave Jones wrote:

> On Sat, Mar 22, 2014 at 10:55:24AM -0700, Andrew Morton wrote:
>  > On Sat, 22 Mar 2014 13:32:07 -0400 tytso@mit.edu wrote:
>  > 
>  > > On Sat, Mar 22, 2014 at 01:26:06PM -0400, tytso@MIT.EDU wrote:
>  > > > > Well.  Converting an existing retry-for-ever caller to GFP_NOFAIL is
>  > > > > good.  Adding new retry-for-ever code is not good.
>  > > 
>  > > Oh, and BTW --- now that checkpatch.pl now flags an warning whenever
>  > > GFP_NOFAIL is used
>  > 
>  > I don't know what the basis for this NOFAIL-is-going-away theory could
>  > have been.  What's the point in taking a centrally implemented piece of
>  > logic and splattering its implementation out to tens of different
>  > callsites?
> 
> I wonder if some of that thinking came from this..
> 
> commit dab48dab37d2770824420d1e01730a107fade1aa
> Author: Andrew Morton <akpm@linux-foundation.org>
> Date:   Tue Jun 16 15:32:37 2009 -0700
> 
>     page-allocator: warn if __GFP_NOFAIL is used for a large allocation
>     
>     __GFP_NOFAIL is a bad fiction.  Allocations _can_ fail, and callers should
>     detect and suitably handle this (and not by lamely moving the infinite
>     loop up to the caller level either).
> 

It came from me pointing out the fact that __GFP_NOFAIL requires 
__GFP_WAIT to actually never fail in the page allocator's implementation.  
I wanted to fix that, Andrew said nobody is currently doing 
GFP_NOWAIT | __GFP_NOFAIL or GFP_ATOMIC | __GFP_NOFAIL so let's warn 
against new callers being added and hopefully eventually get rid of it.  
In those cases, we also don't invoke the oom killer because we don't have 
__GFP_FS so we livelock.

The point is not to add new callers and new code should handle NULL 
correctly, not that we should run around changing current users to just do 
infinite retries.  Checkpatch should have nothing to do with that.
