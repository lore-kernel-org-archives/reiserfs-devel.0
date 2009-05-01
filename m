From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH 0/6] kill-the-BKL/reiserfs3: performance improvements,
	faster than Bkl based scheme
Date: Fri, 1 May 2009 22:36:39 +0200
Message-ID: <20090501203639.GA9396@elte.hu>
References: <1241145862-21700-1-git-send-email-fweisbec@gmail.com> <alpine.LFD.2.00.0905011236530.5379@localhost.localdomain> <20090501203309.GA6243@elte.hu>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090501203309.GA6243@elte.hu>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Frederic Weisbecker <fweisbec@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Jeff Mahoney <jeffm@suse.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Chris Mason <chris.mason@oracle.com>, Alexander Beregalov <a.beregalov@gmail.com>, Alessio Igor Bogani <abogani@texware.it>, Jonathan Corbet <corbet@lwn.net>, Alexander Viro <viro@zeniv.linux.org.uk>


* Ingo Molnar <mingo@elte.hu> wrote:

> The BKL is clearly removed at a faster reate with such debugging 
> measures in place. With such measures the BKL _really_ hurts, and 
> very visibly so - and that results in active removal.

Btw., if you can think of any way to create a cleaner debug tool 
here i'd be glad to start a new tree that adds only _that_ tool - 
and that could perhaps be dealt with independently and possibly 
pulled upstream too, if clean enough.

The problem is, i think it would still quack like a global mutex, 
would walk like a global mutex and would look like a global mutex
:-/

	Ingo
