From: Oleg Drokin <green@namesys.com>
Subject: Re: kernel error messages
Date: Mon, 14 Jul 2003 12:46:57 +0400
Message-ID: <20030714084657.GA13365@namesys.com>
References: <200307140806.14775.russell@coker.com.au>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14926-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200307140806.14775.russell@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Russell Coker <russell@coker.com.au>
Cc: ReiserFS <reiserfs-list@namesys.com>

Hello!

On Mon, Jul 14, 2003 at 08:06:14AM +1000, Russell Coker wrote:
> kernel: is_tree_node: node level 35586 does not match to the expected one 1
> kernel: vs-5150: search_by_key: invalid format found in block 107509. Fsck?
> kernel: is_tree_node: node level 35586 does not match to the expected one 1
> kernel: vs-5150: search_by_key: invalid format found in block 107509. Fsck?
> Messages such as the above should include information on which file system has 
> the error, otherwise we don't know which one to fsck...

Fixed in 2.4.22-pre3

Bye,
    Oleg
