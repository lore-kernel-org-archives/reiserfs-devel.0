From: Li zeming <zeming@nfschina.com>
Subject: Re: [PATCH] reiserfs: journal: Increase jl pointer check
Date: Wed, 26 Oct 2022 09:47:26 +0800
Message-ID: <20221026014727.3020-1-zeming@nfschina.com>
References: <166673341340.7585.173987927705263434@noble.neil.brown.name>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <166673341340.7585.173987927705263434@noble.neil.brown.name>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: neilb@suse.de
Cc: bvanassche@acm.org, jlayton@kernel.org, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, song@kernel.org, willy@infradead.org


I'm sorry, I think __GFP_NOFAIL should be like this:

The __GFP_NOFAIL flag will cause memory to be allocated an infinite
 number of times until the allocation is successful, but it is best to
 use it only for very necessary code, and try not to use it.

I'm not sure alloc_journal_list function is a very important function
 here. If it is, this patch ignores it and does not consider it anymore
 __GFP_NOFAIL allocatiIon problem.

