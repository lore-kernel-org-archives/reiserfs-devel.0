From: bscott@ntisys.com
Subject: Re: what do you do that stresses your filesystem?
Date: Mon, 23 Dec 2002 09:44:51 -0500 (EST)
Sender: bscott@ntisys.com
Message-ID: <Pine.LNX.4.44.0212230848030.29660-100000@dragon.inside.ntisys.com>
References: <3E06F360.7000708@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12216-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E06F360.7000708@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS <reiserfs-list@namesys.com>

On Mon, 23 Dec 2002, at 2:28pm, reiser@namesys.com wrote:
> We were discussing how to optimize reiser4 best, and came to realize that
> us developers did not have a good enough intuition for what users do that
> stresses their filesystem enough that they care about its performance.

  Define "users".

  Even a moderately large mailserver will have many simultaneous opens,
reads, rewrites, creates, unlinks, and so on happening at once.  Depending
on the type of mailbox storage format in use, the patterns are slightly
different.  Traditional BSD mbox does a lot of sequential file reading, does
appends on new messages, and typically rewrites the whole file when deleted
messages are purged.  The maildir and mh formats, on the other hand, have
many smaller files.  Reading the mail index involves lots of open/read-one-
-or-two-blocks/close operations in sequence.  New messages creates files;
purging old ones deletes them.

-- 
Ben Scott <bscott@ntisys.com>
| The opinions expressed in this message are those of the author and do not |
| necessarily represent the views or policy of any other person, entity or  |
| organization.  All information is provided without warranty of any kind.  |


