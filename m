From: tytso@mit.edu
Subject: Re: [RFC 1/1] fs/reiserfs/journal.c: Remove obsolete  __GFP_NOFAIL
Date: Wed, 26 Mar 2014 02:19:04 -0400
Message-ID: <20140326061904.GA4907@thunk.org>
References: <20140321171830.ef47fdea1a3a2f2921c8fe86@skynet.be>
 <20140321130055.c0ea32946f3543cd7f6bedd6@linux-foundation.org>
 <20140322170322.GA23583@thunk.org>
 <20140322101512.eaeb542b.akpm@linux-foundation.org>
 <20140322172606.GB23583@thunk.org>
 <20140322173207.GC23583@thunk.org>
 <20140322105524.7baec73a.akpm@linux-foundation.org>
 <20140322192423.GA10176@redhat.com>
 <alpine.DEB.2.02.1403251800320.21733@chino.kir.corp.google.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=thunk.org; s=mail;
	t=1395814744; bh=VR/ZIQ2R8PMmezI1/b2hhw7UMZAh7RRswikptUzc9cQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JgcqDyomMThfMDAxEN+fvcBWx58K0FSf8DxGEAfg7sJAiIqFFLI1kizrUbG2IgNE1
	 4/IvqptLbxh0AdZntWSemOeQKITjZ90h/9FdKBMXE86vmHyA7F9p3ve2wjV1XKxduj
	 p3gpC8FsUks31VOCKG+3ZTo7zDq7LwMg8yxO9nLM=
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1403251800320.21733@chino.kir.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Rientjes <rientjes@google.com>
Cc: Dave Jones <davej@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Fabian Frederick <fabf@skynet.be>, linux-kernel <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org, Joe Perches <joe@perches.com>

On Tue, Mar 25, 2014 at 06:06:17PM -0700, David Rientjes wrote:
> 
> The point is not to add new callers and new code should handle NULL 
> correctly, not that we should run around changing current users to just do 
> infinite retries.  Checkpatch should have nothing to do with that.

My problem with this doctrinaire "there should never be any new users"
is that sometiems there *are* worse things than infinite retries.  If
the alternative is bringing the entire system down, or livelocking the
entire system, or corrupting user data, __GFP_NOFAIL *is* the more
appropriate option.

If you try to tell those of us outside of the mm layer, "thou shalt
never use __GFP_NOFAIL in new code", and we have some new code where
the alternative is worse, we can either open-code the loop, or have
some mm hackers and/or checkpatch whine at us.

Andrew has declared that he'd prefer that we not open code the retry
loop; if you want to disagree with Andrew, feel free to pursuade him
otherwise.  If you want to tell me that I should accept user data
corruption, I'm going to ignore you (and/or checkpatch).

Regards,

						- Ted
