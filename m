From: David Rientjes <rientjes@google.com>
Subject: Re: [RFC 1/1] fs/reiserfs/journal.c: Remove obsolete  __GFP_NOFAIL
Date: Tue, 25 Mar 2014 18:07:06 -0700 (PDT)
Message-ID: <alpine.DEB.2.02.1403251806321.21733@chino.kir.corp.google.com>
References: <20140321171830.ef47fdea1a3a2f2921c8fe86@skynet.be> <20140321130055.c0ea32946f3543cd7f6bedd6@linux-foundation.org> <20140322170322.GA23583@thunk.org> <20140322101512.eaeb542b.akpm@linux-foundation.org> <20140322172606.GB23583@thunk.org>
 <20140322173207.GC23583@thunk.org> <20140322105524.7baec73a.akpm@linux-foundation.org> <1395514595.3667.10.camel@joe-AO722>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version:content-type;
        bh=EFPKPfzGI+q+U25oWGVnWCWl8iN4uIwtiAeXrScaPPs=;
        b=pOlvPZaJCsNZzD/9Jb3UrOvHLGBIyXN7SV0NcJKlBfFLLwTuuTG4qXg81owSMEkpfz
         g3k3LRBYFfCtQF9vOlb1e5iSN2s0oeJFPlXc3Oz5TnT3WGpkl5+8ghioJZdQAuo5boTj
         5wtXm8/pPlX0+UXLo1A4qe8bS/KkERI9BN7IZW6fQUw+wzPXo6PJnAlvCa8JXyXX5hjP
         eiZ9phn66kEYDFxkLFoHWJjroKqFrk6TrnNO6Xqm+ZgIOnMvg028b49I09zxTSeOCOPN
         89hOpPlxxtevw0/JzmkKyrqE+v+zZNtrVTiWkKAlFNxc2HLNLFs67XnBfXp/ced22b6l
         oh5w==
In-Reply-To: <1395514595.3667.10.camel@joe-AO722>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, tytso@mit.edu, Fabian Frederick <fabf@skynet.be>, linux-kernel <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org

On Sat, 22 Mar 2014, Joe Perches wrote:

> How about just changing this message to something like:
> 
> 			WARN("__GFP_NOFAIL",
> 			     "Use of __GFP_NOFAIL may cause the OOM handler to kill a random process\n" . $herecurr);

Because it doesn't, the GFP_NOFS allocation in question already cannot 
invoke the oom killer.
