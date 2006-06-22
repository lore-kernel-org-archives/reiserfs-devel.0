From: "Alexey Polyakov" <alexey.polyakov@gmail.com>
Subject: Re: Reiser4 for 2.6.17 Vanilla?
Date: Thu, 22 Jun 2006 18:00:09 +0400
Message-ID: <b5d90b2a0606220700p3443fb7fxdd8108500cb3331@mail.gmail.com>
References: <200606220955.06975.rmeijer@internet.gr>
	 <20060622125029.GA11656@hermes.uziel.local>
	 <200606221641.14242.rmeijer@internet.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28834-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200606221641.14242.rmeijer@internet.gr>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Raymond A. Meijer" <rmeijer@internet.gr>
Cc: reiserfs-list@namesys.com

On 6/22/06, Raymond A. Meijer <rmeijer@internet.gr> wrote:

> The thing is, I want to use 2.6.17-ck1 as well... I'll give it a shot with
> this patch and see what happens :)

There should be one failed chunk (mm/readahead.c), just ignore it.

-- 
Alexey Polyakov
