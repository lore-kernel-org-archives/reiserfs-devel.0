From: Chris Wedgwood <cw@f00f.org>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 2 Sep 2004 13:58:45 -0700
Message-ID: <20040902205845.GA7541@taniwha.stupidest.org>
References: <rlrevell@joe-job.com> <1094079071.1343.25.camel@krustophenia.net> <200409021425.i82EPn9i005192@laptop11.inf.utfsm.cl> <1535878866.20040902214144@tnonline.net> <20040902194909.GA8653@atrey.karlin.mff.cuni.cz> <1094155277.11364.92.camel@krustophenia.net> <20040902204351.GE8653@atrey.karlin.mff.cuni.cz> <1094158060.1347.16.camel@krustophenia.net> <20040902204949.GA7449@taniwha.stupidest.org> <1094158626.1347.28.camel@krustophenia.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21332-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1094158626.1347.28.camel@krustophenia.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Revell <rlrevell@joe-job.com>
Cc: Pavel Machek <pavel@ucw.cz>, Spam <spam@tnonline.net>, Horst von Brand <vonbrand@inf.utfsm.cl>, Jamie Lokier <jamie@shareable.org>, David Masover <ninja@slaphack.com>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Thu, Sep 02, 2004 at 04:57:06PM -0400, Lee Revell wrote:

> How are permissions handled?  If root lists the contents of a tar
> file that is world readable, then joeuser comes along and does the
> same, can joeuser sees the cached listing?

everyone has their own cache i guess, works well enough elsewhere

also, am i the only person scared by the code complexity when it comes
to root and setuid code here?  sounds like a disaster waiting to
happen
