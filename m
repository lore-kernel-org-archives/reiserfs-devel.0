From: Hans Reiser <reiser@namesys.com>
Subject: Re: [PATCH 3/5] reiserfs: rework reiserfs_warning
Date: Mon, 18 Jul 2005 12:32:28 -0700
Message-ID: <42DC03CC.5000502@namesys.com>
References: <20050718174230.GA23863@locomotive.unixthugs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25186-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050718174230.GA23863@locomotive.unixthugs.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Jeff, thanks so kindly for cleaning all this up, it must have been very
tedious, so extra thanks for it.

I will now quibble about some trivia....

Hans

Jeff Mahoney wrote:

> ReiserFS warnings can be somewhat inconsistent.
> In some cases:
> * a unique identifier may be associated with it
> * the function name may be included
> * the device may be printed separately
>
> This patch aims to make warnings more consistent. reiserfs_warning() prints
> the device name, so printing it a second time is not required. The function
> name for a warning is always helpful in debugging, so it is now automatically
> inserted into the output. Hans has stated that every warning should have
> a unique identifier. Some cases lack them, others really shouldn't have them.
>  
>
What cases should not have them?

> reiserfs_warning() now expects an id associated with each message. In the
> event that it is missing, MISSING_ID is used. In the case where one is simply
> not desired, NO_ID is used. Both of these are currently #define'd to NULL,
> but may be changed in the future.
>  
>

