From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: Novice question
Date: Thu, 07 Apr 2005 02:07:41 +0400
Message-ID: <m18y3vimoi.fsf@clusterfs.com>
References: <42545769.8000804@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23790-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42545769.8000804@namesys.com> (Nate Diller's message of "Wed,
 06 Apr 2005 14:40:57 -0700")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nate Diller <ndiller@namesys.com>
Cc: reiserfs-list@namesys.com, Vladimir Saveliev <vs@namesys.com>

Nate Diller <ndiller@namesys.com> writes:

>
> Node: Implemented as a file system block, the basic unit for the tree.
> On x86, a node is 4KiB in size, however, there is no restriction on
> it's size (is that true?), and there is no design restriction

In current implementation node is bound to of the same size as page in
the page cache on the underlying platform, but this is not design
restriction.

>

[...]

>
> Key: Every item has exactly one key, which is it's non-unique
> identifier within the tree.  When the semantic layer wants to store

Every _unit_ has exactly one key. Item spans key-range covered by its
units.

> data, it asks the key assignment plugin for a key, and then invokes

there is no key assignment plugin... yet. Key assignment is hard-coded.

[...]

>
> Directory: Directory objects map a set of strings (names) to their
> corresponding objectID(?).  The hash plugin is specified per directory

Hash plugin is specified for one particular instance of directory
plugin: hashed-directory plugin. Other directory plugins may use
completely different indexing techniques.

Nikita.
