From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: What does reiserfs_do_truncate do?
Date: Thu, 07 Apr 2005 16:24:09 +0400
Message-ID: <1112876648.3777.32.camel@tribesman.namesys.com>
References: <f8ad67b305040623316b328b52@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23799-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <f8ad67b305040623316b328b52@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Kathy KN (HK)" <kathy.kn@gmail.com>
Cc: reiserfs-list@namesys.com

Hello

On Thu, 2005-04-07 at 10:31, Kathy KN (HK) wrote:
> Good day all,
> 
> I know that reiserfs_do_truncate is used to truncate
> the tails of arbitrary files, but what does truncation
> really do? 

reiserfs stores files as a set of items in a filesystem tree which is
built of disk blocks.

reiserfs_do_truncate removes from the tree items (or part of items) of
file which represent portion of file which is to be truncated.

> Is it an action to remove the file? 

it is to make file of shorter size. File deletion uses it to make file
of zero length - that is to remove all file items.

> What do
> you mean by packing the tails? 

packing tails in reiserfs means to store last incomplete block of file
in a formatted node(s) so that one formatted node may contains tails of
several files.

> Compressing it or
> to delete them or?
> 
> Kathy
> 

