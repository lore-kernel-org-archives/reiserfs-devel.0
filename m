From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: ReiserFSchk "Should not happen."
Date: Mon, 23 Jun 2003 23:30:49 +0400
Message-ID: <200306232330.49898.vitaly@namesys.com>
References: <20030623180547.GA25393@atlantis.dolphins.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14677-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030623180547.GA25393@atlantis.dolphins.ch>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Philipp Morger <philipp.morger@dolphins.ch>
Cc: reiserfs-list@namesys.com


Hi,

> do_pass_2: The block (2184831) is in the tree already. Should not happen.
> do_pass_2: The block (2184831) is in the tree already. Should not happen.
> do_pass_2: The block (2184831) is in the tree already. Should not happen.
> do_pass_2: The block (2184831) is in the tree already. Should not happen.
> --- 2,6GB of log truncated --

We experienced that with 3.6.4 reiserfsprogs package from Debian as they 
applied some faulty patch to it. Would you try reiserfsprogs-3.6.8 from our 
ftp site and email me about the result?

-- 
Thanks,
Vitaly Fertman
