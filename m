From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: [PATCH] reiserfs: Truncate blocks not used by a write (v2)
Date: Thu, 8 Oct 2009 14:48:24 +0200
Message-ID: <20091008124818.GB5073@nowhere>
References: <1253121912-20718-1-git-send-email-jack@suse.cz> <20090916144815.e544b319.akpm@linux-foundation.org> <20090917005633.GC8098@nowhere> <20090917115629.6f8f8f00.sfr@canb.auug.org.au>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:references:mime-version:content-type
         :content-disposition:in-reply-to:user-agent;
        bh=wt853QES7jJQ/oZCEgti9QeInrR+0oUnzob7cV1lVAg=;
        b=KsoGdF4VQx77Q/1DaN0nTJcYsYcLeV+ZJhD7mh/hjMxr7LA5CR2AUYSYb2KSIJpuWs
         P05xb63ky3WfSh+9gr9724/Bf/b8egXuoEwPe7gIEIlVJZxVgd6oHD7m2VGSW+ykeWV4
         9MVP8zDsQgv+SGIF22CryfLsJCZIR6yrpakfs=
Content-Disposition: inline
In-Reply-To: <20090917115629.6f8f8f00.sfr@canb.auug.org.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org, hch@infradead.org, reiserfs-devel@vger.kernel.org, jeffm@suse.com

On Thu, Sep 17, 2009 at 11:56:29AM +1000, Stephen Rothwell wrote:
> Hi Frederic,
> 
> On Thu, 17 Sep 2009 02:56:34 +0200 Frederic Weisbecker <fweisbec@gmail.com> wrote:
> >
> > Note that the kill-the-bkl/reiserfs tree has suffered from too much
> > lock inversion problems lately. Even though I just fixed the last one
> > reported, I would feel more comfortable to schedule this tree for .33
> > rather than .32
> > 
> > So this tree can be removed from -next and reintegrated once -rc1 is
> > released, without problem.
> 
> OK, I have removed it from today.  Please let me know when it should be
> readded (in case I forget - which at my age is likely :-)).


Hi Stephen,

Now that -rc1 has been released (well.. -rc2, or..hmm...), could you please
reintegrate the tree:

git://git.kernel.org/pub/scm/linux/kernel/git/frederic/random-tracing.git
	reiserfs/kill-bkl

into -next ?

It is based on linux-2.6.31, I haven't merged 32-rc3 into
it because there is no conflict between those and there are no
dependencies against latest changes.

Tell me if you need something. It's possible there are pending
patches in reiserfs for .33 in -next which might conflict, I don't
know. But if you need help to fix the conflicts, just tell me.

Thanks!
	

