From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: [PATCH] reiserfs: kill-the-BKL
Date: Tue, 7 Apr 2009 13:24:51 +0200
Message-ID: <20090407112450.GA5922@nowhere>
References: <1239070789-13354-1-git-send-email-fweisbec@gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:references:mime-version:content-type
         :content-disposition:in-reply-to:user-agent;
        bh=LQ2q3ZPraWmLw/sR4L5ZbLKVoKlbnvAfIVCyC3Th4wo=;
        b=Y+K9ZkLLRd7CzYt/RlBsrBaZstM6tP1u+10hBN48TvWAfiZUTMX+uq2Yhi820CtsSO
         LQXBXzjjCiCQDG4qknaVXVw0qJmZIvnCYSfcEK0S5a9IwcD+yi8EaAGdUM8xDV08gAHn
         YxWf1BZG6ZlKEKq+CtU3JM85s+gqWHjqsq9tk=
Content-Disposition: inline
In-Reply-To: <1239070789-13354-1-git-send-email-fweisbec@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jeff Mahoney <jeffm@suse.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Bron Gondwana <brong@fastmail.fm>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, Alexander Viro <viro@zeniv.linux.org.uk>

Note: I forgot to put the RFC prefix for this patch.

Frederic Weisbecker.

