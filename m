From: Kevin Bealer <kevinbealer@yahoo.com>
Subject: Re: Split Trees (my design, similar to binary treaps)
Date: Fri, 23 May 2003 11:56:41 -0700 (PDT)
Message-ID: <20030523185641.91230.qmail@web40020.mail.yahoo.com>
References: <10375659311-BeMail@cr593174-a>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14236-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <10375659311-BeMail@cr593174-a>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Alexander G. M. Smith" <agmsmith@rogers.com>, Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com


As Alexander said, data can be in the node or
elsewhere in
either a skip list or skip tree.  Skip List nodes are
variable
sized; skip tree nodes are uniform, three pointers +
data.
(Unless the data is variable sized).

Skip Lists look like:

XX-----X-----X
X--X--X--X--X--X--X--X


--- "Alexander G. M. Smith" <agmsmith@rogers.com>
wrote:
> Hans Reiser wrote on Fri, 23 May 2003 02:48:05
> +0400:
> > Do nodes contain both pointers and data?
> 
> Yes, that's a common way of doing skip lists.  Or
> the node could contain
> the level pointers and a data pointer.  The nodes
> are also awkwardly
> variable sized due to the random number of levels. 
> That leads to
> allocation fragmentation unless extra steps are
> taken.
> 
> I don't know how the split trees approach does it.
> 
> - Alex


__________________________________
Do you Yahoo!?
The New Yahoo! Search - Faster. Easier. Bingo.
http://search.yahoo.com
