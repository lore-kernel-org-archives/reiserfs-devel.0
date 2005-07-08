From: Stefan Traby <stefan@hello-penguin.com>
Subject: Re: [PATCH] reiserfs: on-demand bitmap loading (testing only)
Date: Fri, 8 Jul 2005 08:04:37 +0200
Message-ID: <20050708060437.GA15687@hello-penguin.com>
References: <42CC4B7F.2070506@suse.com> <42CC5F1E.6060505@namesys.com> <200507080935.28944.zam@namesys.com>
Reply-To: Stefan Traby <stefan@hello-penguin.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-25054-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200507080935.28944.zam@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Zarochentsev <zam@namesys.com>
Cc: Hans Reiser <reiser@namesys.com>, Elena Gryaznova <grev@namesys.com>, reiserfs-list@namesys.com, Jeff Mahoney <jeffm@suse.com>

On Fri, Jul 08, 2005 at 09:35:28AM +0400, Alexander Zarochentsev wrote:

> Lena, may you check how the bitmap on-demand loading patch affects, say,
> mongo results for reiserfs?

Alex, it seems that to share Jeff's view - for me it's a question of
correctness.
You can't test correctness with benchmarks - well except your
name is Yury -> http://oesiman.de/last-words-1.html
:)

-- 

  ciao - 
    Stefan
